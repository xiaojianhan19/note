package com.note.demo.person;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.note.demo.Utl;
import com.note.demo.category.CategoryService;
import com.note.demo.category.CategoryViewBean;
import com.note.demo.event.EventViewBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/person")
public class PersonController {
	//private static final Logger log = LoggerFactory.getLogger(PersonController.class);
	String PName = "Person";

	@Autowired
	PersonService service;

	@Autowired
	CategoryService catService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readPersons(@RequestParam(value = "targetCat", required = false)  String targetCat, Model model) {
		String date = LocalDate.now().toString();

		String catName = "Circle";
		model.addAttribute("targetCat", catName);

        CategoryViewBean group = service.findAllInGroup(PName, catName, date );
		model.addAttribute("group", group);

        model.addAttribute("personBean", new PersonParentBean());
		return "person";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("personBean") PersonParentBean personBean, @ModelAttribute("targetCat") String targetCat, Model model) {
		service.save(personBean);
		return readPersons(targetCat, model);
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(@ModelAttribute("targetCat") String targetCat, @RequestParam(value = "itemId") String itemId, Model model) {

		service.find(itemId).ifPresent( item -> {
			model.addAttribute("personBean", item);
			List<EventViewBean> evList = service.findEventList(item);
			model.addAttribute("evList", evList);
		});

		model.addAttribute("targetCat", targetCat);
		Map<String, String> catList = catService.GetCategoryMapByName("Person", LocalDate.now().toString());
		model.addAttribute("catList", catList);
		return "person_detail";
	}
	
	// @RequestMapping(value = "/saveDetial", method = RequestMethod.POST)
	// public String saveDetial(@ModelAttribute("personBean") PersonParentBean personBean, Model model) {
	// 	service.update(personBean);
	// 	return "redirect:/person/";
	// }

	@RequestMapping(value = "/group", method = RequestMethod.GET)
	public String readPersonsByGroup(Model model, @RequestParam(value = "group") String groupName) {
		String date = LocalDate.now().toString();

        CategoryViewBean group = service.findAllInGroup(PName, groupName, date);
		model.addAttribute("group", group);

        model.addAttribute("personBean", new PersonParentBean());
		return "person";
	}

	@RequestMapping(value = "/addByCat", method = RequestMethod.GET)
	public String addByCat(@ModelAttribute("targetCat") String targetCat, Model model, Device device) {

		model.addAttribute("targetCat", targetCat);
		
		PersonParentBean p = new PersonParentBean();
		p.setCategory(targetCat);
		p.setStatus(Utl.Status.EV3_FINISHED.getValue());
		model.addAttribute("personBean", p);
		
		return "person_add";
	}

	@RequestMapping(value = "/unsorted", method = RequestMethod.GET)
	public String readUnsorted(Model model) {
		String date = LocalDate.now().toString();

		Map<String, String> catList = catService.GetCategoryMapByName(PName, date);

		List<PersonParentBean> items = new ArrayList<PersonParentBean>();
		List<PersonParentBean> datas = service.findAll();
		for(PersonParentBean p : datas) {
			boolean isSorted = false;
			for(Map.Entry<String, String> entry : catList.entrySet()) {
				if(entry.getValue().equals(p.getCategory())) {
					isSorted = true;
					break;
				}
			}
			if(!isSorted) {
				items.add(p);
			}
		}
		model.addAttribute("DataList", items);

		return "person_unsorted";
	}	

}