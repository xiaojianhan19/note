package com.note.myvision;

import java.lang.reflect.Field;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.Map.Entry;
import javax.transaction.Transactional;

import com.alibaba.fastjson.JSON;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;

import ch.qos.logback.core.joran.conditional.ElseAction;


@Service
@Transactional
public class EventService {

  @Autowired
  ItemRepository itemRepository;

  @Autowired
  EventRepository repository;

  @Autowired
  CategoryService catService;

  public static int showMode = 0;

  public EventService() {
  }

  // public List<Event> findAll(){
  //   return repository.findAll(Sort.by(Direction.ASC, "category"));
  // }

  // public Optional<Event> find(String id){
  //   return repository.findById(Utl.parseInt(id));
  // }

  // public List<Event> findByDate(String date) {
  //   List<Event> list = repository.findByDateWithOnprocess(date);

  //   // oprocess
  //   if(showMode == 0 && LocalDate.now().plusDays(-3).toString().compareTo(date) < 0) {
  //     List<String> statusList = new ArrayList<String>(Arrays.asList(
  //       Utl.Status.EV1_ONPROCESS.getValue(),
  //       Utl.Status.EV2_CURRENT.getValue(),
  //       Utl.Status.EV6_LOOKBACK.getValue(),
  //       Utl.Status.EV9_REGULAR.getValue()
  //        ));

  //     List<Item> tmpList = repository.findByStatusIn(statusList);
  //     for(Item p : tmpList) {
  //       boolean isFound = false;
  //       for(Event c : list) {
  //         if(c.getParentId() == p.getId()) {
  //           isFound = true;
  //           break;
  //         }
  //       }
  //       if(!isFound) {
  //         Event nt = new Event(date, p);
  //         nt.setName("");
  //         list.add(nt);
  //       }
  //     }
  //   }

  //   return list;
  // }

  // public List<Event> findByPeriod(String start, String end) {
  //   List<Time> list = repository.findByDateBetweenOrderByParent(start, end);
  //   List<Event> pList = new ArrayList<Event>();
  //   for(Time ch : list)
  //   {
  //     if(!pList.contains(ch.getParent()))
  //       pList.add(ch.getParent());
  //   }

  //   return pList;
  // }

  // public List<EventView> findByName(String name)
  // {
  //  List<EventView> list = new ArrayList<EventView>();
  //  List<Event> events = repository.findByNameContaining(name);
  //  for(Event ev : events)
  //  {
  //    for(Time ch : ev.getItems())
  //    {
  //      list.add(new EventView(ch));
  //    }
  //  }
  //  return list;
  // }

  public void save(List<EventView> list) {
    for(EventView p : list)
    {
        this.save(p);
    }
  }

  public void save(EventView vBean) {

    Event event = null;
    if(vBean != null && Utl.check(vBean.getId())) {
      Optional<Event> res = repository.findById(vBean.getId());
      if(res.isPresent()) {
        // update
        event = res.get();
        Utl.copyPropertiesIgnoreNull(vBean, event);
        event.setTime(Utl.parseDouble(vBean.getTime()));
      } else {
        return;
      }
    } else {
      // add
      event = new Event();
      Utl.copyPropertiesIgnoreNull(vBean, event);
      event.setTime(Utl.parseDouble(vBean.getTime()));
    }

    if(Utl.check(event.getTime())) {
      if(event.getTime() == -1.0) {
        if(Utl.check(event.getId()))
          repository.delete(event);
      } else {
        repository.save(event);
      }
    }
  }

  // public void saveAll(List<Event> list) {
  //   for(Event p : list)
  //   {
  //       repository.save(p);
  //   }
  // }

  public void save(ItemView vBean)
  {
    // Update EventParent
    Item item = null;
    if(Utl.check(vBean.getId())) {
      Optional<Item> res = itemRepository.findById(vBean.getId());
      if(res.isPresent()) {
        // update
        item = res.get();
        Utl.copyPropertiesIgnoreNull(vBean, item);
      } else {
        return;
      }
    } else {
      // add  
      item = new Item();
      Utl.copyPropertiesIgnoreNull(vBean, item);
    }

    if(Utl.check(vBean.getChangeToDate()) && vBean.getChangeToDate().compareTo(item.getDate()) < 0) {
      item.setDate(vBean.getChangeToDate());
    }

    if(vBean.getTopicCategoryId() == -1 ) {
      item.setTopicCategoryId(0);
    }

    if(Utl.check(item.getName())) {
      itemRepository.save(item);
    }
    
    // Update EventChild
    Event event = null;
    Event newEv = vBean.getEvent();
    if(newEv != null && Utl.check(newEv.getId())) {
      Optional<Event> res = repository.findById(newEv.getId());
      if(res.isPresent()) {
        // update
        event = res.get();
        Utl.copyPropertiesIgnoreNull(newEv, event);
      } else {
        return;
      }
    } else {
      // add  
      event = newEv;
      event.setParentId(item.getId());
    }

    if(Utl.check(vBean.getChangeToDate())) {
      event.setDate(vBean.getChangeToDate());
    }

    if(Utl.check(event.getTime()) || Utl.check(event.getMemo()))
    {
      if(event.getTime() == -1.0)
      {
        if(Utl.check(event.getId()))
          repository.delete(event);
      }
      else
      {
        repository.save(event);
      }
    }
  }

