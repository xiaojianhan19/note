package com.note.demo.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model) {
		//CategoryChildBean category = service.findByNameAndDate("");
		//model.addAttribute("category", category);
		List<CategoryParentBean> categoryList = service.findAll();
		model.addAttribute("categoryList", categoryList);

		model.addAttribute("categoryBean", new CategoryParentBean());   
		return "category";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("categoryBean") CategoryParentBean categoryBean, Model model) {
		service.save(categoryBean);
		
		//service.save(categoryBean);
		return "redirect:/category/";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam(value = "itemId") String itemId) {
		service.findChild(itemId).ifPresent( item -> {
			model.addAttribute("item", item);
			CategoryChildBean c = new CategoryChildBean();
			c.setRoot(item.getId());
			model.addAttribute("categoryChildBean", c);
			model.addAttribute("parentId", item.getName());
		});
		return "category_child";
	}
	
	@RequestMapping(value = "/addChild", method = RequestMethod.POST)
	public String addChild(@ModelAttribute("categoryChildBean") CategoryChildBean categoryChildBean, @ModelAttribute("parentId") String parentId, Model model, RedirectAttributes redirectAttributes) {
		service.saveChild(categoryChildBean, parentId.trim());

		//service.save(categoryBean);
		String itemId = String.valueOf(categoryChildBean.getRoot());
		redirectAttributes.addAttribute("itemId", itemId);
		return "redirect:/category/detail";

	}


}