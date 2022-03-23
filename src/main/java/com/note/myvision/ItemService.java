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
  CategoryService catService;

  public List<ItemBean> findAll(){
    return repository.findAll(Sort.by(Direction.ASC, "category"));
  }

  public Optional<ItemBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  // public List<ResourceBean> findByDate(String date) {
  //   return resRepository.findByDateOrderByParent(date);
  // }
  
  public ItemViewBean findWithResource(String id){
    Optional<ItemBean> res = repository.findById(Utl.parseInt(id));
    if(res.isPresent()) { 
      ItemBean item = res.get();
      ItemViewBean iv = new ItemViewBean();
      Utl.copyPropertiesIgnoreNull(item, iv);
      List<ItemBean> is = repository.findByParentId(item.getId());
      iv.setItems(is);
      List<ResourceBean> rs = resRepository.findByParentIdOrderByIndex(item.getId());
      iv.setResources(rs);
      return iv;
    }

    return new ItemViewBean();
  }

  public void save(ItemBean b, ResourceBean c) {
    repository.save(b);
    c.setParentId(b.getId());
    resRepository.save(c);
  }

  public void save(ItemBean p)
  {
    if(Utl.check(p.getId()))
    {
      // repository.findById(p.getId()).ifPresent( res -> {
      //   if(!res.getName().equals(p.getName()))
      //   {
      //     eventService.updateEventName(res.getName(), p.getName());
      //   }
      // });

      Optional<ItemBean> res = repository.findById(p.getId());
      if(res.isPresent())
      {
        ItemBean r = res.get();
        Utl.copyPropertiesIgnoreNull(p, r);
        r.setParentId(p.getParentId());
        r.setCategoryId(p.getCategoryId());
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
      // List<EventViewBean> res = eventService.findByName(p.getName());
      // if(res.size() == 0)
      // {
      //   EventViewBean v = new EventViewBean(p.getName(), p.getCategory(), p.getStatus(), "Collection", LocalDate.now().toString(), "0.1", "", "", "");
      //   eventService.save(v);
      // }
      if(p.getDate().isEmpty())
        p.setDate(LocalDate.now().toString());      
      repository.save(p);
    }
  }

  public void save(ResourceBean c)
  {
    if(c.getDate().isEmpty())
      c.setDate(LocalDate.now().toString());
    c.setUpdateDate(LocalDate.now().toString());
    resRepository.save(c);
  }

  public void save(ResourceBean c, ItemBean p)
  {
    c.setParentId(p.getId());
    resRepository.save(c);
  }

  // public void saveAll(List<ItemBean> list) {
  //   for(ItemBean p : list)
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
    List<ItemBean> res = repository.findByNameOrName2(vBean.getName(), vBean.getName());
    if(res.size() == 0)
    {
      ItemBean c = new ItemBean();
      c.setName(vBean.getName());
      c.setCategory(vBean.getRelatedCategory());      
      c.setCategoryId(vBean.getRelatedId());
      c.setStatus(vBean.getStatus());
      c.setMemo("");
      if(vBean.getMemo() != null)
        c.setMemo(vBean.getMemo());
      c.setName2("");
      c.setName3("");
      c.setLevel(1);
      c.setDate(vBean.getDate());
      c.setReleaseDate(vBean.getDate());
      repository.save(c);
    }    
  }

  public CategoryViewBean findAllInGroup(String CName, String category, String date) {
    CategoryViewBean c = catService.findByNameWithCategory(CName);
    CategoryViewBean res = findGroup(c, category, -9);
    if(res == null) 
      return c;
    else 
      return res;
  }

  public CategoryViewBean findGroupByCategoryId(String categoryId) {
    Optional<CategoryChildBean> childOpt = catService.findChild(categoryId);
    if(childOpt.isPresent()) {
      catService.sortCategoryChildBean(childOpt.get());
      CategoryViewBean cat = new CategoryViewBean(childOpt.get());
      AddItemToGroup(cat, -9);
      return cat;
    }
    return null;
  }

  public CategoryViewBean findGroup(CategoryViewBean c, String category, int level) {
    if(c.getName().equals(category)) {
      AddItemToGroup(c, level);
      return c;
    }
    for(CategoryViewBean cat : c.getChildren()) {
      CategoryViewBean res = findGroup(cat, category, level);
      if(res == null) {
        continue;
      } else {
        return res;
      }
    }
    return null;
  }

  // public void AddItemToGroup(CategoryViewBean group)
  // {
  //   if(group == null)
  //       return;
  //   List<ItemBean> list = repository.findByCategoryId(group.getId());
  //   List<Object> objList = group.getItems();
  //   for(ItemBean p : list)
  //   {
  //     objList.add(p);
  //   }
  //   group.setItems(objList);
  //   if(group.getChildren() != null)
  //   {
  //       for(CategoryViewBean child : group.getChildren())
  //       {
  //         AddItemToGroup(child);
  //       }
  //   }
  // }

  public CategoryViewBean findAllInGroupAboveLevel(String CName, String category, String level) {

    int lv = Utl.parseInt(level);
    CategoryViewBean c = catService.findByNameWithCategory(CName);
    CategoryViewBean res = findGroup(c, category, lv);
    if(res == null) 
      return c;
    else 
      return res;
  }

  // public CategoryViewBean findTargetCat(CategoryViewBean cat, String targetCat) {
  //   if(cat.getName().equals(targetCat)) {
  //     return cat;
  //   }
  //   for(CategoryViewBean child : cat.getChildren()) {
  //     return findTargetCat(child, targetCat);
  //   }
  //   return cat;
  // }

  public void AddItemToGroup(CategoryViewBean group, int level)
  {
    if(group == null)
        return;
    List<ItemBean> list = repository.findByCategoryIdAndLevelGreaterThan(group.getId(), level);
    List<Object> objList = group.getItems();
    for(ItemBean p : list)
    {
      objList.add(p);
    }
    group.setItems(objList);
    if(group.getChildren() != null)
    {
        for(CategoryViewBean child : group.getChildren())
        {
          AddItemToGroup(child, level);
        }
    }
  }

  public List<ItemBean> findUnsortedItems() {
    List<String> catList = new ArrayList<String>();
    Map<String, String> map1 = catService.GetCategoryMapByName("Collection");
    for(String value : map1.values()){
      catList.add(value);
    }
    Map<String, String> map2 = catService.GetCategoryMapByName("Achievement");
    for(String value : map2.values()){
      catList.add(value);
    }
    return repository.findByCategoryNotIn(catList);
  } 

  // public ItemBean modifyBean(ItemBean b) {
  //   ItemBean newBean = new ItemBean(b);
  //   for(ResourceBean child : newBean.getItems())
  //   {
  //     if(child.getMemo().length() > 50) {
  //       child.setMemo(child.getMemo().substring(0, 50));
  //     }
  //   }
  //   return newBean;
  // }

  public Optional<ResourceBean> findChild(String id) {
    return resRepository.findById(Utl.parseInt(id));
  }

  // public void sortByIndex(ItemViewBean p)
  // {
  //   p.getItems().sort( (a,b)-> {
  //     if(!a.getType().equals(b.getType())) {
  //       return a.getType().compareTo(b.getType());
  //     }
  //     return new Integer(a.getIndex()).compareTo(b.getIndex());
  //   });
  // }  

  public void updateAll(List<String> idList, String changeCategory, String parentCategory, String changeLevel, String deleteFlg) {
    if(!Utl.check(changeCategory) && !Utl.check(deleteFlg))
      return;

    int catId = catService.findItemCategoryIdByName(changeCategory, "");
    if(!Utl.check(catId) && !Utl.check(deleteFlg))
      return;

    int level = Utl.parseInt(changeLevel);
    for(String idStr : idList) {
      if(Utl.check(idStr)) {
        int id = Utl.parseInt(idStr);
        repository.findById(id).ifPresent( item -> {

          if(Utl.check(deleteFlg)) {
            repository.delete(item);
          } else {
            item.setCategoryId(catId);
            item.setCategory(changeCategory);
            if(level != 0) {
              item.setLevel(level);
            }
            repository.save(item);
          }
        });
      }
    }
  }

}