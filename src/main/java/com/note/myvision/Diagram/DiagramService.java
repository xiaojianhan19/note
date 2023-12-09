package com.note.myvision.Diagram;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.transaction.Transactional;

import com.note.myvision.Category;
import com.note.myvision.CategoryRepository;
import com.note.myvision.CategoryService;
import com.note.myvision.Item;
import com.note.myvision.ItemRepository;
import com.note.myvision.ItemService;
import com.note.myvision.Resource;
import com.note.myvision.Utl;

import org.hibernate.hql.internal.ast.tree.Node;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;


@Service
@Transactional
public class DiagramService extends Node {

  private Integer RootCatId = 10000001;

  @Autowired
  DiagramRepository repository;

  @Autowired
  PointRepository pointRepository;

	@Autowired
	CategoryService catService;

	@Autowired
	CategoryRepository catRepository;

	@Autowired
	ItemService itemService;

	@Autowired
	ItemRepository itemRepository;

  public void delete(Diagram item){
    deleteFromBottom(item);
  }

  public void deleteFromBottom(Diagram item){
    List<Diagram> children = item.getChildren();
    for(Diagram child : children) {
      deleteFromBottom(child);
    }
    if(item.getParent() != null) {
      repository.delete(item);
    }
  }

	public void sortDiagram(List<Diagram> list)
	{
	  list.sort( (a,b)-> {
		return new Integer(a.getOrderNo()).compareTo(b.getOrderNo());
	  });
	}

  public void sortDiagram(Diagram cat) {
		if(cat.getChildren() != null) {
			sortDiagram(cat.getChildren());
			for(Diagram ch : cat.getChildren()) {
				sortDiagram(ch);
			}
		}
  }

  public int createIndex(DiagramView cat, int index) {

    cat.setIndex(index++);
		if(cat.getChildren() != null) {
			for(DiagramView ch : cat.getChildren()) {
				index = createIndex(ch, index);
			}
    }
    return index;
  }
  
  public String findCatName(int id) {
    return repository.findCatName(id);
  }  

  // public DiagramView findByNameWithDiagram(String name) {
  //   List<DiagramParentBean> list = repository.findByName(name);
  //   DiagramParentBean p = list.get(0);
  //   DiagramView cat = new DiagramView(p.getItem());
  //   return cat;
  // }

  public DiagramView findByNameWithTopic(Integer catId, String date) {

    Optional<Diagram> opt = repository.findById(catId);
    sortDiagram(opt.get());
    DiagramView cat = new DiagramView(opt.get());
    cat.clearTopicOutDate(date);
    cat.updateParentCatId(cat.getId());
    
    return cat;
  }

  // public void addTopicToCat(TopicBean t, DiagramView cat, String topicCat) {
  //   if(cat.getName().equals(topicCat)) {
  //     cat.getChildren().add(new DiagramView(t));
  //     return;
  //   }
  //   for(DiagramView child : cat.getChildren()) {
  //     addTopicToCat(t, child, topicCat);
  //   }
  // }

  // public Diagram findByParentAndNameAndDate(String pName, String name, String date) {
  //   List<DiagramParentBean> res = repository.findByName(pName);
  //   Diagram root = null;
  //   if(res.size() > 0) {
  //     root = res.get(0).getItem();
  //   }
    
  //   if(root != null) {
  //     List<Diagram> objList = new ArrayList<Diagram>() ;
  //       searchDiagramChild(root, name, objList);
  //     if(objList.size() > 0)
  //       return objList.get(0);
  //   }

  //   return new Diagram();
  // }

  // public Optional<Diagram> findChild(String id){
  //   return repository.findById(Utl.parseInt(id));
  // }

  // public Diagram findChildByRootAndName(String root, String name){
  //   List<Diagram> objList = new ArrayList<Diagram>() ;
  //   Optional<Diagram> res = this.findChild(root);
  //   if(res.isPresent())
  //   {
  //     searchDiagramChild(res.get(), name, objList);
  //   }
  //   if(objList.size() > 0)
  //     return objList.get(0);
  //   return null;
  // }

  // public void searchDiagramChild(Diagram item, String name, List<Diagram> objList)
  // {
  //   if(item.getName().equals(name))
  //   {
  //     objList.add(item);
  //     return;      
  //   }
  //   for(Diagram child : item.getChildren())
  //   {
  //     if(objList.size() == 0)
  //       searchDiagramChild(child, name, objList);
  //   }
  //   return;
  // }

  // // public void save(Diagram p) {
  // //   repository.save(p);
  // // }

  // public void saveChild(Diagram c, String parent)
  // {
  //   Diagram cat = new Diagram();
  //   if(c.getId() != 0)
  //   {
  //     cat = repository.findById(c.getId()).orElse(cat);
  //   }
  //   Utl.copyPropertiesIgnoreNull(c, cat);
    