  public List<EventView> findRefEventsByName(String name)
  {
    List<Map<String, Object>> ret = repository.findEventViewByNameContaining(name);
    String js = JSON.toJSONString(ret);
    List<EventView> refEvents = JSON.parseArray(js, EventView.class);
    return refEvents;
  }

  public List<EventView> findRefEventsByEvent(Integer catId, String date)
  {
    String start = LocalDate.now().plusMonths(-2).toString();
    List<Map<String, Object>> ret = repository.findEventViewByEventCategoryIdAndDate(catId, start);
    String js = JSON.toJSONString(ret);
    List<EventView> refEvents = JSON.parseArray(js, EventView.class);
    return refEvents;
  }  

  public List<EventView> findRefEventsByTopic(Integer topicId, String date)
  {
    String start = LocalDate.now().plusMonths(-2).toString();
    List<Map<String, Object>> ret = repository.findEventViewByTopicCategoryIdAndDate(topicId, start);
    String js = JSON.toJSONString(ret);
    List<EventView> refEvents = JSON.parseArray(js, EventView.class);
    return refEvents;
  }

  public void insert(Integer parentId, String date, String name, String time, String eventCategoryId, String topicCategoryId)
  {
    List<Event> res = repository.findByDateAndParentId(date, parentId);
    if(res.size() == 0)
    {      
      Event newEv = new Event();
      newEv.setId(0);
      newEv.setName(name);
      newEv.setDate(date);
      newEv.setType("Event");
      double t = Utl.parseDouble(time);
      t = (Utl.check(t)) ? t : 0.5;
      newEv.setTime(t);
      newEv.setMemo("");
      newEv.setParentId(parentId);
      repository.save(newEv);
    }
  }

  // public void sortByCategory(List<EventView> list, Map<String, String> catList)
  // {
  //   list.sort( (a,b)-> {
  //     if(!a.getCategory().equals(b.getCategory()))
  //     {
  //       String keyA = Utl.getMapKeyByValue(catList, a.getCategory());
  //       String keyB = Utl.getMapKeyByValue(catList, b.getCategory());
  //       return keyA.compareTo(keyB);
  //     }
  //     return a.getName().compareTo(b.getName());
  //   });
  // }

  // public void sortByDate(List<EventView> list)
  // {
  //   list.sort( (a,b)-> {
  //     if(!a.getDate().equals(b.getDate()))
  //     {
  //       return a.getDate().compareTo(b.getDate());
  //     }
  //     return a.getName().compareTo(b.getName());
  //   });
  // }

  // public void sortByLastDate(List<EventView> list)
  // {
  //   list.sort( (a,b)-> {
  //     if(!Utl.check(a.getLastDate()) || !Utl.check(a.getLastDate()))
  //       return a.getName().compareTo(b.getName());

  //     if(!a.getLastDate().equals(b.getLastDate()))
  //     {
  //       return b.getLastDate().compareTo(a.getLastDate());
  //     }
  //     return a.getName().compareTo(b.getName());
  //   });
  // }  

  // public void saveParent(List<EventView> list) 
  // {
  //   for(EventView v : list)
  //   {
  //     Event p = new Event(v);
  //     repository.save(p);
  //   }

  //   for(EventView v : list)
  //   {
  //     List<Event> res = repository.findByNameAndCategoryOrderById(v.getName(), v.getCategory());
  //     if(res.size() > 1)
  //     {
  //       int orgId = 0;
  //       Event org = null;
  //       int maxSize = 0;
  //       for(Event item : res)
  //       {
  //         if(item.getItems() == null)
  //         {
  //           item.setItems(repository.findByParent(item));
  //         }
  //         if(item.getItems().size() > maxSize)
  //         {
  //           maxSize = item.getItems().size();
  //           orgId = item.getId();
  //           org = item;
  //         }
  //       }

