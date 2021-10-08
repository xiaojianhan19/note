package com.note.demo.event;

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

import com.note.demo.PropertiesUtils;
import com.note.demo.Utl;
import com.note.demo.category.CategoryParentBean;
import com.note.demo.category.CategoryService;
import com.note.demo.category.CategoryViewBean;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import ch.qos.logback.core.joran.conditional.ElseAction;


@Service
@Transactional
public class EventService {

  @Autowired
  EventParentRepository repository;

  @Autowired
  EventChildRepository itemRepository;

  @Autowired
  CategoryService catService;

  public static int showMode = 0;
  Map<String, String> catToTypeMap = new HashMap<String, String>();

  public EventService() {

    //PropertiesUtils pFile = new PropertiesUtils("static/application-map.properties");
    //for (Map.Entry<Object, Object> entry : pFile.properties.entrySet()) {
    //  catToTypeMap.put( entry.getKey().toString() , entry.getValue().toString() );
    //}
    catToTypeMap.put( "Project" , "Achievement" );
    catToTypeMap.put( "Fantasy" , "Achievement" );
    catToTypeMap.put( "Discipline" , "Achievement" );
    catToTypeMap.put( "Exercise" , "Achievement" );
    catToTypeMap.put( "Animation" , "Collection" );
    catToTypeMap.put( "Book" , "Collection" );
    catToTypeMap.put( "Game" , "Collection" );
    catToTypeMap.put( "Movie" , "Collection" );
    catToTypeMap.put( "Music" , "Collection" );
    catToTypeMap.put( "Communicate" , "Person" );
    catToTypeMap.put( "TSSummit" , "Achievement" );
    catToTypeMap.put( "" , "" );
  }

  public List<EventParentBean> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<EventParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public List<EventChildBean> findByDate(String date) {
    List<EventChildBean> list = itemRepository.findByDateOrderByParent(date);
    if(showMode == 0 && LocalDate.now().plusDays(-3).toString().compareTo(date) < 0)
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

  public List<EventParentBean> findByPeriod(String start, String end) {
    List<EventChildBean> list = itemRepository.findByDateBetweenOrderByParent(start, end);
    List<EventParentBean> pList = new ArrayList<EventParentBean>();
    for(EventChildBean ch : list)
    {
      if(!pList.contains(ch.getParent()))
        pList.add(ch.getParent());
    }

    return pList;
  }

  public List<EventViewBean> findByName(String name)
  {
   List<EventViewBean> list = new ArrayList<EventViewBean>();
   List<EventParentBean> events = repository.findByNameContaining(name);
   for(EventParentBean ev : events)
   {
     for(EventChildBean ch : ev.getItems())
     {
       list.add(new EventViewBean(ch));
     }
   }
   return list;
  }

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
    // Update EventParent
    EventParentBean newEv = new EventParentBean(vBean);
    EventParentBean event = null;
    Boolean exist = false;
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
      List<EventParentBean> res = repository.findByNameAndCategory(vBean.getName(), vBean.getCategory());
      if(res.size() > 0)
      {
        event = res.get(0);
      }
    }
    if(event != null)
    {
      exist = true;
      // update
      Utl.copyPropertiesIgnoreNull(newEv, event);
    }
    else
    {
      // add  
      event = newEv;
    }

    if(Utl.check(event.getName()) && Utl.check(event.getCategory()))
    {
      repository.save(event);
    }
    
    // Update EventChild
    EventChildBean newCh = new EventChildBean(vBean, event);
    EventChildBean child = null;
    if(exist)
    {
      for(EventChildBean ev : event.getItems())
      {
        if(vBean.getDate().equals(ev.getDate()))
        {
          child = new EventChildBean(ev);
          Utl.copyPropertiesIgnoreNull(newCh, child);
          break;
        }
      }
    }
    if(child == null)
    {
      child = newCh;
    }