  //   int pid = Utl.parseInt(parent);
  //   if(Utl.check(pid)) {
  //     Optional<Diagram> res = repository.findById(pid);
  //     if(res.isPresent()) {
  //       cat.setParent(res.get());
  //     }
  //   } else {
  //     if(Utl.check(parent))
  //     {
  //       Diagram res = this.findChildByRootAndName(String.valueOf(c.getRoot()), parent);
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
  // //   Diagram cat;
  // //   Optional<Diagram> res = this.findChild(id);
  // //   if(res.isPresent())
  // //   {
  // //     cat = res.get();
  // //   }
  // //   else
  // //   {
  // //     cat = new Diagram();
  // //     cat.setId(Utl.parseInt(id));
  // //   }
  // //   cat.setName(name);
  // //   if(!parent.isEmpty())
  // //   {
  // //     Diagram p = this.findByParentAndName(parent, );
  // //     cat.setParent(p);
  // //   }
  // //   else if(id.length() >= 2)
  // //   {
  // //     this.findChild( id.substring(0, id.length() - 1)).ifPresent(x -> cat.setParent(x));
  // //   }

  // //   repository.save(cat);
  // // }

	public void AddToMap(DiagramView cat, Map<String, String> catList)
	{
    if(cat == null)
      return;
    catList.put(cat.getName(), Utl.parseIdToString(cat.getId()));
    if(cat.getChildren() != null)
    {
      for(DiagramView child : cat.getChildren())
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

	// public void updateroot(Diagram c, int rootid) {
	// 	if(Utl.check(c.getRoot()) && c.getRoot() != rootid) {
	// 		c.setRoot(rootid);
	// 		repository.save(c);
  //   }
  //   for(Diagram child : c.getChildren()) {
  //     updateroot(child, rootid);
  //   }
  // }
  
  // public int findItemDiagramIdByName(String category, String parentDiagram) {

  //   List<DiagramParentBean> list = null;
  //   if(Utl.check(parentDiagram)) {
  //     list = repository.findByName(parentDiagram);
  //   } else {
  //     list = repository.findAll();
  //   }
  //   for(DiagramParentBean p : list) {
  //     if("Event".equals(p.getName())) {
  //       continue;
  //     }
  //     int res = getDiagramIdByName(p.getItem(), category); 
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   if(Utl.check(parentDiagram)) {
  //     int res = findItemDiagramIdByName(category, ""); 
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   return 0;
  // }

  // public int getDiagramIdByName(Diagram p, String category) {
  //   if(category.equals(p.getName())) {
  //     return p.getId();
  //   }
  //   for(Diagram c : p.getChildren()) {
  //     int res = getDiagramIdByName(c, category);
  //     if(Utl.check(res)) {
  //       return res;
  //     }
  //   }

  //   return 0;
  // }

  // public List<TopicBean> findTopics() {
  //   return topicRepository.findAll(Sort.by(Direction.ASC, "startDate"));
  // }

  public Integer convertCategoryToDiagram(Integer id, Integer parentId) {
    Integer newId = null;
    if(!Utl.check(id)) return null;
    catRepository.findById(id);
    Optional<Category> opt = catRepository.findById(id);
    if(!opt.isPresent()) return null;
    Category cat = opt.get();
    catService.sortCategory(cat);
    newId = CtoD(cat, null);

    if(!Utl.check(parentId)) 
      parentId = cat.getParent().getId();
    if(Utl.check(parentId)) {
      Item i = new Item();
      i.setName(cat.getName());
      i.setLevel(1);
      i.setSystemUrl("/point/?catId=" + newId);
      i.setItemCategoryId(parentId);
      itemRepository.save(i);
    }

    //delete
    deleteCat(cat);

    return newId;
  }

  public Integer CtoD(Category cat, Diagram parent) {

    Diagram d = new Diagram();
    Utl.copyPropertiesIgnoreNull(cat, d);
    d.setId(0);
    d.setParent(parent);
    d.setChildren(null);
    repository.save(d);

    List<Item> items = itemRepository.findByItemCategoryId(cat.getId());
    for(Item i : items) {
      Point p = new Point();
      Utl.copyPropertiesIgnoreNull(i, p);
      p.setId(0);
      p.setDiagram(d.getId());

      // if(Utl.check(i.getChildCategoryId()) {

      // }
      pointRepository.save(p);

      if(itemService.checkChild(i.getId())) {
        i.setItemCategory(i.getEventCategory());
        i.setItemCategoryId(i.getEventCategoryId());
        itemRepository.save(i);
      } else {
        itemRepository.delete(i);
      }
    }

    if(cat.getChildren() != null) {
      for(Category c : cat.getChildren()) {
        CtoD(c, d);
      }
    }

    return d.getId();
  }

  public void deleteCat(Category cat) {
    if(cat.getChildren() != null) {
      for(Category c : cat.getChildren()) {
        deleteCat(c);
      }
    }
    catRepository.delete(cat);

  }

}