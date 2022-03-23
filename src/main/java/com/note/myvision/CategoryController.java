package com.note.myvision;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/category")
public class CategoryController {

	@Autowired
	CategoryService service;

	@Autowired
	CategoryChildRepository itemRepository;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model) {
		//CategoryChildBean category = service.findByNameAndDate("");
		//model.addAttribute("category", category);
		List<CategoryParentBean> categoryList = service.findAll();
		model.addAttribute("categoryList", categoryList);

		model.addAttribute("categoryBean", new CategoryParentBean());   
		return "category";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String add(@ModelAttribute("categoryBean") CategoryParentBean categoryBean, Model model) {
		service.save(categoryBean);
		
		//service.save(categoryBean);
		return "redirect:/category/";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, Device device, @RequestParam(value = "itemId") String itemId, @ModelAttribute("parentId") String parentId) {
		service.findChild(itemId).ifPresent( item -> {						
			service.sortCategoryChildBean(item);
			model.addAttribute("item", item);
			CategoryChildBean c = new CategoryChildBean();
			c.setRoot(item.getId());
			model.addAttribute("categoryChildBean", c);
			if(!parentId.equals("")) {
				model.addAttribute("parentId", parentId);
			}
			else {
				model.addAttribute("parentId", item.getName());
			}
			session.setAttribute("CategoryName", item.getName());
		});
		if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}
		return "category_child";
	}
	
	@RequestMapping(value = "/saveChild", method = RequestMethod.POST)
	public String addChild(@ModelAttribute("categoryChildBean") CategoryChildBean categoryChildBean, @ModelAttribute("parentId") String parentId, Model model, RedirectAttributes redirectAttributes) {
		service.saveChild(categoryChildBean, parentId.trim());

		//service.save(categoryBean);
		String itemId = String.valueOf(categoryChildBean.getRoot());
		redirectAttributes.addAttribute("itemId", itemId);
		redirectAttributes.addAttribute("parentId", parentId);
		return "redirect:/category/detail";

	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, @RequestParam(value = "delId") String delId) {
		// CategoryChildBean child = service.findChild(itemId).get();
		// service.deleteItem(child);
		// CategoryParentBean parent = service.find(delId).get();
		// service.delete(parent);
		service.find(delId).ifPresent( item -> {
			service.delete(item);		
		});
		return read(model);
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Model model, Device device, @RequestParam(value = "id") String id, RedirectAttributes redirectAttributes) {

		redirectAttributes.addAttribute("itemId", "");
		redirectAttributes.addAttribute("parentId", "");
		int itemId = Utl.parseInt(id);
		if(Utl.check(itemId)) {
			itemRepository.findById(itemId).ifPresent( item -> {
				redirectAttributes.addAttribute("itemId", item.getRoot());	
				model.addAttribute("categoryChildBean", item);
				model.addAttribute("parentId", item.getParent().getId());

				int rootId = item.getRoot();
				service.findChild(Utl.parseIdToString(rootId)).ifPresent( root -> {						
					service.sortCategoryChildBean(root);
					model.addAttribute("item", root);
					CategoryChildBean c = new CategoryChildBean();
					c.setRoot(root.getId());
					session.setAttribute("CategoryName", root.getName());
				});
			});
		}

		if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}
		return "category_child";
	}

	@RequestMapping(value = "/delitem", method = RequestMethod.GET)
	public String deleteItem(Model model, @RequestParam(value = "id") String id, RedirectAttributes redirectAttributes) {
		// CategoryChildBean child = service.findChild(itemId).get();
		// service.deleteItem(child);
		// CategoryParentBean parent = service.find(delId).get();
		// service.delete(parent);
		redirectAttributes.addAttribute("itemId", "");
		redirectAttributes.addAttribute("parentId", "");
		int itemId = Utl.parseInt(id);
		if(Utl.check(itemId)) {
			itemRepository.findById(itemId).ifPresent( item -> {
				redirectAttributes.addAttribute("itemId", item.getRoot());				
				itemRepository.delete(item);
			});
		}

		return "redirect:/category/detail";
	}
	

	@RequestMapping(value = "/updateroot", method = RequestMethod.GET)
	public String updateRoot(Model model) {
		//CategoryChildBean category = service.findByNameAndDate("");
		//model.addAttribute("category", category);
		List<CategoryParentBean> categoryList = service.findAll();
		for(CategoryParentBean p : categoryList) {
			String itemId = Utl.parseIdToString(p.getItem().getId());
			Optional<CategoryChildBean> res = service.findChild(itemId);
			if(res.isPresent()) {
				CategoryChildBean item = res.get();
				service.updateroot(item, p.getItem().getId());
			}
		}

		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryBean", new CategoryParentBean());   
		return "category";
	}

	@RequestMapping(value = "/addByCat", method = RequestMethod.GET)
	public String addByCat(@ModelAttribute("parentId") Integer parentId, 
					@ModelAttribute("root") Integer root, Model model, Device device) {

		CategoryChildBean c = new CategoryChildBean();
		itemRepository.findById(parentId).ifPresent( p -> {
			c.setParent(p);
		});		
		c.setRoot(root);
		model.addAttribute("categoryChildBean", c);
		
		return "category_add";
	}	

}