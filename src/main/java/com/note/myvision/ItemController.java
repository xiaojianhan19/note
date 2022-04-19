package com.note.myvision;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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

	Integer RootCatId = 10000001;
	Integer ItemCatId = 10000005;

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

	@Autowired
	CategoryRepository catRepository;

	@javax.annotation.Resource
    private ResourceLoader resourceLoader;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model, Device device, Integer catId) {

		// nav 
		CategoryView guideCat = service.findGroupByCategoryId(ItemCatId, -9);
		List<Object> guides = new ArrayList<>(); 
		for(CategoryView chv : guideCat.getChildren()) {
			for(Object itv : chv.getItems()) {
				guides.add(itv);
			}
		}
		model.addAttribute("guides", guides);

		// diagram 
		if(!Utl.check(catId)) {
			catId = RootCatId;
		}
		CategoryView diagram = service.findGroupByCategoryId(catId, -9);
		model.addAttribute("diagram", diagram);
		session.setAttribute("catId", catId);

		// catList
		Map<String, String> catList = new TreeMap<String, String>();
		catService.AddToMap(diagram, catList);
		model.addAttribute("catList", catList);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		session.setAttribute("saveByCat", false);
		return "diagram";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String itemAdd(Model model, Integer id, Integer parentId, Integer catId) {

		if(Utl.check(id)) {
			repository.findById(id).ifPresent( item -> {
				model.addAttribute("item", item);
			});
		} else {
			Item n = new Item();
			n.setLevel(1);
			n.setDate(LocalDate.now().toString());
			n.setReleaseDate(LocalDate.now().toString());

			if(Utl.check(parentId)) {
				repository.findById(parentId).ifPresent( item -> {
					n.setParentId(item.getId());
				});
			}
			if(Utl.check(catId)) {
				n.setItemCategoryId(catId);
				n.setItemCategory(catRepository.findCatName(catId));
				n.setType(catRepository.findCatType(catId));			
			}

			model.addAttribute("item", n);
		}

		return "item_edit"; 
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Item item, Boolean createCat, Model model, Device device, RedirectAttributes redirectAttributes) {
		if(createCat != null) {
			if(createCat && !Utl.check(item.getChildCategoryId())) {
				Category nc = new Category();
				nc.setName(item.getName());
				nc.setDate(LocalDate.now().toString());
				catRepository.save(nc);
				item.setChildCategoryId(nc.getId());
			}
		}

		service.save(item);
		
		if(Utl.check(item.getParentId())) {
			redirectAttributes.addAttribute("id", item.getParentId());
			return "redirect:/item/viewEdit"; 
		}

		Object rc = session.getAttribute("catId");
		if(rc != null) {
			redirectAttributes.addAttribute("catId", rc.toString());		
		}
		return "redirect:/item/"; 
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam(value = "delId") String delId, RedirectAttributes redirectAttributes) {
		service.delete(delId);
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			redirectAttributes.addAttribute("catId", rc.toString());		
		}
		return "redirect:/item/"; 
	}
	
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, Integer id) {

		ItemView iv = service.findWithResource(id);
		model.addAttribute("item", iv);
		return "item_view";
	}

	@RequestMapping(value = "/resource", method = RequestMethod.GET)
	public String childDetail(Model model, Integer id) {
		resRepository.findById(id).ifPresent( resource -> {
			model.addAttribute("resourceBean", resource);
		});
		return "resource";
	}

	@RequestMapping(value = "/viewEdit", method = RequestMethod.GET)
	public String edit(Model model, Integer id) {

		ItemView item = service.findWithResource(id);
		model.addAttribute("item", item);

		Resource res = new Resource();
		res.setParentId(item.getId());
		res.setDate(LocalDate.now().toString());
		res.setUpdateDate(LocalDate.now().toString());
		model.addAttribute("resource", res);
		return "item_view_edit";
	}

	@RequestMapping(value = "/resourceEdit", method = RequestMethod.GET)
	public String editDetail(Model model, Integer id, Integer itemId) {
		
		if(Utl.check(id)) {
			resRepository.findById(id).ifPresent( res -> {
				model.addAttribute("resource", res);
				repository.findById(res.getParentId()).ifPresent(item -> {
					model.addAttribute("item", item);
				});
			});
		} else {
			Resource res = new Resource();
			res.setParentId(itemId);
			res.setType("Text");
			res.setDate(LocalDate.now().toString());
			res.setUpdateDate(LocalDate.now().toString());
			model.addAttribute("resource", res);
			repository.findById(res.getParentId()).ifPresent(item -> {
				model.addAttribute("item", item);
			});
		}

		return "resource_edit";
	}

	@RequestMapping(value = "/saveResource", method = RequestMethod.POST)
	public String saveResource(Resource resource, Model model, RedirectAttributes redirectAttributes) {

		resource.setUpdateDate(LocalDate.now().toString());
		resRepository.save(resource);		
		redirectAttributes.addAttribute("id", resource.getParentId());
		return "redirect:/item/viewEdit";
	}

	@RequestMapping(value = "/updateItemList", method = RequestMethod.POST)
	public String updateItemList(Model model, @RequestParam List<Integer> changeList, Integer changeCatId, Integer changeParentId, Integer changeLevel,
									Boolean deleteFlg, RedirectAttributes redirectAttributes) {
		service.updateItemList(changeList, changeCatId, changeParentId, changeLevel, deleteFlg);
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			redirectAttributes.addAttribute("catId", rc.toString());		
		}
		return "redirect:/item/"; 
	}
	
	@RequestMapping(value = "/convertToItem", method = RequestMethod.GET)
	public String convertToItem(@ModelAttribute("resourceId") int resourceId, Model model, RedirectAttributes redirectAttributes) {
		try {
			resRepository.findById(resourceId).ifPresent(resourceBean -> {
				redirectAttributes.addAttribute("itemId", resourceBean.getParentId());

				Item newItem = new Item();
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

	@RequestMapping(value = "/itemAboveLevel", method = RequestMethod.GET)
	public String readAboveLevel(Integer catId, Integer level, Model model) {
		if(!Utl.check(catId)) {
			catId = RootCatId;
		}
		if(!Utl.check(level)) {
			level = 4;
		}
		CategoryView diagram = service.findGroupByCategoryId(catId, level);
		diagram.clearChildNoItem();
		model.addAttribute("diagram", diagram);
		session.setAttribute("catId", catId);   
		return "diagram";
	}

	// @RequestMapping(value = "/unsorted", method = RequestMethod.GET)
	// public String unsortedEdit(Model model) {
	// 	//List<Item> list = service.findAll();
    //     // List<Item> list = service.findUnsortedItems();
	// 	// model.addAttribute("colList", list);
	// 	// return "collection_edit";
	// 	return "redirect:/item/";
	// }

}