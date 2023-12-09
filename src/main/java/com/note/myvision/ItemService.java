package com.note.myvision;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
@Transactional
public class ItemService {

  @Autowired
  ItemRepository repository;

  @Autowired
  ResourceRepository resRepository;

  @Autowired
  EventService eventService;

  @Autowired
  EventRepository eventRepository;

  @Autowired
  CategoryService catService;

  @Autowired
  CategoryRepository catRepository;  

  public List<Item> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<Item> find(String id){
    return repository.findById(Utl.parseInt(id));
  }
  
  public ItemView findWithResource(Integer id){
    Optional<Item> res = repository.findById(id);
    if(res.isPresent()) { 
      Item item = res.get();
      ItemView iv = new ItemView();
      Utl.copyPropertiesIgnoreNull(item, iv);
      List<Item> is = repository.findByParentId(item.getId());
      iv.setItems(is);
      List<Resource> rs = resRepository.findByParentIdOrderByIndexAscDateDesc(item.getId());
      iv.setResources(rs);
      List<Event> es = eventService.findListByParentId(item.getId());
      iv.setEvents(es);
      return iv;
    }

    return new ItemView();
  }

  public void save(Item b, Resource c) {
    repository.save(b);
    c.setParentId(b.getId());
    resRepository.save(c);
  }

  public void save(Item p)
  {
    if(Utl.check(p.getId()))
    {
      // repository.findById(p.getId()).ifPresent( res -> {
      //   if(!res.getName().equals(p.getName()))
      //   {
      //     eventService.updateEventName(res.getName(), p.getName());
      //   }
      // });

      Optional<Item> res = repository.findById(p.getId());
      if(res.isPresent())
      {
        Item r = res.get();
        Utl.copyPropertiesIgnoreNull(p, r);
        r.setParentId(p.getParentId());
        r.setItemCategoryId(p.getItemCategoryId());
        if("null".equals(p.getSystemUrl())) r.setSystemUrl(null);
        repository.save(r);
      }
      else
      {
        //throw new Exception("Cannot found item of id" + p.getId() );
      }
    }
    else
    {
      // List<EventView> res = eventService.findByName(p.getName());
      // if(res.size() == 0)
      // {
      //   EventView v = new EventView(p.getName(), p.getCategory(), p.getStatus(), "Collection", LocalDate.now().toString(), "0.1", "", "", "");
      //   eventService.save(v);
      // }
      if(!Utl.check(p.getName())) {
        return ;
      }

      if(!Utl.check(p.getDate()))
        p.setDate(LocalDate.now().toString());
      if(!Utl.check(p.getReleaseDate())) {
        p.setReleaseDate(p.getDate());
      }

      repository.save(p);
    }
  }

  public void save(Resource c)
  {
    if(c.getDate().isEmpty())
      c.setDate(LocalDate.now().toString());
    c.setUpdateDate(LocalDate.now().toString());
    resRepository.save(c);
  }

  public void save(Resource c, Item p)
  {
    c.setParentId(p.getId());
    resRepository.save(c);
  }

  // public void saveAll(List<Item> list) {
  //   for(Item p : list)
  //   {
  //       repository.save(p);
  //   }
  // }

  public void delete(String id) {

    //check
    int itemId = Utl.parseInt(id);
    List<Event> events = eventRepository.findByParentIdOrderByDateAsc(itemId);
    if(events.size() > 0) {
      return ;
    }
    List<Resource> resources = resRepository.findByParentId(itemId);
    if(resources.size() > 0) {
      return ;
    }
    repository.deleteById(itemId);
  }

  public boolean checkChild(int id) {

    //check
    List<Item> items = repository.findByParentId(id);
    if(items.size() > 0) {
      return true;
    }    

    List<Event> events = eventRepository.findByParentIdOrderByDateAsc(id);
    if(events.size() > 0) {
      return true;
    }
    List<Resource> resources = resRepository.findByParentId(id);
    if(resources.size() > 0) {
      return true;
    }

    return false;
  }

  // public void insert(String id, String date)
  // {

  // }

  // public void createByEvent(EventView vBean)
  // {
  //   List<Item> res = repository.findByNameOrName2(vBean.getName(), vBean.getName());
  //   if(res.size() == 0)
  //   {
  //     Item c = new Item();
  //     c.setName(vBean.getName());
  //     c.setCategory(vBean.getRelatedCatName());      
  //     c.setCategoryId(vBean.getRelatedCatId());
  //     c.setMemo("");
  //     if(vBean.getMemo() != null)
  //       c.setMemo(vBean.getMemo());
  //     c.setName2("");
  //     c.setLevel(1);
  //     c.setDate(vBean.getDate());
  //     c.setReleaseDate(vBean.getDate());
  //     repository.save(c);
  //     vBean.setRelatedItemId(c.getId());
  //     vBean.setRelatedItemName(c.getName());
  //   }    
  // }

  // public CategoryView findAllInGroup(String CName, String category, String date) {
  //   CategoryView c = catService.findByNameWithCategory(CName);
  //   CategoryView res = findGroup(c, category, -9);
  //   if(res == null) 
  //     return c;
  //   else 
  //     return res;
  // }

