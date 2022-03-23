package com.note.myvision;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Autowired
	EventService service;

	@Autowired
	CategoryService catService;	

	@Autowired
	ItemService perService;	

	@Autowired
	ItemService colService;	

	@Autowired
	HttpSession session;

	@InitBinder  //类初始化是调用的方法注解
    public void initBinder(WebDataBinder binder) {  
        binder.setAutoGrowNestedPaths(true);
        //给这个controller配置接收list的长度100000，仅在这个controller有效
        binder.setAutoGrowCollectionLimit(10000);
    }

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readEvents(Model model, Device device) {
		String date = LocalDate.now().toString();
		return readByDate(date, model, device);
	}

	@RequestMapping(value = "/chgDate", method = RequestMethod.GET)
	public String readByDate(@RequestParam(value = "targetDate", required = false) String chgDate ,Model model, Device device) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);

		CategoryViewBean cat = service.loadCatViewBeanByDate(date);
		model.addAttribute("cat", cat);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		}
		return "event";
	}

	@RequestMapping(value = "/timetable", method = RequestMethod.GET)
	public String loadTimetable(@RequestParam(value = "targetDate", required = false) String chgDate ,Model model, Device device) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);

		CategoryViewBean cat = service.loadCatViewBeanByDate(date);
		model.addAttribute("cat", cat);
		
		return "timetable";
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
		if(Utl.check(eventViewBean.getRelatedId()))
		{
			colService.createByEvent(eventViewBean);
		}
		redirectAttributes.addAttribute("targetDate", eventViewBean.getDate());
		return "redirect:/event/chgDate";
	}

	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String addEventViewBean(@ModelAttribute("targetName") String targetName, @ModelAttribute("targetDate") String targetDate, Model model, Device device) {
		String date = targetDate;

		model.addAttribute("date", date);
		
		EventViewBean v = new EventViewBean(date);
		v.setStatus(Utl.Status.COL1_ONPROCESS.getValue());
		model.addAttribute("eventViewBean", v);

		List<EventViewBean> refEvents = service.findTargets(targetName);
		for(EventViewBean bean : refEvents)
		{
			bean.setDate(targetDate);
		}
		model.addAttribute("refEvents", refEvents);
		return "event_add";
	}

	@RequestMapping(value = "/addByCat", method = RequestMethod.GET)
	public String addByCat(@ModelAttribute("targetCat") String targetCat, @ModelAttribute("targetDate") String targetDate, 
							@ModelAttribute("topic") String topic, 
							@ModelAttribute("relatedId") int relatedId, Model model, Device device) {
		String date = targetDate;

		model.addAttribute("date", date);
		
		EventViewBean v = new EventViewBean(date);
		service.updateNewEventByCategory(v, relatedId, targetCat, topic);
		model.addAttribute("eventViewBean", v);

		if(Utl.check(topic)) 
		 {
			List<EventViewBean> refEvents = service.findRefEventsByTopic(topic);
			for(EventViewBean bean : refEvents)
			{
				bean.setDate(targetDate);
			}
			model.addAttribute("refEvents", refEvents);			
		}		
		else {
			List<EventViewBean> refEvents = service.findRefEventsByCat(targetCat, date);
			for(EventViewBean bean : refEvents)
			{
				bean.setDate(targetDate);
			}
			model.addAttribute("refEvents", refEvents);
		}

		return "event_add";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertEventById(RedirectAttributes redirectAttributes, @ModelAttribute("insertId") String insertId,
					@ModelAttribute("targetDate") String targetDate, @ModelAttribute("targetTime") String targetTime, Model model) {
		service.insert(insertId, targetDate, targetTime);
		redirectAttributes.addAttribute("targetDate", targetDate);
		return "redirect:/event/chgDate";
	}

	@RequestMapping(value = "/editSingleEvent", method = RequestMethod.GET)
	public String editSingleEvent(@ModelAttribute("id") int id, @ModelAttribute("date") String date, Model model) {
		EventViewBean ev = service.getSingleEvent(id, date);
	
		model.addAttribute("date", date);
		model.addAttribute("eventViewBean", ev);

		return "event_add";
	}	

	@RequestMapping(value = "/eventEdit", method = RequestMethod.GET)
	public String readForEdit(Model model) {
		Map<String, String> catList = catService.GetCategoryMapByName("Event");
		model.addAttribute("catList", catList);

		EventViewForm form = new EventViewForm();
		List<EventParentBean> events = service.findAll();
		for ( EventParentBean item : events) {
			form.add(new EventViewBean(item, "0000-01-01", "9999-12-31"));
		}
		service.sortByCategory(form.getItems(), catList);
		model.addAttribute("form", form);

		return "event_edit";
	}

	@RequestMapping(value = "/saveEdit", method = RequestMethod.POST)
	public String saveEditList(@ModelAttribute EventViewForm recform, Model model) {
		List<EventViewBean> items = recform.getItems();
		service.saveParent(items);
		return "redirect:/event/eventEdit";
	}
	
	@RequestMapping(value = "/eventView", method = RequestMethod.GET)
	public String readForView(@RequestParam(value = "targetDate", required = false) String chgDate , @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, Model model) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);

		LocalDate curDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String start = (startDate != null) ? startDate : curDate.with(TemporalAdjusters.firstDayOfMonth()).toString();
		String end = (endDate != null) ? endDate : curDate.with(TemporalAdjusters.lastDayOfMonth()).toString();
		model.addAttribute("start", start);
		model.addAttribute("end", end);

		Map<String, String> catList = catService.GetCategoryMapByName("Event");
		model.addAttribute("catList", catList);	
		
		CategoryViewBean cat = service.loadCatViewBeanByPeriod(date, start, end);
		model.addAttribute("cat", cat);
		return "event_view";
	}

	@RequestMapping(value = "/addTopicByCat", method = RequestMethod.GET)
	public String addTopicByCat(@ModelAttribute("topicCat") String topicCat, @ModelAttribute("topicDate") String topicDate, Model model, Device device) {
		String date = topicDate;
		model.addAttribute("date", date);
		
		TopicViewBean v = new TopicViewBean();
		v.setStartDate(date);
		service.updateNewTopicByCategory(v, topicCat);
		model.addAttribute("topicViewBean", v);

		List<TopicViewBean> refTopics= catService.findRefTopicByCat();
		model.addAttribute("refTopics", refTopics);
		return "topic_add";
	}

	@RequestMapping(value = "/topicAdd", method = RequestMethod.POST)
	public String addTopicViewBean(RedirectAttributes redirectAttributes, @ModelAttribute("topicViewBean") TopicViewBean topicViewBean, Model model) {
		catService.saveTopic(topicViewBean);
		if(Utl.check(topicViewBean.getTime())) {
			EventViewBean ev = new EventViewBean(topicViewBean.getName(), topicViewBean.getEveCategory(), 
												topicViewBean.getStatus(), "Topic", topicViewBean.getStartDate(), 
												topicViewBean.getTime(), "", topicViewBean.getName());
			service.save(ev);
		}
		
		redirectAttributes.addAttribute("targetDate", topicViewBean.getStartDate());
		return "redirect:/event/chgDate";
	}

	@RequestMapping(value = "/lifeLine", method = RequestMethod.GET)
	public String readLifeLineView(@RequestParam(value = "targetDate", required = false) String chgDate , @RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, Model model) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);

		LocalDate curDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String start = (startDate != null) ? startDate : curDate.with(TemporalAdjusters.firstDayOfYear()).toString();
		String end = (endDate != null) ? endDate : curDate.with(TemporalAdjusters.lastDayOfMonth()).toString();
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		CategoryViewBean cat = service.loadLifeLineView(date, start, end);
		model.addAttribute("cat", cat);
		return "event_lifeline";
	}
	

}