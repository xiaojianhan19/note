package com.note.demo.event;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.note.demo.Utl;
import com.note.demo.category.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/event")
public class EventController {
	//private static final Logger log = LoggerFactory.getLogger(EventController.class);

	@Autowired
	EventService service;

	@Autowired
	CategoryService catService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readEvents(Model model) {
		String date = LocalDate.now().toString();
		model.addAttribute("date", date);

		Map<String, String> catList = catService.GetCategoryMapByName("Event", date);
		model.addAttribute("catList", catList);

		EventViewForm form = new EventViewForm();
		List<EventChildBean> events = service.findByDate(date);
		for ( EventChildBean item : events) {
			form.add(new EventViewBean(item, date));
		}
		service.sortByCategory(form.getItems(), catList);
		model.addAttribute("form", form);
		
		model.addAttribute("eventViewBean", new EventViewBean(date));
		return "event";
	}

	@RequestMapping(value = "/chgDate", method = RequestMethod.GET)
	public String readEventsEdit(@RequestParam(value = "targetDate", required = false) String chgDate ,Model model) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);

		Map<String, String> catList = catService.GetCategoryMapByName("Event", date);
		model.addAttribute("catList", catList);

		EventViewForm form = new EventViewForm();
		form.setDate(date);
		List<EventChildBean> events = service.findByDate(date);
		for ( EventChildBean item : events) {
			form.add(new EventViewBean(item, date));
		}
		service.sortByCategory(form.getItems(), catList);
		model.addAttribute("form", form);
		
		model.addAttribute("eventViewBean", new EventViewBean(date));
		return "event";
	}

	@RequestMapping(value = "/saveList", method = RequestMethod.POST)
	public String saveAddList(RedirectAttributes redirectAttributes, @ModelAttribute EventViewForm recform, Model model) {
		List<EventViewBean> items = recform.getItems();
		service.save(items);
		LocalDate date = (items.size() > 0) ? Utl.convertDate(items.get(0).getDate()) : LocalDate.now();
		redirectAttributes.addAttribute("targetDate", date.toString());
		return "redirect:/event/chgDate";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEventViewBean(RedirectAttributes redirectAttributes, @ModelAttribute("eventViewBean") EventViewBean eventViewBean, Model model) {
		service.save(eventViewBean);
		redirectAttributes.addAttribute("targetDate", eventViewBean.getDate());
		return "redirect:/event/chgDate";
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String addEventViewBean(RedirectAttributes redirectAttributes, @ModelAttribute("targetName") String targetName, @ModelAttribute("targetDate") String targetDate, Model model) {
		List<EventViewBean> refEvents = service.findTargets(targetName);
		for(EventViewBean bean : refEvents)
		{
			bean.setDate(targetDate);
		}
		model.addAttribute("refEvents", refEvents);

		String date = targetDate;
		model.addAttribute("date", date);

		Map<String, String> catList = catService.GetCategoryMapByName("Event", date);
		model.addAttribute("catList", catList);		

		EventViewForm form = new EventViewForm();
		List<EventChildBean> events = service.findByDate(date);
		for ( EventChildBean item : events) {
			form.add(new EventViewBean(item, date));
		}
		model.addAttribute("form", form);

		model.addAttribute("eventViewBean", new EventViewBean(date));
		return "event";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertEventById(RedirectAttributes redirectAttributes, @ModelAttribute("insertId") String insertId, @ModelAttribute("targetDate") String targetDate, Model model) {
		service.insert(insertId, targetDate);
		redirectAttributes.addAttribute("targetDate", targetDate);
		return "redirect:/event/chgDate";
	}


	
}