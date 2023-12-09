package com.note.myvision;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters.LocalDateConverter;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/event")
public class EventController {
	//private static final Logger log = LoggerFactory.getLogger(EventController.class);
	private static Integer EventCatId = 10000002;

	@Autowired
	ItemRepository repository;

	@Autowired
	EventRepository eventRepository;

	@Autowired
	EventService service;

	@Autowired
	CategoryRepository catRepository;

	@Autowired
	CategoryService catService;	

	@Autowired
	ItemService perService;	

	@Autowired
	ItemService itemService;	

	@Autowired
	HttpSession session;

	@InitBinder  //类初始化是调用的方法注解
    public void initBinder(WebDataBinder binder) {  
        binder.setAutoGrowNestedPaths(true);
        //给这个controller配置接收list的长度10000，仅在这个controller有效
        binder.setAutoGrowCollectionLimit(10000);
    }

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(String date, Model model, Device device) {
		if(!Utl.check(date)) {
			date = LocalDate.now().toString();
		}
		model.addAttribute("date", date);

		CategoryView cat = service.loadCatViewBeanByDate(date, EventCatId);
		model.addAttribute("cat", cat);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		return "event";
	}

	// @RequestMapping(value = "/timetable", method = RequestMethod.GET)
	// public String loadTimetable(@RequestParam(value = "date", required = false) String chgDate ,Model model, Device device) {
	// 	String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
	// 	model.addAttribute("date", date);

	// 	CategoryView cat = service.loadCatViewBeanByDate(date);
	// 	model.addAttribute("cat", cat);
		
	// 	return "timetable";
	// }	

