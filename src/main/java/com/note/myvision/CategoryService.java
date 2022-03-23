package com.note.myvision;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.transaction.Transactional;

import com.note.myvision.Utl;

import org.hibernate.hql.internal.ast.tree.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class CategoryService extends Node {

  @Autowired
  CategoryParentRepository repository;

  @Autowired
  CategoryChildRepository itemRepository;

  @Autowired
  TopicRepository topicRepository;
  
  public List<CategoryParentBean> findAll(){
    return repository.findAll();
  }

  public Optional<CategoryParentBean> find(String id){
    return repository.findById(Utl.parseInt(id));
  }
  
  public CategoryParentBean findByName(String name){
    return repository.findByName(name).get(0);
  }  

  public void delete(CategoryParentBean item){
    deleteItem(item.getItem());
    repository.delete(item);
  }

  public void deleteItem(CategoryChildBean item){
    deleteFromBottom(item);
  }

  public void deleteFromBottom(CategoryChildBean item){
    List<CategoryChildBean> children = item.getChildren();
    for(CategoryChildBean child : children) {
      deleteFromBottom(child);
    }
    if(item.getParent() != null) {
      itemRepository.delete(item);
    }
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
      List<CategoryParentBean> res = repository.findByName(p.getName());
      if(res.size() > 0)
        r = res.get(0);
    }

    Utl.copyPropertiesIgnoreNull(p, r);
    if(!Utl.check(r.getInputDate())) {
      r.setInputDate(LocalDate.now().toString());
    } 
    if(r.getItem() == null) 
    {
      CategoryChildBean c = new CategoryChildBean(r.getName());
      itemRepository.save(c);
      r.setItem(c);
    }

    repository.save(r);
  }

  public CategoryViewBean findByNameWithCategory(String name) {
    List<CategoryParentBean> list = repository.findByName(name);
    CategoryParentBean p = list.get(0);
    CategoryViewBean cat = new CategoryViewBean(p.getItem());
    return cat;
  }

  public CategoryViewBean findByNameWithTopic(String name, String date) {
    CategoryParentBean p = repository.findByName(name).get(0);
    CategoryViewBean cat = new CategoryViewBean(p.getItem());
    List<TopicBean> topicOnp = new ArrayList<TopicBean>();
    if(date.compareTo("20190317") < 0) {
      topicOnp = topicRepository.findAll();
    } else {
      topicOnp = topicRepository.findByStatus("OnProcess");
    }
    for(TopicBean t : topicOnp) {
      //TopicViewBean tv = new TopicViewBean(t);
      if(t.getStatus() == "Finished" && 
      (t.getStartDate().compareTo(date) > 0 || t.getEndDate().compareTo(date) < 0)) {
        continue;
      }

      String topicCat = (name.equals("Event")) ? t.getEveCategory() :
                        (name.equals("Person")) ? t.getPerCategory() :
                        (name.equals("Collection")) ? t.getColCategory() :
                        (name.equals("Achievement")) ? t.getAchCategory() :
                        t.getEveCategory();

      addTopicToCat(t, cat, topicCat);
    }

    return cat;
  }

  public void addTopicToCat(TopicBean t, CategoryViewBean cat, String topicCat) {
    if(cat.getName().equals(topicCat)) {
      cat.getChildren().add(new CategoryViewBean(t));
      return;
    }
    for(CategoryViewBean child : cat.getChildren()) {
      addTopicToCat(t, child, topicCat);
    }
  }

  public CategoryChildBean findByParentAndNameAndDate(String pName, String name, String date) {
    List<CategoryParentBean> res = repository.findByName(pName);
    CategoryChildBean root = null;
    if(res.size() > 0) {
      root = res.get(0).getItem();
    }
    
    if(root != null) {
      List<CategoryChildBean> objList = new ArrayList<CategoryChildBean>() ;
        searchCategoryChild(root, name, objList);
      if(objList.size() > 0)
        return objList.get(0);
    }

    return new CategoryChildBean();
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
    
    int pid = Utl.parseInt(parent);
    if(Utl.check(pid)) {
      Optional<CategoryChildBean> res = itemRepository.findById(pid);
      if(res.isPresent()) {
        cat.setParent(res.get());
      }
    } else {
      if(Utl.check(parent))
      {
        CategoryChildBean res = this.findChildByRootAndName(String.valueOf(c.getRoot()), parent);
        if(res != null)
        {
          cat.setParent(res);
        }
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

  public Map<String, String> GetCategoryMapByName(String name)
  {
    Map<String, String> catList = new TreeMap<String, String>();

    CategoryParentBean p = this.findByName(name);
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

  public void saveTopic(TopicViewBean topic) {
    TopicBean b = new TopicBean(topic);
    topicRepository.save(b);
  } 

  public List<TopicViewBean> findRefTopicByCat() {
    List<TopicBean> list = topicRepository.findAll();
    List<TopicViewBean> res = new ArrayList<TopicViewBean>();
    for(TopicBean t : list) {
      res.add(new TopicViewBean(t));
    }
    return res;
  }   

	public void updateroot(CategoryChildBean c, int rootid) {
		if(Utl.check(c.getRoot()) && c.getRoot() != rootid) {
			c.setRoot(rootid);
			itemRepository.save(c);
    }
    for(CategoryChildBean child : c.getChildren()) {
      updateroot(child, rootid);
    }
  }
  
  public int findItemCategoryIdByName(String category, String parentCategory) {

    List<CategoryParentBean> list = null;
    if(Utl.check(parentCategory)) {
      list = repository.findByName(parentCategory);
    } else {
      list = repository.findAll();
    }
    for(CategoryParentBean p : list) {
      if("Event".equals(p.getName())) {
        continue;
      }
      int res = getCategoryIdByName(p.getItem(), category); 
      if(Utl.check(res)) {
        return res;
      }
    }

    if(Utl.check(parentCategory)) {
      int res = findItemCategoryIdByName(category, ""); 
      if(Utl.check(res)) {
        return res;
      }
    }

    return 0;
  }

  public int getCategoryIdByName(CategoryChildBean p, String category) {
    if(category.equals(p.getName())) {
      return p.getId();
    }
    for(CategoryChildBean c : p.getChildren()) {
      int res = getCategoryIdByName(c, category);
      if(Utl.check(res)) {
        return res;
      }
    }

    return 0;
  }

  public List<TopicBean> findTopics() {
    return topicRepository.findAll(Sort.by(Direction.ASC, "startDate"));
  }

	public void sortCategory(List<CategoryChildBean> list)
	{
	  list.sort( (a,b)-> {
		return new Integer(a.getOrderNo()).compareTo(b.getOrderNo());
	  });
	}

  public void sortCategoryChildBean(CategoryChildBean cat) {
		if(cat.getChildren() != null) {
			sortCategory(cat.getChildren());
			for(CategoryChildBean ch : cat.getChildren()) {
				sortCategoryChildBean(ch);
			}
		}
  }
  
  public String findCatName(int id) {
    return itemRepository.findCatName(id);

    //return "";
  }

}