  //       for(int i=0; i < res.size(); i++)
  //       {
  //         Event add = res.get(i);
  //         if(add.getId() != orgId)
  //         {
  //           List<Time> chgItems = add.getItems();
  //           int cnt = chgItems.size();
  //           for(int j=0; j < cnt; j++)
  //           {
  //             Time child = chgItems.get(j);
  //             List<Time> orgList = repository.findByDateAndParent(child.getDate(), org);
  //             if(orgList.size() == 0)
  //             {
  //               Time newC = new Time(child, org);
  //               repository.save(newC);
  //             }
  //             else
  //             {
  //               Time newC = orgList.get(0);
  //               newC.setTime(newC.getTime() + child.getTime());
  //               newC.setMemo(newC.getMemo() + child.getMemo());
  //               repository.save(newC);
  //               repository.delete(child);
  //             }
  //           }
  //           repository.delete(add);
  //         }
  //       }
  //     }
  //   }

  // }

  //  public void delete(Event p)
  //  {
  //    for(Time c : p.getItems())
  //    {
  //     repository.delete(c);
  //    }
  //    repository.delete(p);
  //  }

  //  public void deleteItem(Time ev)
  //  {
  //    repository.delete(ev);
  //  }

  //  public void delete(String id) {
  //   repository.deleteById(Utl.parseInt(id));
  // }

  // public void updateEventName(String oldName, String newName)
  // {
  //   List<Event> res = repository.findByName(oldName);
  //   if(res.size() > 0)
  //   {
  //     for(Event p : res)
  //     {
  //       p.setName(newName);
  //       repository.save(p);
  //     }
  //   }
  // }

  public void AddEventToCategory(CategoryView cat, EventView ev)
  {
    if(cat == null)
        return;
    if(cat.getId() == ev.getEventCategoryId()) {
      cat.getItems().add(ev);
      ev.setIsBinded(true);
      return;
    }
    else {
      for(CategoryView child : cat.getChildren()) {
        AddEventToCategory(child, ev);
      }
    }
  }

  public void AddEventToTopic(CategoryView cat, EventView ev)
  {
    if(cat == null)
        return;
    if(cat.getId() == ev.getTopicCategoryId()) {
      cat.getItems().add(ev);
      ev.setIsBinded(true);
      return;
    }
    for(CategoryView child : cat.getChildren()) {
      AddEventToTopic(child, ev);
    }
  }     

  public CategoryView loadCatViewBeanByDate(String date, Integer catId) {
    List<EventView> events = repository.findByDate(date);
    double total = 0.0;
    int index = 0;
    Map<Integer, String> mapEv = new HashMap<Integer, String>();
		for ( EventView v : events) {
      total += Utl.parseDouble(v.getTime());
      v.setIndex(index);
      index++;
      mapEv.put(v.getParentId(), v.getName());
    }

    List<String> statusList = new ArrayList<String>(Arrays.asList(
      Utl.Status.EV1_ONPROCESS.getValue(),
      Utl.Status.EV2_CURRENT.getValue(),
      Utl.Status.EV6_LOOKBACK.getValue(),
      Utl.Status.EV9_REGULAR.getValue()));
    List<Item> tmpList = itemRepository.findByStatusIn(statusList);
    for(Item itm : tmpList) {
      if(!mapEv.containsKey(itm.getId())) {
        events.add(new EventView(itm, date, index++));
      }
    }

		CategoryView cat = catService.findByNameWithTopic(catId, date);
		if(cat != null)
		{
      
      List<Object> unsortItems = new ArrayList<Object>();
			for(EventView ev : events)
			{
        cat.updateTime(ev.getEventCategoryId(), Utl.parseDouble(ev.getTime()));
        if(Utl.check(ev.getTopicCategoryId())) {
          this.AddEventToTopic(cat, ev);
        }
        if(ev.getIsBinded() == null || !ev.getIsBinded()) {
          this.AddEventToCategory(cat, ev);
        }

        if(ev.getIsBinded() == null || !ev.getIsBinded()) {
          unsortItems.add(ev);
          ev.setIsBinded(true);
        }        
      }
      if(unsortItems.size() > 0) {
        CategoryView unsortCat = new CategoryView();
        unsortCat.setName("Unsorted");
        unsortCat.setItems(unsortItems);
        cat.getChildren().add(unsortCat);
      }
      cat.updateTotal(total);
      
      if(LocalDate.now().plusDays(-3).toString().compareTo(date) >= 0 
        && LocalDate.ofYearDay(2019, 2).toString().compareTo(date) < 0)
      {
        //cat.clearChild();
      }
		}

    return cat;
  }

