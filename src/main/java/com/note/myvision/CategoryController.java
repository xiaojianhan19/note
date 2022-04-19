package com.note.myvision;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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

    private Integer RootCatId = 10000001;

	@Autowired
	CategoryService service;

	@Autowired
	CategoryRepository repository;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model, Device device, Integer id) {
		if(!Utl.check(id)) {
			id = RootCatId;
		}
		session.setAttribute("catId", id);

		repository.findById(id).ifPresent( cat -> {
			service.sortCategory(cat);
			model.addAttribute("cat", cat);
		});
		if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		session.setAttribute("saveByCat", true);
		return "category";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Category catBean, Model model, RedirectAttributes redirectAttributes) {
		repository.save(catBean);

		String catId = RootCatId.toString();
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			catId = rc.toString();
		}

		Object flg = session.getAttribute("saveByCat");
		if(flg == null || false == (boolean)flg) {
			redirectAttributes.addAttribute("catId", catId);
			return "redirect:/item/";
		} else {
			redirectAttributes.addAttribute("id", catId);
			if(catBean.getParent() != null) {
				redirectAttributes.addAttribute("parentId", catBean.getParent().getId());
			}
			return "redirect:/category/";
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Model model, Integer id, RedirectAttributes redirectAttributes) {
		if(Utl.check(id)) {
			repository.findById(id).ifPresent( cat -> {
				repository.delete(cat);
			});
		}

		String catId = RootCatId.toString();
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			catId = rc.toString();
		}
		redirectAttributes.addAttribute("id", catId);
		return "redirect:/category/";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Model model, Device device, Integer id, Integer parentId) {

		if(Utl.check(id)) {
			repository.findById(id).ifPresent( cat -> {
				model.addAttribute("catBean", cat);
				model.addAttribute("parentName", cat.getParent().getName());
			});
		} else {
			Category c = new Category();		
			if(Utl.check(parentId)) {
				repository.findById(parentId).ifPresent( p -> {
					c.setParent(p);
					c.setType(p.getType());
					model.addAttribute("parentName", p.getName());
				});
			}
			c.setDate(LocalDate.now().toString());
			model.addAttribute("catBean", c);
		}

		return "category_edit";
	}

	@RequestMapping(value = "/editDiagram", method = RequestMethod.GET)
	public String editDiagram(Model model, Device device, Integer id) {

		if(!Utl.check(id)) {
			id = RootCatId;
		}
		session.setAttribute("catId", id);

		repository.findById(id).ifPresent( cat -> {
			service.sortCategory(cat);
			CategoryView cv = new CategoryView(cat);
			service.createIndex(cv, 0);
			model.addAttribute("cat", cv);
		});
		if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		model.addAttribute("form", new CategoryForm());
		return "category_group";
	}

	@RequestMapping(value = "/saveList", method = RequestMethod.POST)
	public String saveList(CategoryForm form, Model model, RedirectAttributes redirectAttributes) {

		for(CategoryView cv : form.getItems()) {
			if(cv.getIsUpdate()) {

				Category c = new Category();
				if(Utl.check(cv.getId())) {
					Optional<Category> opt = repository.findById(cv.getId());
					if(opt.isPresent()) {
						c = opt.get();
					}
				}

				if(!Utl.check(cv.getName())) {
					continue;
				}				
				c.setName(cv.getName());
				c.setOrderNo(cv.getOrderNo());
				if(Utl.check(cv.getRelatedId())) {
					c.setRelatedId(cv.getRelatedId());
				}
				
				int parentId = cv.getParentId();
				if(Utl.check(parentId)) {
					// when parentId -> index
					if(parentId < RootCatId) {
						parentId = form.getItems().get(parentId).getId();
						if(parentId < RootCatId) {
							continue;
						}
					}
					Optional<Category> p = repository.findById(parentId);
					if(p.isPresent()) {
						c.setParent(p.get());
						repository.save(c);
						if(!Utl.check(cv.getId())) {
							cv.setId(c.getId());
						}
					}					
				}
			}
		}

		String catId = RootCatId.toString();
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			catId = rc.toString();
		}
		redirectAttributes.addAttribute("id", catId);
		return "redirect:/category/";
	}

	@RequestMapping(value = "/createRoot", method = RequestMethod.GET)
	public String rootCatInsert(Model model, RedirectAttributes redirectAttributes) {

		Optional<Category> opt = repository.findById(RootCatId);
		if(!opt.isPresent()) {
			Category cat = new Category();
			cat.setId(RootCatId);
			cat.setName("Category");
			repository.save(cat);
		}

		return "redirect:/category/";
	}

}