	@RequestMapping(value = "/saveList", method = RequestMethod.POST)
	public String saveAddList(RedirectAttributes redirectAttributes, @ModelAttribute EventForm recform, Model model) {
		List<EventView> items = recform.getItems();
		service.save(items);
		LocalDate date = (items.size() > 0) ? Utl.convertDate(items.get(0).getDate()) : LocalDate.now();
		redirectAttributes.addAttribute("date", date.toString());
		return "redirect:/event/";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String addEventView(RedirectAttributes redirectAttributes, ItemView itemView, Model model) {
		service.save(itemView);
		redirectAttributes.addAttribute("date", itemView.getEvent().getDate());
		return "redirect:/event/";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(String date, Integer id, Integer eventCatId, Integer topicCatId, Integer itemCatId, String type, Model model, Device device) {

		if(!Utl.check(date)) {
			date = LocalDate.now().toString();
		}
		model.addAttribute("date", date);

		if(Utl.check(id)) {
			ItemView v = service.getSingleEvent(id);
			model.addAttribute("itemView", v);
			session.setAttribute("tmpItemView", v);
		} else {
			ItemView v = new ItemView();
			v.setDate(date);
			v.setReleaseDate(date);
			v.setStatus(Utl.Status.EV3_FINISHED.getValue());
			if(Utl.check(eventCatId)) {
				v.setEventCategoryId(eventCatId);
				v.setEventCategory(catRepository.findCatName(eventCatId));
			}
			if(Utl.check(topicCatId)) {
				v.setTopicCategoryId(topicCatId);
				v.setTopicCategory(catRepository.findCatName(topicCatId));
			}
			if(Utl.check(itemCatId)) {
				v.setItemCategoryId(itemCatId);
				v.setItemCategory(catService.findCatName(itemCatId));
			}
			if(Utl.check(type)) {
				v.setType(type);
			}
			Event ne = new Event();
			ne.setDate(date);
			ne.setTime(1.0);
			v.setEvent(ne);
			model.addAttribute("itemView", v);
			session.setAttribute("tmpItemView", v);
		}
		
		if(Utl.check(topicCatId)) 
		 {
			List<EventView> refEvents = service.findRefEventsByTopic(topicCatId, date);
			for(EventView bean : refEvents)
			{
				bean.setDate(date);
			}
			model.addAttribute("refEvents", refEvents);			
		}		
		else if(Utl.check(eventCatId)) {
			List<EventView> refEvents = service.findRefEventsByEvent(eventCatId, date);
			for(EventView bean : refEvents)
			{
				bean.setDate(date);
			}
			model.addAttribute("refEvents", refEvents);
		}

		return "event_edit";
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String addEventView(@ModelAttribute("name") String name, @ModelAttribute("date") String date, Model model, Device device) {

		if(!Utl.check(date)) {
			date = LocalDate.now().toString();
		}
		model.addAttribute("date", date);

		Object rc = session.getAttribute("tmpItemView");
		if(rc != null) {
			model.addAttribute("itemView", rc);
		} else {
			// error
			ItemView v = new ItemView();
			model.addAttribute("itemView", v);
		}

		List<EventView> refEvents = service.findRefEventsByName(name);
		for(EventView bean : refEvents)
		{
			bean.setDate(date);
		}
		model.addAttribute("refEvents", refEvents);
		return "event_edit";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertEventById(Integer parentId, String date, String name, String time, Model model, RedirectAttributes redirectAttributes) {
		service.insert(parentId, date, name, time);
		redirectAttributes.addAttribute("date", date);
		return "redirect:/event/";
	}
	
	@RequestMapping(value = "/eventView", method = RequestMethod.GET)
	public String readForView(String date , String start, String end, Model model) {
		if(!Utl.check(date)) {
			date = LocalDate.now().toString();
		}
		model.addAttribute("date", date);
		LocalDate curDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		if(!Utl.check(start)) {
			start = curDate.with(TemporalAdjusters.firstDayOfMonth()).toString();
		}
		model.addAttribute("start", start);
		if(!Utl.check(end)) {
			end = curDate.with(TemporalAdjusters.lastDayOfMonth()).toString();
		}
		model.addAttribute("end", end);
		
		CategoryView cat = service.loadCatViewBeanByPeriod(date, start, end, EventCatId);
		model.addAttribute("cat", cat);
		return "event_view";
	}

	@RequestMapping(value = "/eventDetail", method = RequestMethod.GET)
	public String eventDetail(Integer itemId, String itemName, Model model) {
		if(Utl.check(itemId)) {
			model.addAttribute("itemName", itemName);
			List<Event> eventList = service.findListByParentId(itemId);
			model.addAttribute("eventList", eventList);
			return "event_list";
		} else {
			return "redirect:/event/"; 
		}	
	}

	// @RequestMapping(value = "/eventEdit", method = RequestMethod.GET)
	// public String readForEdit(Model model) {
	// 	Map<String, String> catList = catService.GetCategoryMapByName("Event");
	// 	model.addAttribute("catList", catList);

	// 	EventForm form = new EventForm();
	// 	List<EventParentBean> events = service.findAll();
	// 	for ( EventParentBean item : events) {
	// 		form.add(new EventView(item, "0000-01-01", "9999-12-31"));
	// 	}
	// 	service.sortByCategory(form.getItems(), catList);
	// 	model.addAttribute("form", form);

	// 	return "event_edit";
	// }

	// @RequestMapping(value = "/saveEdit", method = RequestMethod.POST)
	// public String saveEditList(@ModelAttribute EventForm recform, Model model) {
	// 	List<EventView> items = recform.getItems();
	// 	service.saveParent(items);
	// 	return "redirect:/event/eventEdit";
	// }

	// @RequestMapping(value = "/lifeLine", method = RequestMethod.GET)
	// public String readLifeLineView(@RequestParam(value = "date", required = false) String chgDate , @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, Model model) {
	// 	String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
	// 	model.addAttribute("date", date);

	// 	LocalDate curDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
	// 	String start = (startDate != null) ? startDate : curDate.with(TemporalAdjusters.firstDayOfYear()).toString();
	// 	String end = (endDate != null) ? endDate : curDate.with(TemporalAdjusters.lastDayOfMonth()).toString();
	// 	model.addAttribute("start", start);
	// 	model.addAttribute("end", end);
		
	// 	CategoryView cat = service.loadLifeLineView(date, start, end);
	// 	model.addAttribute("cat", cat);
	// 	return "event_lifeline";
	// }

	// @RequestMapping(value = "/test", method = RequestMethod.GET)
	// public String test(String date, Model model, Device device) {
	// 	if(!Utl.check(date)) {
	// 		date = LocalDate.now().toString();
	// 	}
	// 	model.addAttribute("date", date);
		
	// 	List<EventView> evs = repository.findEventViewToday(date);

	// 	List<EventView> evList = new ArrayList<EventView>();
	// 	List<Event> events = repository.findEventToday(date);
	// 	for(Event e : events) {
	// 		EventView ev = new EventView(e, date);
	// 		evList.add(ev);
	// 	}
	// 	return read(date, model, device);
	// }
	
}