  public CategoryView findGroupByCategoryId(int catId, int level) {
    Optional<Category> opt = catRepository.findById(catId);
    if(opt.isPresent()) {
      catService.sortCategory(opt.get());
      CategoryView cat = new CategoryView(opt.get());
      Counter counter = new Counter();
      AddItemToGroup(cat, level, counter);
      cat.setCount(counter.getCount());
      return cat;
    }
    return null;
  }

  public CategoryView findGroup(CategoryView c, String category, int level) {
    if(c.getName().equals(category)) {
      AddItemToGroup(c, level, new Counter());
      return c;
    }
    for(CategoryView cat : c.getChildren()) {
      CategoryView res = findGroup(cat, category, level);
      if(res == null) {
        continue;
      } else {
        return res;
      }
    }
    return null;
  }

  // public CategoryView findAllInGroupAboveLevel(String CName, String category, String level) {

  //   int lv = Utl.parseInt(level);
  //   CategoryView c = catService.findByNameWithCategory(CName);
  //   CategoryView res = findGroup(c, category, lv);
  //   if(res == null) 
  //     return c;
  //   else 
  //     return res;
  // }

  public void AddItemToGroup(CategoryView group, int level, Counter counter)
  {
    if(group == null)
        return;
    List<Item> list = repository.findByItemCategoryIdAndLevelGreaterThan(group.getId(), level);
    List<Object> objList = group.getItems();
    for(Item p : list)
    {
      objList.add(p);
    }
    group.setItems(objList);
    counter.setCount(counter.getCount() + list.size());
    if(group.getChildren() != null)
    {
        for(CategoryView child : group.getChildren())
        {
          AddItemToGroup(child, level, counter);
        }
    }
  }

  public Optional<Resource> findChild(String id) {
    return resRepository.findById(Utl.parseInt(id));
  }

  public void updateItemList(List<Integer> idList, Integer catId, Integer parentId, Integer level, Boolean deleteFlg) {
    if(!Utl.check(catId) && !Utl.check(parentId) && !deleteFlg)
      return;

    for(Integer id : idList) {
      if(Utl.check(id)) {
        repository.findById(id).ifPresent( item -> {

          if(deleteFlg) {
            repository.delete(item);
          } else {
            if(Utl.check(catId)) {
              item.setItemCategoryId(catId);
              item.setItemCategory(catRepository.findCatName(catId));
            }
            if(Utl.check(parentId)) {
              item.setItemCategoryId(0);
              item.setParentId(parentId);
              item.setParentName(repository.findItemName(parentId));
            }
            if(level != null) {
              item.setLevel(level);
            }
            repository.save(item);
          }
        });
      }
    }
  }

  public CategoryView findUnsortedItems() {
    CategoryView diagram = new CategoryView();
    List<Object> ls = new ArrayList<Object>();
    diagram.setName("Unsorted");
    List<Item> items = repository.findUnsortedItems();
    for(Item i : items) {
      ls.add(i);
    }
    diagram.setItems(ls);
    return diagram;
  }
  
  public boolean mergeItem(Integer id1, Integer id2){
    Optional<Item> res = repository.findById(id1);
    Optional<Item> res2 = repository.findById(id2);
    if(res.isPresent() && res2.isPresent()) { 
      Item item = res.get();
      Item item2 = res2.get();
      if(!Utl.check(item.getName()) && Utl.check(item2.getName2())) {
        item.setName2(item2.getName2());
      }
      if(Utl.check(item2.getMemo())) {
        item.setMemo(item.getMemo()+item2.getMemo());
      }
      if(item.getDate().compareTo(item2.getDate()) > 0) {
        item.setDate(item2.getDate());
      }
      if(item.getLevel() < item2.getLevel()) {
        item.setLevel(item2.getLevel());
      }
      if(!Utl.check(item.getType()) && Utl.check(item2.getType())) {
        item.setType(item2.getType());
      }
      if(!Utl.check(item.getEventCategoryId()) && Utl.check(item2.getEventCategoryId())) {
        item.setEventCategoryId(item2.getEventCategoryId());
      }
      if(!Utl.check(item.getTopicCategoryId()) && Utl.check(item2.getTopicCategoryId())) {
        item.setTopicCategoryId(item2.getTopicCategoryId());
      }
      if(!Utl.check(item.getStatus()) && Utl.check(item2.getStatus())) {
        item.setStatus(item2.getStatus());
      }
      List<Item> is = repository.findByParentId(item2.getId());
      for(Item s : is) {
        s.setParentId(item.getId());
        s.setParentName(item.getName());
        repository.save(s);
      }
      List<Resource> rs = resRepository.findByParentIdOrderByIndexAscDateDesc(item2.getId());
      for(Resource s : rs) {
        s.setParentId(item.getId());
        resRepository.save(s);
      }
      List<Event> es = eventRepository.findByParentIdOrderByDateAsc(item2.getId());
      for(Event s : es) {
        s.setParentId(item.getId());
        eventRepository.save(s);
      }
      repository.delete(item2);
      return true;
    }

    return false;
  }
}