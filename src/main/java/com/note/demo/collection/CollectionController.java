package com.note.demo.collection;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import com.note.demo.category.CategoryService;
import com.note.demo.category.CategoryViewBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/collection")
public class CollectionController {
	//private static final Logger log = LoggerFactory.getLogger(CollectionController.class);
	String CName = "Collection";

	@Autowired
	HttpSession session;

	@Autowired
	CollectionService service;

	@Autowired
	CategoryService catService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readCollections(Model model) {
		String date = LocalDate.now().toString();
		
		String catName = "Animation";
		model.addAttribute("targetCat", catName);

		Map<String, String> catList = catService.GetCategoryMapByName(CName, LocalDate.now().toString());
		model.addAttribute("catList", catList);

        CategoryViewBean group = service.findAllInGroup(CName, catName, date);
		model.addAttribute("group", group);
		session.setAttribute("recentCat", catName);

        model.addAttribute("collectionBean", new CollectionParentBean());        
		return "collection";
	}

	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String readCollectionsByCat(@RequestParam(value = "group") String groupName, Model model) {
		String date = LocalDate.now().toString();
		
		model.addAttribute("targetCat", groupName);

		Map<String, String> catList = catService.GetCategoryMapByName("Collection", LocalDate.now().toString());
		model.addAttribute("catList", catList);

        CategoryViewBean group = service.findAllInGroup(CName, groupName, date);
		model.addAttribute("group", group);
		session.setAttribute("recentCat", groupName);

        model.addAttribute("collectionBean", new CollectionParentBean());        
		return "collection";
	}

	@RequestMapping(value = "/achievement", method = RequestMethod.GET)
	public String readAchievement(Model model) {
		String date = LocalDate.now().toString();
		
		String catName = "Fantasy";
		model.addAttribute("targetCat", catName);

		Map<String, String> catList = catService.GetCategoryMapByName("Achievement", LocalDate.now().toString());
		model.addAttribute("catList", catList);

        CategoryViewBean group = service.findAllInGroup(CName, catName, date);
		model.addAttribute("group", group);

        model.addAttribute("collectionBean", new CollectionParentBean());        
		return "Achievement";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("collectionBean") CollectionParentBean collectionBean, Model model) {
		service.save(collectionBean);
		Object rc = session.getAttribute("recentCat");
		if(rc == null || ("unsorted").equals(rc)) {
			return unsortedEdit(model);
		} else {
			return readCollectionsByCat(rc.toString(), model);
		}		
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam(value = "itemId") String itemId) {
		service.find(itemId).ifPresent( collectionBean -> {
			service.sortByIndex(collectionBean);
			model.addAttribute("collectionBean", collectionBean);
			//model.addAttribute("collectionBean", service.modifyBean(collectionBean));
			model.addAttribute("collectionChildBean", new CollectionChildBean(collectionBean));
		});
		Map<String, String> catList = catService.GetCategoryMapByName("Collection", LocalDate.now().toString());
		model.addAttribute("catList", catList);
		return "collection_child";
	}
	
	@RequestMapping(value = "/addChild", method = RequestMethod.POST)
	public String addChild(@ModelAttribute("collectionChildBean") CollectionChildBean collectionChildBean, Model model, RedirectAttributes redirectAttributes) {
		service.save(collectionChildBean);
		redirectAttributes.addAttribute("itemId", collectionChildBean.getParent().getId());
		return "redirect:/collection/detail";
	}
	
	@RequestMapping(value = "/unsorted", method = RequestMethod.GET)
	public String unsortedEdit(Model model) {
		//List<CollectionParentBean> list = service.findAll();
        List<CollectionParentBean> list = service.findUnsortedItems();
		model.addAttribute("colList", list);
		return "collection_edit";
	}

	@RequestMapping(value = "/Achievement_category", method = RequestMethod.GET)
	public String readByCategory(Model model, @RequestParam(value = "categoryName") String categoryName) {
		String date = LocalDate.now().toString();
		
		Map<String, String> catList = catService.GetCategoryMapByName("Achievement", LocalDate.now().toString());
		model.addAttribute("catList", catList);

        CategoryViewBean group = service.findAllInGroup("Achievement", "Achievement", date);
		model.addAttribute("group", group);

        model.addAttribute("collectionBean", new CollectionParentBean());        
		return "Achievement";
	}

	@RequestMapping(value = "/child", method = RequestMethod.GET)
	public String child(Model model, @RequestParam(value = "childId") String childId) {
		service.findChild(childId).ifPresent( collectionChildBean -> {
			model.addAttribute("collectionChildBean", collectionChildBean);
		});
		Map<String, String> catList = catService.GetCategoryMapByName("Collection", LocalDate.now().toString());
		model.addAttribute("catList", catList);
		return "collection_child_edit";
	}	

	@RequestMapping(value = "/childDetail", method = RequestMethod.GET)
	public String childDetail(Model model, @RequestParam(value = "childId") String childId) {
		service.findChild(childId).ifPresent( collectionChildBean -> {
			model.addAttribute("child", collectionChildBean);
		});
		return "collection_child_detail";
	}	

}