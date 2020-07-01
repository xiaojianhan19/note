package com.note.demo.event;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.transaction.Transactional;

import com.note.demo.Utl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class EventService {

  @Autowired
  EventParentRepository repository;

  @Autowired
  EventChildRepository itemRepository;

  public static int showMode = 0;

  public List<EventParentBean> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<EventParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public List<EventChildBean> findByDate(String date) {
    List<EventChildBean> list = itemRepository.findByDateOrderByParent(date);
    if(showMode == 0 && LocalDate.now().toString().equals(date))
    {
      List<String> targetStatus = new ArrayList<String>(Arrays.asList(
        Utl.Status.EV1_ONPROCESS.getValue(),
        Utl.Status.EV2_CURRENT.getValue(),
        Utl.Status.EV6_LOOKBACK.getValue(),
        Utl.Status.EV9_REGULAR.getValue()
         ));
      for(String status : targetStatus)
      {
        List<EventParentBean> tmpList = repository.findByStatus(status);
        for(EventParentBean p : tmpList)
        {
          boolean isFound = false;
          for(EventChildBean c : list)
          {
            if(c.getParent().getId() == p.getId()
              || (c.getParent().getName().equals(p.getName()) && c.getParent().getCategory().equals(p.getCategory())))
            {
              isFound = true;
              break;
            }
          }
          if(!isFound)
          {
            list.add( new EventChildBean(date, p));
          }          
        }
      }
    }

    return list;
  }


  // public void save(EventParentBean b, EventChildBean c) {
  //   repository.save(b);
  //   c.setEvent(b);
  //   itemRepository.save(c);
  // }  

  // public void save(EventChildBean c)
  // {
  //   itemRepository.save(c);
  // }

  // public void save(EventChildBean c, EventParentBean p)
  // {
  //   c.setEvent(p);
  //   itemRepository.save(c);
  // }

  public void save(List<EventViewBean> list) {
    for(EventViewBean p : list)
    {
        this.save(p);
    }
  }

  public void saveAll(List<EventParentBean> list) {
    for(EventParentBean p : list)
    {
        repository.save(p);
    }
  }

  public void save(EventViewBean vBean)
  {
    // Find
    EventParentBean event = null;
    EventChildBean child = null;
    if(Utl.check(vBean.getId()))
    {
      Optional<EventParentBean> res = repository.findById( Utl.parseInt(vBean.getId()));
      if(res.isPresent())
      {
        event = res.get();
      }
    }
    else if(Utl.check(vBean.getName()) && Utl.check(vBean.getCategory()))
    {
      List<EventParentBean> events = repository.findByNameAndCategory(vBean.getName(), vBean.getCategory());
      if(events.size() > 0)
      {
        event = events.get(0);
      }
    }

    // Set
    if(event != null)
    {
      // update
      Boolean noExist = true;
      for(EventChildBean ev : event.getItems())
      {
        if(vBean.getDate().equals(ev.getDate().toString()))
        {
          noExist = false;
          if(Utl.check(vBean.getMemo()) || Utl.check(Utl.parseDouble(vBean.getTime())))
          {
            ev.setMemo(vBean.getMemo());
            ev.setTime(Utl.parseDouble(vBean.getTime()));
          }
          break;
        }
      }
      if(noExist && vBean.getDate() != null && ( Utl.check(Utl.parseDouble(vBean.getTime())) || Utl.check(vBean.getMemo())))
      {
         child = new EventChildBean(vBean, event);
         itemRepository.save(child);
      }

      if(Utl.check(vBean.getName()))
      {
        if(!event.getName().equals(vBean.getName()))
          event.setName(vBean.getName());
      }
      if(Utl.check(vBean.getCategory()))
      {
        if(!event.getCategory().equals(vBean.getCategory()))
          event.setCategory(vBean.getCategory());
      }      
      if(Utl.check(vBean.getStatus()))
      {
        if(!event.getStatus().equals(vBean.getStatus()))
          event.setStatus(vBean.getStatus());
      }
      if(Utl.check(vBean.getSorted()))
      {
        if(!event.getSorted().equals(vBean.getSorted()))
          event.setSorted(vBean.getSorted());
      }
    }
    else
    {
      // add  
      event = new EventParentBean(vBean);
      if(!Utl.check(event.getSorted()))
      {
        event.setSorted("1");
      }

      child = new EventChildBean(vBean, event);
    }

    if(event != null && Utl.check(event.getName()) && Utl.check(event.getCategory()))
    {
      repository.save(event);
    }

    if(child != null && (Utl.check(child.getTime()) || Utl.check(child.getMemo())))
    {
      itemRepository.save(child);
    }
  }

  public void delete(String id) {
    repository.deleteById(Utl.parseInt(id));
  }


  public List<EventViewBean> findTargets(String name)
  {
    List<EventViewBean> refEvents = new ArrayList<EventViewBean>();

    List<EventParentBean> events = repository.findByNameContaining(name);
    for(EventParentBean ev : events)
    {
      refEvents.add(new EventViewBean(ev));
    }
    return refEvents;
  }

  public void insert(String id, String date)
  {
    Optional<EventParentBean> res = repository.findById( Utl.parseInt(id));
    if(res.isPresent())
    {
      EventParentBean event = res.get();
      EventChildBean child = new EventChildBean(date, event);
      itemRepository.save(child);
    }
  }

  public void sortByCategory(List<EventViewBean> list, Map<String, String> catList)
  {
    list.sort( (a,b)-> {
      if(!a.getCategory().equals(b.getCategory()))
      {
        String keyA = Utl.getMapKeyByValue(catList, a.getCategory());
        String keyB = Utl.getMapKeyByValue(catList, b.getCategory());
        return keyA.compareTo(keyB);
      }
      return a.getName().compareTo(b.getName());
    });
  }

  public void deleteItem(EventChildBean ev)
  {
    // if(ev.getPerson() != null)
    // {
    //   itemRepository.deleteByPerson(ev.getPerson().getId());
    // }
    // if(ev.getCollection() != null)
    // {
    //   itemRepository.delteByCollection(ev.getCollection().getId());
    // }
    itemRepository.delete(ev);
  }
}