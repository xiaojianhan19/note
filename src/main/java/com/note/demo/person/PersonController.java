package com.note.demo.person;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.note.demo.category.CategoryService;
import com.note.demo.event.EventViewBean;

import org.springframework.beans.factory.annotation.Autowired;
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

	@Autowired
	PersonService service;

	@Autowired
	CategoryService catService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readPersons(Model model) {

        List<PersonParentBean> list = service.findAll();
		model.addAttribute("list", list);
        
        PersonGroupBean group = service.findAllInGroup( LocalDate.now().toString() );
		model.addAttribute("group", group);        
        
		Map<String, String> catList = catService.GetCategoryMapByName("Person", LocalDate.now().toString());
		model.addAttribute("catList", catList);

        model.addAttribute("personBean", new PersonParentBean());
		return "person";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("personBean") PersonParentBean personBean, Model model) {
		service.save(personBean);
		return "redirect:/person/";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam(value = "itemId") String itemId) {
		service.find(itemId).ifPresent( item -> {
			model.addAttribute("personBean", item);
			List<EventViewBean> evList = service.findEventList(item);
			model.addAttribute("evList", evList);
		});
		return "person_detail";
	}
	

	@RequestMapping(value = "/saveDetial", method = RequestMethod.POST)
	public String saveDetial(@ModelAttribute("personBean") PersonParentBean personBean, Model model) {
		service.save(personBean);
		return "redirect:/person/";
	}

}