package com.note.demo.collection;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.transaction.Transactional;

import com.note.demo.Utl;
import com.note.demo.category.CategoryParentBean;
import com.note.demo.category.CategoryService;
import com.note.demo.category.CategoryViewBean;
import com.note.demo.event.EventService;
import com.note.demo.event.EventViewBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
@Transactional
public class CollectionService {

  @Autowired
  CollectionParentRepository repository;

  @Autowired
  CollectionChildRepository itemRepository;

  @Autowired
  EventService eventService;

  @Autowired
  CategoryService catService;

  public List<CollectionParentBean> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<CollectionParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public List<CollectionChildBean> findByInputDate(String date) {
    return itemRepository.findByInputDateOrderByParent(date);
  }

  public void save(CollectionParentBean b, CollectionChildBean c) {
    repository.save(b);
    c.setParent(b);
    itemRepository.save(c);
  }

  public void save(CollectionParentBean p)
  {
    if(Utl.check(p.getId()))
    {
      repository.findById(p.getId()).ifPresent( res -> {
        if(!res.getName().equals(p.getName()))
        {
          eventService.updateEventName(res.getName(), p.getName());
        }
      });

      Optional<CollectionParentBean> res = repository.findById(p.getId());
      if(res.isPresent())
      {
        CollectionParentBean r = res.get();
        Utl.copyPropertiesIgnoreNull(p, r);
        repository.save(r);
      }
      else
      {
        //hrow new Exception("Cannot found item of id" + p.getId() );
      }
    }
    else
    {
      List<EventViewBean> res = eventService.findByName(p.getName());
      if(res.size() == 0)
      {
        EventViewBean v = new EventViewBean(p.getName(), p.getCategory(), p.getStatus(), "Collection", LocalDate.now().toString(), "0.1", "");
        eventService.save(v);
      }
      if(p.getInputDate().isEmpty())
        p.setInputDate(LocalDate.now().toString());      
      repository.save(p);
    }
  }

  public void save(CollectionChildBean c)
  {
    if(c.getInputDate().isEmpty())
      c.setInputDate(LocalDate.now().toString());
    c.setUpdateDate(LocalDate.now().toString());
    itemRepository.save(c);
  }

  public void save(CollectionChildBean c, CollectionParentBean p)
  {
    c.setParent(p);
    itemRepository.save(c);
  }

  // public void saveAll(List<CollectionParentBean> list) {
  //   for(CollectionParentBean p : list)
  //   {
  //       repository.save(p);
  //   }
  // }

  public void delete(String id) {
    repository.deleteById(Utl.parseInt(id));
  }

  public void insert(String id, String date)
  {

  }

  public void createByEvent(EventViewBean vBean)
  {
    List<CollectionParentBean> res = repository.findByNameOrName2AndCategory(vBean.getName(), vBean.getName(), vBean.getCategory());
    if(res.size() == 0)
    {
      CollectionParentBean c = new CollectionParentBean();
      c.setName(vBean.getName());
      c.setCategory(vBean.getCategory());
      c.setStatus(vBean.getStatus());
      c.setMemo("");
      if(vBean.getMemo() != null)
        c.setMemo(vBean.getMemo());
      c.setName2("");
      c.setName3("");
      c.setLevel(1);
      c.setInputDate(vBean.getDate());
      c.setReleaseDate("0001-01-01");
      repository.save(c);
    }    
  }

  public CategoryViewBean findAllInGroup(String category, String date) {
    CategoryParentBean p = catService.findByNameAndDate(category, date);
    CategoryViewBean group = new CategoryViewBean(p.getItem());
    AddPersonToGroup(group);
    return group;
  }

  public void AddPersonToGroup(CategoryViewBean group)
  {
    if(group == null)
        return;
    List<CollectionParentBean> list = repository.findByCategory(group.getName());
    List<Object> objList = group.getItems();
    for(CollectionParentBean p : list)
    {
      objList.add(p);
    }
    group.setItems(objList);
    if(group.getChildren() != null)
    {
        for(CategoryViewBean child : group.getChildren())
        {
            AddPersonToGroup(child);
        }
    }
  }

  public List<CollectionParentBean> findUnsortedItems() {
    List<String> catList = new ArrayList<String>();
    Map<String, String> map1 = catService.GetCategoryMapByName("Collection", LocalDate.now().toString());
    for(String value : map1.values()){
      catList.add(value);
    }
    Map<String, String> map2 = catService.GetCategoryMapByName("Achievement", LocalDate.now().toString());
    for(String value : map2.values()){
      catList.add(value);
    }
    return repository.findByCategoryNotIn(catList);
  } 

  public CollectionParentBean modifyBean(CollectionParentBean b) {
    CollectionParentBean newBean = new CollectionParentBean(b);
    for(CollectionChildBean child : newBean.getItems())
    {
      if(child.getMemo().length() > 50) {
        child.setMemo(child.getMemo().substring(0, 50));
      }
    }
    return newBean;
  }

  public Optional<CollectionChildBean> findChild(String id) {
    return itemRepository.findById(Utl.parseInt(id));
  }

}