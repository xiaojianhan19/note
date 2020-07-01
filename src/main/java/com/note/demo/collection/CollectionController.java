package com.note.demo.collection;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.note.demo.category.CategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping("/collection")
public class CollectionController {
	//private static final Logger log = LoggerFactory.getLogger(CollectionController.class);

	@Autowired
	CollectionService service;

	@Autowired
	CategoryService catService;	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readCollections(Model model) {

        List<CollectionParentBean> list = service.findAll();
		model.addAttribute("colList", list);
		
		Map<String, String> catList = catService.GetCategoryMapByName("Collection", LocalDate.now().toString());
		model.addAttribute("catList", catList);
        
        model.addAttribute("collectionBean", new CollectionParentBean());        
		return "collection";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(@ModelAttribute("collectionBean") CollectionParentBean collectionBean, Model model) {
		service.save(collectionBean);
		return "redirect:/collection/";
	}


	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(Model model, @RequestParam(value = "itemId") String itemId) {
		service.find(itemId).ifPresent( item -> {
			model.addAttribute("item", item);
			model.addAttribute("collectionChildBean", new CollectionChildBean(item));
		});
		return "collection_child";
	}
	

	@RequestMapping(value = "/addChild", method = RequestMethod.POST)
	public String addChild(@ModelAttribute("collectionChildBean") CollectionChildBean collectionChildBean, Model model) {
        service.save(collectionChildBean);
		return "redirect:/collection/";
	}
}