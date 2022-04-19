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

  private Integer RootCatId = 10000001;

  @Autowired
  CategoryRepository repository;

  public void delete(Category item){
    deleteFromBottom(item);
  }

  public void deleteFromBottom(Category item){
    List<Category> children = item.getChildren();
    for(Category child : children) {
      deleteFromBottom(child);
    }
    if(item.getParent() != null) {
      repository.delete(item);
    }
  }

	public void sortCategory(List<Category> list)
	{
	  list.sort( (a,b)-> {
		return new Integer(a.getOrderNo()).compareTo(b.getOrderNo());
	  });
	}

  public void sortCategory(Category cat) {
		if(cat.getChildren() != null) {
			sortCategory(cat.getChildren());
			for(Category ch : cat.getChildren()) {
				sortCategory(ch);
			}
		}
  }

  public int createIndex(CategoryView cat, int index) {

    cat.setIndex(index++);
		if(cat.getChildren() != null) {
			for(CategoryView ch : cat.getChildren()) {
				index = createIndex(ch, index);
			}
    }
    return index;
  }
  
  public String findCatName(int id) {
    return repository.findCatName(id);
  }  

  // public CategoryView findByNameWithCategory(String name) {
  //   List<CategoryParentBean> list = repository.findByName(name);
  //   CategoryParentBean p = list.get(0);
  //   CategoryView cat = new CategoryView(p.getItem());
  //   return cat;
  // }

  public CategoryView findByNameWithTopic(Integer catId, String date) {

    Optional<Category> opt = repository.findById(catId);
    sortCategory(opt.get());
    CategoryView cat = new CategoryView(opt.get());
    cat.clearTopicOutDate(date);
    cat.updateParentCatId(cat.getId());
    
    return cat;
  }

  // public void addTopicToCat(TopicBean t, CategoryView cat, String topicCat) {
  //   if(cat.getName().equals(topicCat)) {
  //     cat.getChildren().add(new CategoryView(t));
  //     return;
  //   }
  //   for(CategoryView child : cat.getChildren()) {
  //     addTopicToCat(t, child, topicCat);
  //   }
  // }

  // public Category findByParentAndNameAndDate(String pName, String name, String date) {
  //   List<CategoryParentBean> res = repository.findByName(pName);
  //   Category root = null;
  //   if(res.size() > 0) {
  //     root = res.get(0).getItem();
  //   }
    
  //   if(root != null) {
  //     List<Category> objList = new ArrayList<Category>() ;
  //       searchCategoryChild(root, name, objList);
  //     if(objList.size() > 0)
  //       return objList.get(0);
  //   }

  //   return new Category();
  // }

  // public Optional<Category> findChild(String id){
  //   return repository.findById(Utl.parseInt(id));
  // }

  // public Category findChildByRootAndName(String root, String name){
  //   List<Category> objList = new ArrayList<Category>() ;
  //   Optional<Category> res = this.findChild(root);
  //   if(res.isPresent())
  //   {
  //     searchCategoryChild(res.get(), name, objList);
  //   }
  //   if(objList.size() > 0)
  //     return objList.get(0);
  //   return null;
  // }

  // public void searchCategoryChild(Category item, String name, List<Category> objList)
  // {
  //   if(item.getName().equals(name))
  //   {
  //     objList.add(item);
  //     return;      
  //   }
  //   for(Category child : item.getChildren())
  //   {
  //     if(objList.size() == 0)
  //       searchCategoryChild(child, name, objList);
  //   }
  //   return;
  // }

  // // public void save(Category p) {
  // //   repository.save(p);
  // // }

  // public void saveChild(Category c, String parent)
  // {
  //   Category cat = new Category();
  //   if(c.getId() != 0)
  //   {
  //     cat = repository.findById(c.getId()).orElse(cat);
  //   }
  //   Utl.copyPropertiesIgnoreNull(c, cat);
    
  //   int pid = Utl.parseInt(parent);
  //   if(Utl.check(pid)) {
  //     Optional<Category> res = repository.findById(pid);
  //     if(res.isPresent()) {
  //       cat.setParent(res.get());
  //     }
  //   } else {
  //     if(Utl.check(parent))
  //     {
  //       Category res = this.findChildByRootAndName(String.valueOf(c.getRoot()), parent);
  //       if(res != null)
  //       {
  //         cat.setParent(res);
  //       }
  //     }
  //   }

  //   repository.save(cat);
  // }

  // // public void saveChild(String id, String name, String parent)
  // // {
  // //   Category cat;
  // //   Optional<Category> res = this.findChild(id);
  // //   if(res.isPresent())
  // //   {
  // //     cat = res.get();
  // //   }
  // //   else
  // //   {
  // //     cat = new Category();
  // //     cat.setId(Utl.parseInt(id));
  // //   }
  // //   cat.setName(name);
  // //   if(!parent.isEmpty())
  // //   {
  // //     Category p = this.findByParentAndName(parent, );
  // //     cat.setParent(p);
  // //   }
  // //   else if(id.length() >= 2)
  // //   {
  // //     this.findChild( id.substring(0, id.length() - 1)).ifPresent(x -> cat.setParent(x));
  // //   }

  // //   repository.save(cat);
  // // }

	public void AddToMap(CategoryView cat, Map<String, String> catList)
	{
    if(cat == null)
      return;
    catList.put(cat.getName(), Utl.parseIdToString(cat.getId()));
    if(cat.getChildren() != null)
    {
      for(CategoryView child : cat.getChildren())
      {
        AddToMap(child, catList);
      }
    }	
	}

  // public void saveTopic(TopicViewBean topic) {
  //   TopicBean b = new TopicBean(topic);
  //   topicRepository.save(b);
  // } 

  // public List<TopicViewBean> findRefTopicByCat() {
  //   List<TopicBean> list = topicRepository.findAll();
  //   List<TopicViewBean> res = new ArrayList<TopicViewBean>();
  //   for(TopicBean t : list) {
  //     res.add(new TopicViewBean(t));
  //   }
  //   return res;
  // }   

	// public void updateroot(Category c, int rootid) {
	// 	if(Utl.check(c.getRoot()) && c.getRoot() != rootid) {
	// 		c.setRoot(rootid);
	// 		repository.save(c);
  //   }
  //   for(Category child : c.getChildren()) {
  //     updateroot(child, rootid);
  //   }
  // }
  
  // public int findItemCategoryIdByName(String category, String parentCategory) {

  //   List<CategoryParentBean> list = null;
  //   if(Utl.check(parentCategory)) {
  //     list = repository.findByName(parentCategory);
  //   } else {
  //     list = repository.findAll();
  //   }
  //   for(CategoryParentBean p : list) {
  //     if("Event".equals(p.getName())) {
  //       continue;
  //     }
  //     int res = getCategoryIdByName(p.getItem(), category); 
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   if(Utl.check(parentCategory)) {
  //     int res = findItemCategoryIdByName(category, ""); 
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   return 0;
  // }

  // public int getCategoryIdByName(Category p, String category) {
  //   if(category.equals(p.getName())) {
  //     return p.getId();
  //   }
  //   for(Category c : p.getChildren()) {
  //     int res = getCategoryIdByName(c, category);
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   return 0;
  // }

  // public List<TopicBean> findTopics() {
  //   return topicRepository.findAll(Sort.by(Direction.ASC, "startDate"));
  // }



}