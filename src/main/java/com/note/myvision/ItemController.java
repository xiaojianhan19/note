package com.note.myvision;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/item")
public class ItemController {
	//private static final Logger log = LoggerFactory.getLogger(CollectionController.class);
	String CName = "Item";
	String catName = "Fantasy";
	String CatItemId = "41000543";
	String CatIdFantasy = "41000272";

	@Autowired
	HttpSession session;

	@Autowired
	ItemService service;

	@Autowired
	ItemRepository repository;

	@Autowired
	ResourceRepository resRepository;

	@Autowired
	CategoryService catService;

	@Resource
    private ResourceLoader resourceLoader;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readCollections(Model model, Device device) {
		//String date = LocalDate.now().toString();
		//session.setAttribute("targetCat", catName);

		CategoryViewBean itemGroups = service.findGroupByCategoryId(CatItemId);
		List<Object> guideGroups = new ArrayList<>(); 
		for(CategoryViewBean chv : itemGroups.getChildren()) {
			for(Object itv : chv.getItems()) {
				guideGroups.add(itv);
			}
		}
		model.addAttribute("guideGroups", guideGroups);

		//CategoryViewBean group = service.findAllInGroup(CName, catName, date);
		CategoryViewBean group = service.findGroupByCategoryId(CatIdFantasy);
		model.addAttribute("group", group);
		session.setAttribute("categoryId", CatIdFantasy);
		//session.setAttribute("recentCat", catName);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}
		return "group";
	}

	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String readCollectionsByCat(@RequestParam(value = "category", required = false) String category, 
					@RequestParam(value = "group") String groupName, Model model, Device device) {
		String date = LocalDate.now().toString();
		session.setAttribute("targetCat", groupName);
		session.setAttribute("recentCat", groupName);
		if(category != null) {
			session.setAttribute("TopCat", category);
		}
		String catName = (category==null) ? CName : category;
        CategoryViewBean group = service.findAllInGroup(catName, groupName, date);
		model.addAttribute("group", group);
        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}
		return "group";
	}

	@RequestMapping(value = "/diagramWithItem", method = RequestMethod.GET)
	public String group(@RequestParam(value = "categoryId", required = false) String categoryId, Model model, Device device) {

		CategoryViewBean itemGroups = service.findGroupByCategoryId(CatItemId);
		List<Object> guideGroups = new ArrayList<>(); 
		for(CategoryViewBean chv : itemGroups.getChildren()) {
			for(Object itv : chv.getItems()) {
				guideGroups.add(itv);
			}
		}
		model.addAttribute("guideGroups", guideGroups);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}

		if(Utl.check(categoryId)) {
			session.setAttribute("categoryId", categoryId);
			CategoryViewBean group = service.findGroupByCategoryId(categoryId);
			model.addAttribute("group", group);
			return "group";
		} else {
			return "redirect:/item/group";
		}		
	}	

	@RequestMapping(value = "/collectionsAboveLevel", method = RequestMethod.GET)
	public String readCollectionsAboveL4(@RequestParam(value = "category", required = false) String category, 
					@RequestParam(value = "level") String level, Model model) {
		String catName = (category==null) ? CName : category;
		CategoryViewBean group = service.findAllInGroupAboveLevel(catName, catName, level);
		group.clearChildNoItem();
		model.addAttribute("group", group);

        model.addAttribute("itemBean", new ItemBean());        
		return "group";
	}

	@RequestMapping(value = "/item", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam(value = "itemId") String itemId) {

		ItemViewBean item = service.findWithResource(itemId);
		model.addAttribute("itemBean", item);
		return "item_detail";
	}

	@RequestMapping(value = "/resource", method = RequestMethod.GET)
	public String childDetail(Model model, @RequestParam(value = "resourceId") Integer resourceId) {
		resRepository.findById(resourceId).ifPresent( resource -> {
			model.addAttribute("resourceBean", resource);
		});
		return "item_resource";
	}

	@RequestMapping(value = "/itemEdit", method = RequestMethod.GET)
	public String edit(Model model, @RequestParam(value = "itemId") String itemId) {

		ItemViewBean item = service.findWithResource(itemId);
		model.addAttribute("itemBean", item);

		ResourceBean resourceBean = new ResourceBean();
		resourceBean.setType("");
		resourceBean.setParentId(item.getId());
		resourceBean.setStatus(Utl.Status.EV3_FINISHED.getValue());
		resourceBean.setDate(LocalDate.now().toString());
		resourceBean.setUpdateDate(LocalDate.now().toString());
		model.addAttribute("resourceBean", resourceBean);
		return "item_edit";
	}

	@RequestMapping(value = "/resourceEdit", method = RequestMethod.GET)
	public String editDetail(Model model, @RequestParam(value = "resourceId") Integer resourceId) {
		
		resRepository.findById(resourceId).ifPresent( resource -> {
			model.addAttribute("resourceBean", resource);
			ItemViewBean item = service.findWithResource(Utl.parseIdToString(resource.getParentId()));
			model.addAttribute("itemBean", item);
		});

		return "item_edit";
	}

	@RequestMapping(value = "/itemAdd", method = RequestMethod.GET)
	public String itemAdd(Model model, @RequestParam(value = "itemId") String itemId) {

		model.addAttribute("itemBean", new ItemBean());
		service.find(itemId).ifPresent( item -> {
			model.addAttribute("itemBean", item);
		});
		
		return "item_add"; 
	}

	// @RequestMapping(value = "/addItemByCat", method = RequestMethod.GET)
	// public String addItemByCat(@ModelAttribute("categooryId") int categoryId, Model model, Device device) {

	// 	ItemBean p = new ItemBean();
	// 	p.setCategoryId(categoryId);
	// 	p.setCategory(catService.findCatName(categoryId));
	// 	p.setStatus(Utl.Status.EV3_FINISHED.getValue());
	// 	p.setLevel(1);
	// 	p.setDate(LocalDate.now().toString());
	// 	p.setReleaseDate(LocalDate.now().toString());

	// 	Object rc = session.getAttribute("recentCat");
	// 	if(rc != null) {
	// 		p.setType(rc.toString());
	// 	} else {
	// 		p.setType("collection");
	// 	}

	// 	model.addAttribute("itemBean", p);
	// 	return "item_add";
	// }

	@RequestMapping(value = "/addByCat", method = RequestMethod.GET)
	public String addByCat(@ModelAttribute("targetId") int targetId, @ModelAttribute("targetCat") String targetCat, Model model, Device device) {

		ItemBean p = new ItemBean();
		p.setCategoryId(targetId);
		p.setCategory(targetCat);
		p.setStatus(Utl.Status.EV3_FINISHED.getValue());
		p.setLevel(1);
		p.setDate(LocalDate.now().toString());
		p.setReleaseDate(LocalDate.now().toString());

		Object rc = session.getAttribute("recentCat");
		if(rc != null) {
			p.setType(rc.toString());
		} else {
			p.setType("collection");
		}

		model.addAttribute("itemBean", p);
		return "item_add";
	}

	@RequestMapping(value = "/addChild", method = RequestMethod.GET)
	public String addChildItem(@ModelAttribute("parentId") int parentId, Model model, Device device) {

		ItemBean p = new ItemBean();
		p.setParentId(parentId);
		p.setCategoryId(0);
		p.setCategory("");
		p.setStatus(Utl.Status.EV3_FINISHED.getValue());
		p.setLevel(1);
		p.setDate(LocalDate.now().toString());
		p.setReleaseDate(LocalDate.now().toString());

		Object rc = session.getAttribute("recentCat");
		if(rc != null) {
			p.setType(rc.toString());
		} else {
			p.setType("collection");
		}

		model.addAttribute("itemBean", p);
		
		return "item_add";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute("itemBean") ItemBean itemBean, Model model, Device device, RedirectAttributes redirectAttributes) {
		service.save(itemBean);
		Object rc = session.getAttribute("categoryId");
		if(rc != null) {
			redirectAttributes.addAttribute("categoryId", rc.toString());
			return "redirect:/item/diagramWithItem"; 			
		}
		return "redirect:/item/group"; 
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam(value = "delId") String delId, RedirectAttributes redirectAttributes) {
		service.delete(delId);
		Object rc = session.getAttribute("categoryId");
		if(rc != null) {
			redirectAttributes.addAttribute("categoryId", rc.toString());
			return "redirect:/item/diagramWithItem"; 			
		}
		return "redirect:/item/group"; 
	}
	
	@RequestMapping(value = "/saveResource", method = RequestMethod.POST)
	public String saveResource(@ModelAttribute("resourceBean") ResourceBean resourceBean, Model model, RedirectAttributes redirectAttributes) {

		if("Item".equals(resourceBean.getType())) {
			ItemBean newItem = new ItemBean();
			newItem.setName(resourceBean.getName());
			newItem.setDate(resourceBean.getDate());
			newItem.setReleaseDate(resourceBean.getDate());
			newItem.setParentId(resourceBean.getParentId());			
			newItem.setLevel(1);
			newItem.setMemo(resourceBean.getText());
			repository.save(newItem);

		} else {
			resRepository.save(resourceBean);
		}
		
		redirectAttributes.addAttribute("itemId", resourceBean.getParentId());
		return "redirect:/item/itemEdit";
	}
	
	@RequestMapping(value = "/unsorted", method = RequestMethod.GET)
	public String unsortedEdit(Model model) {
		//List<ItemBean> list = service.findAll();
        // List<ItemBean> list = service.findUnsortedItems();
		// model.addAttribute("colList", list);
		// return "collection_edit";
		return "redirect:/item/";
	}

	@RequestMapping(value = "/updateAll", method = RequestMethod.POST)
	public String updateAll(Model model, @RequestParam String changeCategory, 
									@RequestParam String parentCategory,
									@RequestParam List<String> changeList,
									@RequestParam String changeLevel,
									@RequestParam String deleteFlg, RedirectAttributes redirectAttributes) {
		service.updateAll(changeList, changeCategory, parentCategory, changeLevel, deleteFlg);
		Object rc = session.getAttribute("categoryId");
		if(rc != null) {
			redirectAttributes.addAttribute("categoryId", rc.toString());
			return "redirect:/item/diagramWithItem"; 			
		}
		return "redirect:/item/group"; 
	}

	/*
	@RequestMapping(value = "/{filename:.+}")
	@ResponseBody
	public ResponseEntity<?> getFile(@PathVariable String filename) {
		try {
			return ResponseEntity.ok(resourceLoader.getResource("file:" + Paths.get("/tmp/myvision/" + filename)));
		} catch (Exception e) {
			return ResponseEntity.notFound().build();
		}
	}
	*/

	
	@RequestMapping(value = "/convertToItem", method = RequestMethod.GET)
	public String convertToItem(@ModelAttribute("resourceId") int resourceId, Model model, RedirectAttributes redirectAttributes) {
		try {
			resRepository.findById(resourceId).ifPresent(resourceBean -> {
				redirectAttributes.addAttribute("itemId", resourceBean.getParentId());

				ItemBean newItem = new ItemBean();
				newItem.setName(resourceBean.getName());
				newItem.setDate(resourceBean.getDate());
				newItem.setReleaseDate(resourceBean.getDate());
				newItem.setParentId(resourceBean.getParentId());
				newItem.setLevel(1);
				repository.save(newItem);
	
				resourceBean.setParentId(newItem.getId());
				resRepository.save(resourceBean);
			});			
		} catch (Exception e) {

		}
		
		return "redirect:/item/itemEdit";
	}
}