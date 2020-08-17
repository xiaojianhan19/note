package com.note.demo.category;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.transaction.Transactional;

import com.note.demo.Utl;

import org.hibernate.hql.internal.ast.tree.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class CategoryService extends Node {

  @Autowired
  CategoryParentRepository repository;

  @Autowired
  CategoryChildRepository itemRepository;

  
  public List<CategoryParentBean> findAll(){
    return repository.findAll();
  }

  public Optional<CategoryParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }

  public void save(CategoryParentBean p) {
    CategoryParentBean r = new CategoryParentBean();
    if(Utl.check(p.getId()))
    {
      Optional<CategoryParentBean> res = repository.findById(p.getId());
      if(res.isPresent())
      {
        r = res.get();
      }
    }
    else
    {
      List<CategoryParentBean> res = repository.findByNameAndStartDate(p.getName(), p.getStartDate());
      if(res.size() > 0)
        r = res.get(0);
    }

    if(!p.getName().isEmpty()) 
    {    
      r.setName(p.getName());
    }

    if(!p.getInputDate().isEmpty()) 
    {    
      r.setInputDate(p.getInputDate());
    } else if(r.getInputDate().isEmpty()) {
      r.setInputDate(LocalDate.now().toString());
    }

    if(!p.getStartDate().isEmpty()) 
    {    
      r.setStartDate(p.getStartDate());
    } else if(r.getStartDate().isEmpty()) {
      r.setStartDate(LocalDate.now().toString());
    }

    if(!p.getEndDate().isEmpty()) 
    {    
      r.setEndDate(p.getEndDate());
    } else if(r.getEndDate().isEmpty()) {
      r.setEndDate(Utl.MAX_DATE.toString());
    }
    
    if(p.getItem() != null) 
    {
      r.setItem(p.getItem());
    } 
    if(r.getItem() == null) 
    {
      CategoryChildBean c = new CategoryChildBean(r.getName());
      itemRepository.save(c);
      r.setItem(c);
    }

    repository.save(r);
  }


  public CategoryParentBean findByNameAndDate(String name, String date) {
    List<CategoryParentBean> res = repository.findByName(name);
    for(CategoryParentBean p : res)
    {
      if( date.compareTo(p.getStartDate()) >= 0 && date.compareTo(p.getEndDate()) < 0)
      {
        return p;
      }
    }
    if(res.size() > 0)
      return res.get(0);
    return new CategoryParentBean();
  }


  public Optional<CategoryChildBean> findChild(String id){
    return itemRepository.findById(Utl.parseInt(id));
  }

  public CategoryChildBean findChildByRootAndName(String root, String name){
    List<CategoryChildBean> objList = new ArrayList<CategoryChildBean>() ;
    Optional<CategoryChildBean> res = this.findChild(root);
    if(res.isPresent())
    {
      searchCategoryChild(res.get(), name, objList);
    }
    if(objList.size() > 0)
      return objList.get(0);
    return null;
  }

  public void searchCategoryChild(CategoryChildBean item, String name, List<CategoryChildBean> objList)
  {
    if(item.getName().equals(name))
    {
      objList.add(item);
      return;      
    }
    for(CategoryChildBean child : item.getChildren())
    {
      if(objList.size() == 0)
        searchCategoryChild(child, name, objList);
    }
    return;
  }

  // public void save(CategoryChildBean p) {
  //   itemRepository.save(p);
  // }

  public void saveChild(CategoryChildBean c, String parent)
  {
    CategoryChildBean cat = new CategoryChildBean();
    if(c.getId() != 0)
    {
      cat = itemRepository.findById(c.getId()).orElse(cat);
    }
    Utl.copyPropertiesIgnoreNull(c, cat);
    if(!parent.isEmpty())
    {
      CategoryChildBean res = this.findChildByRootAndName(String.valueOf(c.getRoot()), parent);
      if(res != null)
      {
        cat.setParent(res);
      }
    }

    itemRepository.save(cat);
  }

  // public void saveChild(String id, String name, String parent)
  // {
  //   CategoryChildBean cat;
  //   Optional<CategoryChildBean> res = this.findChild(id);
  //   if(res.isPresent())
  //   {
  //     cat = res.get();
  //   }
  //   else
  //   {
  //     cat = new CategoryChildBean();
  //     cat.setId(Utl.parseInt(id));
  //   }
  //   cat.setName(name);
  //   if(!parent.isEmpty())
  //   {
  //     CategoryChildBean p = this.findByParentAndName(parent, );
  //     cat.setParent(p);
  //   }
  //   else if(id.length() >= 2)
  //   {
  //     this.findChild( id.substring(0, id.length() - 1)).ifPresent(x -> cat.setParent(x));
  //   }

  //   itemRepository.save(cat);
  // }

  public Map<String, String> GetCategoryMapByName(String name, String date)
  {
    Map<String, String> catList = new TreeMap<String, String>();

    CategoryParentBean p = this.findByNameAndDate(name, date);
    this.AddToMap(p.getItem(), 0, catList);
    return catList;
  }

	public void AddToMap(CategoryChildBean cat , int catId, Map<String, String> catList)
	{
    if(cat == null)
      return;
    catList.put(String.valueOf(catId), cat.getName());
    if(cat.getChildren() != null)
    {
      int i = 0;
      for(CategoryChildBean child : cat.getChildren())
      {
        int curId = catId * 10 + ++i;
        AddToMap(child, curId, catList);
      }
    }	
	}


}