    if(Utl.check(child.getTime()) || Utl.check(child.getMemo()))
    {
      if(child.getTime() == -1.0)
      {
        if(Utl.check(child.getId()))
          itemRepository.delete(child);
      }
      else
      {
        itemRepository.save(child);
      }
    }
  }

  public List<EventViewBean> findTargets(String name)
  {
    List<EventViewBean> refEvents = new ArrayList<EventViewBean>();

    List<EventParentBean> events = repository.findByNameContaining(name);
    for(EventParentBean ev : events)
    {
      refEvents.add(new EventViewBean(ev));
    }
    sortByLastDate(refEvents);
    return refEvents;
  }

  public List<EventViewBean> findRefEventsByCat(String cat, String date)
  {
    String start = LocalDate.now().plusMonths(-1).toString();
    List<EventViewBean> refEvents = new ArrayList<EventViewBean>();

    List<EventParentBean> events = repository.findByCategory(cat);    
    for(EventParentBean ev : events)
    {
      for(EventChildBean ch : ev.getItems()) {
        if(ch.getDate().compareTo(start) > 0 ) {
          refEvents.add(new EventViewBean(ev));
          break;
        }
      }      
    }
    sortByLastDate(refEvents);
    return refEvents;
  }  

  public void insert(String id, String date, String time)
  {
    Optional<EventParentBean> res = repository.findById(Utl.parseInt(id));
    if(res.isPresent())
    {
      EventParentBean event = res.get();
      EventChildBean child = new EventChildBean(date, event);
      double t = Utl.parseDouble(time);
      t = (Utl.check(t)) ? t : 0.5;
      child.setTime(t);
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

  public void sortByDate(List<EventViewBean> list)
  {
    list.sort( (a,b)-> {
      if(!a.getDate().equals(b.getDate()))
      {
        return a.getDate().compareTo(b.getDate());
      }
      return a.getName().compareTo(b.getName());
    });
  }

  public void sortByLastDate(List<EventViewBean> list)
  {
    list.sort( (a,b)-> {
      if(!a.getLastDate().equals(b.getLastDate()))
      {
        return b.getLastDate().compareTo(a.getLastDate());
      }
      return a.getName().compareTo(b.getName());
    });
  }  

  public void saveParent(List<EventViewBean> list) 
  {
    for(EventViewBean v : list)
    {
      EventParentBean p = new EventParentBean(v);
      repository.save(p);
    }

    for(EventViewBean v : list)
    {
      List<EventParentBean> res = repository.findByNameAndCategoryOrderById(v.getName(), v.getCategory());
      if(res.size() > 1)
      {
        int orgId = 0;
        EventParentBean org = null;
        int maxSize = 0;
        for(EventParentBean item : res)
        {
          if(item.getItems() == null)
          {
            item.setItems(itemRepository.findByParent(item));
          }
          if(item.getItems().size() > maxSize)
          {
            maxSize = item.getItems().size();
            orgId = item.getId();
            org = item;
          }
        }

        for(int i=0; i < res.size(); i++)
        {
          EventParentBean add = res.get(i);
          if(add.getId() != orgId)
          {
            List<EventChildBean> chgItems = add.getItems();
            int cnt = chgItems.size();
            for(int j=0; j < cnt; j++)
            {
              EventChildBean child = chgItems.get(j);
              List<EventChildBean> orgList = itemRepository.findByDateAndParent(child.getDate(), org);
              if(orgList.size() == 0)
              {
                EventChildBean newC = new EventChildBean(child, org);
                itemRepository.save(newC);
              }
              else
              {
                EventChildBean newC = orgList.get(0);
                newC.setTime(newC.getTime() + child.getTime());
                newC.setMemo(newC.getMemo() + child.getMemo());
                itemRepository.save(newC);
                itemRepository.delete(child);
              }
            }
            repository.delete(add);
          }
        }
      }
    }

  }

   public void delete(EventParentBean p)
   {
     for(EventChildBean c : p.getItems())
     {
      itemRepository.delete(c);
     }
     repository.delete(p);
   }

   public void deleteItem(EventChildBean ev)
   {
     itemRepository.delete(ev);
   }

   public void delete(String id) {
    repository.deleteById(Utl.parseInt(id));
  }

  public void updateEventName(String oldName, String newName)
  {
    List<EventParentBean> res = repository.findByName(oldName);
    if(res.size() > 0)
    {
      for(EventParentBean p : res)
      {
        p.setName(newName);
        repository.save(p);
      }
    }
  }

  public void AddEventToCategory(CategoryViewBean cat, EventViewBean ev)
  {
    if(cat == null)
        return;
    if(cat.getName().equals(ev.getCategory())) {
      cat.getItems().add(ev);
    }
    else {
      for(CategoryViewBean child : cat.getChildren()) {
        AddEventToCategory(child, ev);
      }
    }
  }  
   
  public CategoryViewBean loadCatViewBeanByDate(String date) {
    List<EventChildBean> events = findByDate(date);

    double total = 0.0;
		for ( EventChildBean v : events) {
			total += v.getTime();
    }
    List<EventViewBean> list = new ArrayList<EventViewBean>();
    int index = 0;
    for(EventChildBean v : events) {
      EventViewBean newBean = new EventViewBean(v);
      if(Utl.check(total)) {
        double pt = v.getTime() / total * 100;
        newBean.setPercent( Utl.parseTimeToString(pt) + "%");
      }
      newBean.setIndex(index);
      index++;
      list.add(newBean);
    }
    
		CategoryParentBean catP = catService.findByNameAndDate("Event", date);
		CategoryViewBean cat = new CategoryViewBean(catP.getItem());
		if(cat != null)
		{
			for(EventViewBean ev : list)
			{
				cat.updateTime(ev.getCategory(), Utl.parseDouble(ev.getTime()));
				this.AddEventToCategory(cat, ev);
			}
      cat.updateTotal(total);
      
      if(LocalDate.now().plusDays(-3).toString().compareTo(date) >= 0) 
      {
        cat.clearChild();
      }
		}

    return cat;

    /* 
    // change value of double
    try {
      Field field = Double.class.getDeclaredField("value");
      field.setAccessible(true);
      field.set(total, new Double(totalTime));
    } catch (Exception e) {
      e.printStackTrace();
    }
    // */
    //return list;
  }

  public CategoryViewBean loadCatViewBeanByPeriod(String date, String start, String end) {

    List<EventParentBean> events = this.findByPeriod(start, end);
    List<EventViewBean> list = new ArrayList<EventViewBean>();
		for ( EventParentBean item : events) {
			list.add(new EventViewBean(item, start, end));
		}
		double total = 0.0;
		for ( EventViewBean v : list) {
			total += Utl.parseDouble(v.getTime());
		}
		for ( EventViewBean v : list) {
			double pt = Utl.parseDouble(v.getTime()) / total * 100;
			if(Utl.check(pt)) {
				v.setPercent( Utl.parseTimeToString(pt) + "%");
			}
		}

		CategoryParentBean catP = catService.findByNameAndDate("Event", date);
		CategoryViewBean cat = new CategoryViewBean(catP.getItem());
		if(cat != null)
		{
			for(EventViewBean ev : list)
			{
				cat.updateTime(ev.getCategory(), Utl.parseDouble(ev.getTime()));
				this.AddEventToCategory(cat, ev);
			}
			cat.updateTotal(total);
			//cat.clearChild();
		}

    return cat;
  }

  public EventViewBean updateNewEventByCategory(EventViewBean v, String cat)
  {
    v.setCategory(cat);
    v.setSortedCategory(cat);
    String type = catToTypeMap.get(cat);
    if(Utl.check(type)) {
      
      v.setStatus(Utl.Status.EV3_FINISHED.getValue());
      v.setSorted(type);
      return v;
    }
    else {
      v.setStatus(Utl.Status.EV3_FINISHED.getValue());
      v.setSorted("Event");
      return v;
    }
  }

}