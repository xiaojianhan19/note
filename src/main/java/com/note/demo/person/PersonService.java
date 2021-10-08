package com.note.demo.person;

import java.util.List;
import java.util.Optional;
import javax.transaction.Transactional;

import com.note.demo.Utl;
import com.note.demo.category.CategoryChildBean;
import com.note.demo.category.CategoryParentBean;
import com.note.demo.category.CategoryService;
import com.note.demo.category.CategoryViewBean;
import com.note.demo.event.EventParentBean;
import com.note.demo.event.EventService;
import com.note.demo.event.EventViewBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
@Transactional
public class PersonService {

  @Autowired
  PersonRepository repository;

  @Autowired
  CategoryService catService;

  @Autowired
  EventService eventService;

  public List<PersonParentBean> findAll() {
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  // public PersonGroupBean findAllInGroup(String date) {
  //   CategoryParentBean p = catService.findByNameAndDate("Person", date);
  //   PersonGroupBean group = new PersonGroupBean(p.getItem());
  //   AddPersonToGroup(group);
  //   return group;
  // }

  // private void AddPersonToGroup(PersonGroupBean group)
  // {
  //   if(group == null)
  //       return;
  //   List<PersonParentBean> list = repository.findByCategory(group.getName());
  //   group.setItems(list);
  //   if(group.getChildren() != null)
  //   {
  //       for(PersonGroupBean child : group.getChildren())
  //       {
  //           AddPersonToGroup(child);
  //       }
  //   }
  // }

  public CategoryViewBean findAllInGroup(String pName,String groupName, String date) {
    CategoryChildBean c = catService.findByParentAndNameAndDate(pName, groupName, date);
    CategoryViewBean group = new CategoryViewBean(c);
    AddPersonToGroup(group);
    return group;
  }

  private void AddPersonToGroup(CategoryViewBean group)
  {
    if(group == null)
        return;
    List<PersonParentBean> list = repository.findByCategory(group.getName());
    List<Object> objList = group.getItems();
    for(PersonParentBean p : list)
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

  public Optional<PersonParentBean> find(String id) {
    return repository.findById(Utl.parseInt(id));
  }

  public void save(PersonParentBean p) {
    if(Utl.check(p.getId()))
    {
      repository.findById(p.getId()).ifPresent( res -> {
        if(!res.getName().equals(p.getName()))
        {
          eventService.updateEventName(res.getName(), p.getName());
        }
      });;
    }
    else
    {
      List<EventViewBean> res = eventService.findByName(p.getName());
      if(res.size() == 0)
      {
        String inputDate = ("").equals(p.getInputDate()) ? LocalDate.now().toString() : p.getInputDate();
        EventViewBean v = new EventViewBean(p.getName(), "Communicate", p.getStatus(), "Person", inputDate, "0.1", "");
        eventService.save(v);
      }
    }

    if(p.getInputDate().isEmpty())
      p.setInputDate(LocalDate.now().toString());      
    repository.save(p);
  }

  // public void update(PersonParentBean p) {
  //   if(Utl.check(p.getId()))
  //   {
  //     repository.findById(p.getId()).ifPresent( res -> {
  //       if(!res.getName().equals(p.getName()))
  //       {
  //         eventService.updateEventName(res.getName(), p.getName());
  //       }
  //     });;
  //   }
  //   if(p.getInputDate().isEmpty())
  //     p.setInputDate(LocalDate.now().toString());      
  //   repository.save(p);
  // }
  
  // public void saveAll(List<PersonParentBean> list) {
  //   for(PersonParentBean p : list)
  //   {
  //       repository.save(p);
  //   }
  // }

  public List<EventViewBean> findEventList(PersonParentBean p)
  {
    List<EventViewBean> list = eventService.findByName(p.getName());
    if(!p.getName2().isEmpty())
      list.addAll(eventService.findByName(p.getName2()));
    if(!p.getName3().isEmpty())
      list.addAll(eventService.findByName(p.getName3()));
    eventService.sortByDate(list);
    return list;
  }

  public void createByEvent(EventViewBean vBean)
  {
    if(!vBean.getSorted().equals("Person"))
    { 
      return ;
    }

    List<PersonParentBean> res = repository.findByNameOrName2(vBean.getName(), vBean.getName());
    if(res.size() == 0)
    {
      PersonParentBean p = new PersonParentBean();
      p.setName(vBean.getName());
      p.setCategory(vBean.getSortedCategory());
      p.setStatus("");
      p.setName2("");
      p.setName3("");
      p.setAddress("");
      p.setInputDate(vBean.getDate());
      p.setMemo("");
      if(vBean.getMemo() != null)
        p.setMemo(vBean.getMemo());
      repository.save(p);
    }    
  }


}