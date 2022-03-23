package com.note.myvision;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/dataconvert/")
public class DataConvertController {

	//@Autowired
	//TimeRepository tRep;
	// @Autowired
	// ItemRepository iRep;

	// @Autowired
	// CategoryService catService;
	// @Autowired
	// CategoryChildRepository catRepository;

	// @Autowired
	// PersonService perService;
	// @Autowired
	// PersonRepository perRepository;
	// @Autowired
	// ResourceRepository rRep;

	// @Autowired
	// CollectionParentRepository colRepository;

	// @Autowired
	// EventParentRepository eveRepository;

	// @Autowired
	// TopicRepository topRepository;

    // @Autowired
    // DiaryRepository diaryRepository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayIndex() {
		return "index";
	}
	
	// @RequestMapping(value = "/convertCategory", method = RequestMethod.GET)
	// public String convertCategory() {


	// 	//event
	// 	catRepository.findById(41000235).ifPresent( item -> {
	

	// 		CategoryChildBean root = new CategoryParentBean();
	// 		root.setName("Event");
	// 		root.setInputDate("2019-11-10");
	// 		root.setItemId(rootItem.getId());
	// 		catRepository.save(root);

	// 		saveCategory(item, root, "2019-11-10", "Time", "Regular");
	// 	});
	// 	//person
	// 	catRepository.findById(41000336).ifPresent( item -> {
	// 		saveCategory(item, root, "2021-05-25", "Item", "Regular");
	// 	});
	// 	//Collection
	// 	catRepository.findById(41000259).ifPresent( item -> {
	// 		saveCategory(item, root, "2020-07-26", "Item", "Regular");
	// 	});
	// 	//Achievement
	// 	catRepository.findById(41000269).ifPresent( item -> {
	// 		saveCategory(item, root, "2020-08-09", "Item", "Regular");
	// 	});
	// 	// //Fantasy
	// 	// catRepository.findById(41000193).ifPresent( item -> {
	// 	// 	saveCategory(item, root, "2019-10-21", "Item", "Regular");
	// 	// });
		
	// 	List<TopicBean> topics = topRepository.findAll(); 
	// 	for(TopicBean t : topics)
	// 	{
	// 		saveTopic(t);
	// 	} 

	// 	//
	

	// 	return "index";
	// }

	// public void saveCategory(CategoryChildBean cc, CategoryBean p, String date, String type, String status) {
	// 	ItemBean item = new ItemBean();
	// 	item.setName(cc.getName());
	// 	item.setType("Category");
	// 	item.setStatus(status);
	// 	item.setDate(date);
	// 	iRep.save(item);

	// 	CategoryBean n = new CategoryBean();
	// 	n.setName(cc.getName());
	// 	n.setType(type);
	// 	n.setStatus(status);
	// 	n.setDate(date);
	// 	n.setItemId(item.getId());
	// 	n.setParent(p);
	// 	cRep.save(n);
	// 	for(CategoryChildBean child : cc.getChildren()) {
	// 		saveCategory(child, n, date, type, status);
	// 	}
	// }

	// public void saveTopic(TopicBean t) {
	// 	ItemBean item = new ItemBean();
	// 	item.setName(t.getName());
	// 	item.setType("Category");
	// 	item.setStatus("OnProcess");
	// 	item.setDate(t.getStartDate());
	// 	iRep.save(item);

	// 	CategoryBean n = new CategoryBean();
	// 	n.setName(item.getName());
	// 	n.setType("Time");
	// 	n.setStatus(item.getStatus());
	// 	n.setDate(item.getDate());
	// 	n.setItemId(item.getId());

	// 	List<CategoryBean> list = cRep.findByNameAndType(t.getEveCategory(), "Time");
	// 	if(list.size() > 0) {
	// 		CategoryBean parent = list.get(0);
	// 		n.setParent(parent);
	// 	}
	// 	cRep.save(n);

	// }

	// @RequestMapping(value = "/convertPerson", method = RequestMethod.GET)
	// public String convertItem() {

	// 	ItemBean item = new ItemBean();
	// 	item.setName("Diary");
	// 	item.setName2("");
	// 	item.setName3("");
	// 	item.setLevel(7);
	// 	item.setType("Diary");
	// 	item.setStatus("Finished");
	// 	item.setDate("2019-03-11");
	// 	item.setReleaseDate("2019-03-11");
	// 	item.setMemo("");
	// 	List<CategoryChildBean> list = catRepository.findByNameAndRoot("Note", 41000235);
	// 	if(list.size() > 0) {
	// 		CategoryChildBean parent = list.get(0);
	// 		item.setCategoryId(parent.getId());
	// 	}
	// 	iRep.save(item);

	// 	List<DiaryBean> dl = diaryRepository.findAll(Sort.by(Direction.ASC, "date"));

	// 	for(DiaryBean child : dl) {
	// 		ResourceBean r = new ResourceBean();
	// 		if(Utl.check(child.getMemo())) {
	// 			String memo = child.getMemo();
	// 			int len = (memo.length() > 16) ? 16 : memo.length();
	// 			r.setName(memo.substring(0, len));
	// 		} else {
	// 			continue;
	// 		}
	// 		r.setType("text");
	// 		r.setStatus("Finished");
	// 		r.setDate(child.getDate());
	// 		r.setText(child.getMemo());
	// 		r.setParentId(item.getId());
	// 		rRep.save(r);
	// 	}	

	// 	String date = LocalDate.now().toString();
	// 	List<PersonParentBean> datas = perRepository.findAll(Sort.by(Direction.ASC, "id"));
	// 	for(PersonParentBean p : datas) {
	// 		savePerson(p);
	// 	}

	// 	return "index";
	// }
	
	// public void savePerson(PersonParentBean p) {
	// 	ItemBean item = new ItemBean();
	// 	item.setName(p.getName());
	// 	item.setName2(p.getName2());
	// 	item.setName3(p.getName3());

	// 	item.setType("person");
	// 	item.setCategory(p.getCategory());
	// 	item.setStatus(p.getStatus());
	// 	item.setDate(p.getInputDate());

	// 	if(Utl.check(p.getAddress())) {
	// 		item.setMemo(p.getAddress() + "\r\n"+ p.getMemo());
	// 	} else {
	// 		item.setMemo(p.getMemo());
	// 	}
	// 	List<CategoryChildBean> list = catRepository.findByNameAndRoot(p.getCategory(), 41000336);
	// 	if(list.size() > 0) {
	// 		CategoryChildBean parent = list.get(0);
	// 		item.setCategoryId(parent.getId());
	// 	}

	// 	iRep.save(item);
	// }

	// @RequestMapping(value = "/convertCollection", method = RequestMethod.GET)
	// public String convertCollection() {
	// 	//
	// 	List<CollectionParentBean> datas = colRepository.findAll(Sort.by(Direction.ASC, "id"));
	// 	for(CollectionParentBean p : datas) {
	// 		saveCollection(p);
	// 	}

	// 	return "index";
	// }	

	// public void saveCollection(CollectionParentBean p) {
	// 	ItemBean item = new ItemBean();
	// 	item.setName(p.getName());
	// 	item.setName2(p.getName2());
	// 	item.setName3(p.getName3());
	// 	item.setLevel(p.getLevel());
	// 	item.setType("collection");
	// 	item.setCategory(p.getCategory());
	// 	item.setStatus(p.getStatus());
	// 	item.setDate(p.getInputDate());
	// 	item.setReleaseDate(p.getReleaseDate());
	// 	item.setMemo(p.getMemo());
	// 	if(p.getTags() != null && p.getTags().size() > 0) {
	// 		String cstr = "";
	// 		for(String s : p.getTags()) {
	// 			if(Utl.check(cstr)) {
	// 				cstr = cstr + s;
	// 			} else {
	// 				cstr = cstr + ";" + s;
	// 			}				
	// 		}
	// 		item.setTags(cstr);
	// 	} else {
	// 		item.setTags("");
	// 	}	
			
	// 	List<CategoryChildBean> list = catRepository.findByNameAndRoot(p.getCategory(), 41000259);
	// 	if(list.size() > 0) {
	// 		CategoryChildBean parent = list.get(0);
	// 		item.setCategoryId(parent.getId());
	// 	} else {
	// 		List<CategoryChildBean> list2 = catRepository.findByNameAndRoot(p.getCategory(), 41000269);
	// 		if(list2.size() > 0) {
	// 			CategoryChildBean parent = list2.get(0);
	// 			item.setCategoryId(parent.getId());
	// 		}
	// 	}
	// 	iRep.save(item);

	// 	for(CollectionChildBean child : p.getItems()) {
	// 		saveCollectionChild(child, p, item);
	// 	}

	// }

	// public void saveCollectionChild(CollectionChildBean p, CollectionParentBean org, ItemBean parent) {
		
	// 	if(p.getType().equals("Character")) {
	// 		ItemBean item = new ItemBean();
	// 		item.setName(p.getName());
	// 		item.setName2(p.getName2());
	// 		item.setName3(p.getName3());
	// 		item.setLevel(4);
	// 		item.setType(p.getType());
	// 		item.setStatus("Finished");
	// 		item.setDate(p.getInputDate());
	// 		item.setReleaseDate(org.getReleaseDate());
	// 		item.setMemo(p.getMemo());
	// 		item.setParentId(parent.getId());
	// 		iRep.save(item);
	// 	} else {
	// 		ResourceBean item = new ResourceBean();
	// 		if(Utl.check(p.getName())) {
	// 			item.setName(p.getName());
	// 		}
	// 		else {
	// 			if(Utl.check(p.getMemo())) {
	// 				String memo = p.getMemo();
	// 				int len = (memo.length() > 20) ? 20 : memo.length();
	// 				item.setName(memo.substring(0, len));
	// 			}
	// 			else {
	// 				return;
	// 			}
	// 		}
			
	// 		if(p.getType().equals("Setting")) {
	// 			item.setIndex(p.getIndex() + 8000);
	// 		} else {
	// 			item.setIndex(p.getIndex());
	// 		}
	// 		item.setType(p.getType());
	// 		item.setStatus("Finished");
	// 		item.setDate(p.getInputDate());
	// 		item.setUpdateDate(p.getUpdateDate());
	// 		item.setText(p.getMemo());
	// 		item.setParentId(parent.getId());
	// 		rRep.save(item);
	// 	}
	// }
	
	// @RequestMapping(value = "/convertEvent", method = RequestMethod.GET)
	// public String convertEvent() {
	// 	List<EventParentBean> datas = eveRepository.findAll(Sort.by(Direction.ASC, "id"));
	// 	for(EventParentBean p : datas) {
	// 		saveEvent(p);
	// 	}
	// 	return "index";
	// }
	
	// public void saveEvent(EventParentBean p) {
	// 	String date = LocalDate.now().toString();
	// 	if(p.getItems() != null && p.getItems().size() > 0) {
	// 		date = p.getItems().get(0).getDate();
	// 	}
		
	// 	TimeBean t = new TimeBean();
	// 	t.setName(p.getName());
	// 	t.setStatus(p.getStatus());
	// 	List<CategoryBean> list = cRep.findByNameAndType(p.getCategory(), "Time");
	// 	if(list.size() > 0) {
	// 		CategoryBean parent = list.get(0);
	// 		t.setParentCatId(parent.getId());
	// 	}

	// 	List<ItemBean> itemTarget = iRep.findByName(p.getName());
		
	// 	boolean isItem = false;
	// 	if(itemTarget.size() > 0) {
	// 		isItem = true;
	// 		ItemBean refItem = itemTarget.get(0);
	// 		if(refItem.getType().equals("Person")) {
	// 			t.setPersonId(refItem.getId());
	// 			t.setType("P");
	// 		} else {
	// 			t.setObjectId(refItem.getId());
	// 			t.setType("O");
	// 		}
	// 	} else {
	// 		ItemBean item = new ItemBean();
	// 		item.setName(p.getName());
	// 		item.setType("Event");
	// 		item.setStatus(p.getStatus());
	// 		item.setDate(date);		
	// 		item.setMemo("");
	// 		iRep.save(item);
	// 		t.setEventId(item.getId());
	// 		t.setType("E");
	// 	}

	// 	for(EventChildBean c : p.getItems()) {
	// 		if(isItem && c.getTime() < 0.11 && c.getTime() > 0.0001) {
	// 			continue;
	// 		}
	// 		TimeBean n = new TimeBean(t, c.getDate());
	// 		n.setDate(c.getDate());
	// 		n.setTime(c.getTime());
	// 		n.setMemo(c.getMemo());
	// 		tRep.save(n);
	// 	}


	// }

}