  public CategoryView loadCatViewBeanByPeriod(String date, String start, String end, Integer catId) {

    List<EventView> events = repository.findByPeriod(start, end);
		double total = 0.0;
		for ( EventView v : events) {
			total += Utl.parseDouble(v.getTime());
		}
		for ( EventView v : events) {
			double pt = Utl.parseDouble(v.getTime()) / total * 100;
			if(Utl.check(pt)) {
				//v.setPercent( Utl.parseTimeToString(pt) + "%");
			}
		}

		CategoryView cat = catService.findByNameWithTopic(catId, date);
		if(cat != null)
		{
			for(EventView ev : events)
			{
        if(Utl.check(ev.getTopicCategoryId())) {
          this.AddEventToTopic(cat, ev);
        }
        if(ev.getIsBinded() == null || !ev.getIsBinded()) {
          this.AddEventToCategory(cat, ev);
          cat.updateTime(ev.getEventCategoryId(), Utl.parseDouble(ev.getTime()));
        }
        else {
          cat.updateTime(ev.getTopicCategoryId(), Utl.parseDouble(ev.getTime()));
        }
			}
			cat.updateTotal(total);
			//cat.clearChild();
		}

    return cat;
  }

  // public EventView updateNewEventByCategory(EventView v, int relatedId, String cat, String topic)
  // {
  //   return v;
  // }

  // // public TopicViewBean updateNewTopicByCategory(TopicViewBean v, String cat)
  // // {
  // //   v.setEveCategory(cat);
  // //   v.setStatus(Utl.Status.EV1_ONPROCESS.getValue());
  // //   return v;
  // // }

  // // public CategoryView loadLifeLineView(String date, String start, String end) {

  // //   List<Event> events = this.findByPeriod(start, end);
  // //   List<EventView> list = new ArrayList<EventView>();
	// // 	for ( Event item : events) {
  // //     EventView nEv = new EventView(item, start, end);
  // //     //if(Utl.parseDouble(nEv.getTime()) > 10.0) {
  // //       list.add(nEv);
  // //     //}
	// // 	}
  // //   list.sort( (a,b)-> {
  // //     if(!a.getDate().equals(b.getDate()))
  // //     {
  // //       return a.getDate().compareTo(b.getDate());
  // //     }
  // //     return a.getTime().compareTo(b.getTime());
  // //   });
    
  // //   List<TopicBean> topics = catService.findTopics();
  
  // //   CategoryView cat = new CategoryView();
  // //   cat.setName("LifeLine");
  // //   cat.setChildren(new ArrayList<CategoryView>());    
  // //   List<CategoryView> catChildren = cat.getChildren();
  // //   for(TopicBean t : topics) {
  // //     if(Utl.check(t.getEndDate()) && start.compareTo(t.getEndDate()) > 0 )
  // //       continue;
  // //     CategoryView cv = new CategoryView(t);
  // //     catChildren.add(cv);
  // //   }

  // //   //CategoryView catChild = new CategoryView();
  // //   //catChild.setName("Rest");
  // //   //catChild.setItems(new ArrayList<Object>());

	// // 	for ( EventView v : list) {
  // //     this.AddEventToTopic(cat, v);
  // //     // if(v.getIsBinded() == null || !v.getIsBinded()) {
  // //     //   catChild.getItems().add(v);
  // //     // }
  // //   }
    
  // //   //cat.getChildren().add(catChild);

  // //   return cat;
  // // }

  public ItemView getSingleEvent(int id) {
    Optional<Event> res = repository.findById(id);
    if(res.isPresent()) {
      Event p = res.get();
      ItemView iv = new ItemView();      
      itemRepository.findById(p.getParentId()).ifPresent( item -> {
        Utl.copyPropertiesIgnoreNull(item, iv);
      });
      iv.setEvent(p);
      return iv;
    }
    return new ItemView();
  }

  public List<Event> findListByParentId(int itemId) {
    List<Event> eventList = repository.findByParentIdOrderByDateAsc(itemId);
    if(eventList.size() > 0) {
      Event sum = new Event();
      sum.setDate("SUM");
      double sumTime = 0.0;
      for(Event ev : eventList) {
        sumTime += ev.getTime();
      }
      sum.setTime(sumTime);
      sum.setName(Integer.toString(eventList.size()));
      eventList.add(sum);
    }
    return eventList;
  }



}