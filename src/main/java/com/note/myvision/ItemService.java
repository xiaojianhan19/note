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

  // @Autowired
  // EventService eventService;

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
    repository.deleteById(Utl.parseInt(id));
  }

  public void insert(String id, String date)
  {

  }

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
      AddItemToGroup(cat, level);
      return cat;
    }
    return null;
  }

  public CategoryView findGroup(CategoryView c, String category, int level) {
    if(c.getName().equals(category)) {
      AddItemToGroup(c, level);
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

  public void AddItemToGroup(CategoryView group, int level)
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
    if(group.getChildren() != null)
    {
        for(CategoryView child : group.getChildren())
        {
          AddItemToGroup(child, level);
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

}