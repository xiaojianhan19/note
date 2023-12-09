package com.note.myvision.Diagram;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.note.myvision.Category;
import com.note.myvision.Utl;

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
@RequestMapping("/diagram")
public class DiagramController {

    private Integer RootCatId = 10030627; //test

	@Autowired
	DiagramService service;

	@Autowired
	DiagramRepository repository;

	@Autowired
	HttpSession session;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model, Device device, Integer id) {
		if(!Utl.check(id)) {
			id = RootCatId;
		}
		session.setAttribute("catId", id);

		repository.findById(id).ifPresent( cat -> {
			service.sortDiagram(cat);
			model.addAttribute("cat", cat);
		});
		if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		session.setAttribute("saveByCat", true);
		return "diagram";
	}
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Diagram catBean, Boolean clearDate, Boolean clearDiagram, Model model, RedirectAttributes redirectAttributes) {

		if(clearDiagram != null && clearDiagram) {
			catBean.setParent(null);
		}
		repository.save(catBean);

		String catId = RootCatId.toString();
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			catId = rc.toString();
		}

		Object flg = session.getAttribute("saveByCat");
		if(flg == null || false == (boolean)flg) {
			redirectAttributes.addAttribute("catId", catId);
			return "redirect:/point/";
		} else {
			redirectAttributes.addAttribute("id", catId);
			if(catBean.getParent() != null) {
				redirectAttributes.addAttribute("parentId", catBean.getParent().getId());
			}
			return "redirect:/diagram/";
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, Integer delId, RedirectAttributes redirectAttributes) {
		if(Utl.check(delId)) {
			repository.findById(delId).ifPresent( cat -> {
				repository.delete(cat);
			});
		}

		String catId = RootCatId.toString();
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			catId = rc.toString();
		}
		redirectAttributes.addAttribute("id", catId);
		return "redirect:/diagram/";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Model model, Integer id, Integer parentId) {

		if(Utl.check(id)) {
			repository.findById(id).ifPresent( cat -> {
				model.addAttribute("catBean", cat);
				if(cat.getParent() != null) {
					model.addAttribute("parentName", cat.getParent().getName());
				}
			});
		} else {
			Diagram c = new Diagram();		
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

		return "diagram_edit";
	}

	@RequestMapping(value = "/editDiagram", method = RequestMethod.GET)
	public String editDiagram(Model model, Integer id) {

		if(!Utl.check(id)) {
			id = RootCatId;
		}
		session.setAttribute("catId", id);

		repository.findById(id).ifPresent( cat -> {
			service.sortDiagram(cat);
			DiagramView cv = new DiagramView(cat);
			service.createIndex(cv, 0);
			model.addAttribute("cat", cv);
		});

		model.addAttribute("form", new DiagramForm());
		return "diagram_group";
	}

	@RequestMapping(value = "/saveList", method = RequestMethod.POST)
	public String saveList(DiagramForm form, Model model, RedirectAttributes redirectAttributes) {

		for(DiagramView cv : form.getItems()) {
			if(cv.getIsUpdate()) {

				Diagram c = new Diagram();
				if(Utl.check(cv.getId())) {
					Optional<Diagram> opt = repository.findById(cv.getId());
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
					Optional<Diagram> p = repository.findById(parentId);
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

	// @RequestMapping(value = "/createRoot", method = RequestMethod.GET)
	// public String rootCatInsert(Model model, RedirectAttributes redirectAttributes) {

	// 	Optional<Diagram> opt = repository.findById(RootCatId);
	// 	if(!opt.isPresent()) {
	// 		Diagram cat = new Diagram();
	// 		cat.setId(RootCatId);
	// 		cat.setName("Diagram");
	// 		repository.save(cat);
	// 	}

	// 	return "redirect:/category/";
	// }

	@RequestMapping(value = "/convertPage", method = RequestMethod.GET)
	public String convertPage(Model model) {

		return "diagram_convert";
	}

	@RequestMapping(value = "/convert", method = RequestMethod.POST)
	public String convert(Integer catId, Integer parentId, Model model, RedirectAttributes redirectAttributes) {

		Integer id = service.convertCategoryToDiagram(catId, parentId);
		if(id != null) {
			redirectAttributes.addAttribute("catId", id);
			return "redirect:/point/";
		} else {
			redirectAttributes.addAttribute("catId", catId);
			return "redirect:/item/";
		}

	}

}