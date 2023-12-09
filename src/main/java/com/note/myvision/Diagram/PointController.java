package com.note.myvision.Diagram;

import java.io.File;
import java.io.FileNotFoundException;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.mobile.device.Device;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.note.myvision.Utl;


@Controller
@RequestMapping("/point")
public class PointController {
	//private static final Logger log = LoggerFactory.getLogger(CollectionController.class);

	Integer RootCatId = 10030627;
	Integer PointCatId = 10030627;

	@Autowired
	HttpSession session;

	@Autowired
	PointService service;

	@Autowired
	PointRepository repository;

	@Autowired
	DiagramService catService;

	@Autowired
	DiagramRepository catRepository;

	@javax.annotation.Resource
    private ResourceLoader resourceLoader;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(Model model, Device device, Integer catId, Integer level,Boolean editFlag) {

		if(!Utl.check(level)) {
			level = 0;
		}

		// nav 
		DiagramView guideCat = service.findGroupByDiagramId(PointCatId, level);
		List<Object> guides = new ArrayList<>(); 
		for(DiagramView chv : guideCat.getChildren()) {
			for(Object itv : chv.getItems()) {
				guides.add(itv);
			}
		}
		model.addAttribute("guides", guides);

		// catView 
		if(!Utl.check(catId)) {
			catId = RootCatId;
		}
		DiagramView catView = service.findGroupByDiagramId(catId, level);
		model.addAttribute("catView", catView);
		session.setAttribute("catId", catId);
		if(editFlag != null) {
			session.setAttribute("editFlag", editFlag);
		}

		// catList
		Map<String, String> catList = new TreeMap<String, String>();
		catService.AddToMap(catView, catList);
		model.addAttribute("catList", catList);

        if (!device.isMobile()) {
            session.setAttribute("ispc", true);
		} else {
			session.setAttribute("ispc", false);
		}
		session.setAttribute("saveByCat", false);
		return "diagram_view";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String pointAdd(Model model, Integer id, Integer parentId, Integer catId) {

		if(Utl.check(id)) {
			repository.findById(id).ifPresent( point -> {
				model.addAttribute("point", point);
			});
			return "point_edit"; 
		} else {
			Point n = new Point();
			n.setLevel(1);
			n.setDate(LocalDate.now().toString());
			n.setDiagram(catId);

			model.addAttribute("point", n);
			return "point_edit"; 
		}		
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(Point point, Boolean createCat, Model model, Device device, RedirectAttributes redirectAttributes) {

		service.save(point);
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			redirectAttributes.addAttribute("catId", rc.toString());		
		}
		return "redirect:/point/"; 
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, @RequestParam(value = "delId") String delId, RedirectAttributes redirectAttributes) {
		service.delete(delId);
		Object rc = session.getAttribute("catId");
		if(rc != null) {
			redirectAttributes.addAttribute("catId", rc.toString());		
		}
		return "redirect:/point/"; 
	}

	@RequestMapping(value = "/updatePointList", method = RequestMethod.POST)
	public String updatePointList(Model model, @RequestParam List<Integer> changeList, Integer changeCatId, Integer changeParentId, Integer changeLevel,
									Boolean deleteFlg, RedirectAttributes redirectAttributes) {
		// service.updatePointList(changeList, changeCatId, changeParentId, changeLevel, deleteFlg);
		// Object rc = session.getAttribute("catId");
		// if(rc != null) {
		// 	redirectAttributes.addAttribute("catId", rc.toString());		
		// }
		return "redirect:/point/"; 
	}
	
	@RequestMapping(value = "/convertToPoint", method = RequestMethod.POST)
	public String convertToPoint(@ModelAttribute("resourceId") int resourceId, Model model, RedirectAttributes redirectAttributes) {
		// try {
		// 	resRepository.findById(resourceId).ifPresent(resourceBean -> {
		// 		redirectAttributes.addAttribute("id", resourceBean.getParentId());

		// 		Point newPoint = new Point();
		// 		newPoint.setName(resourceBean.getName());
		// 		newPoint.setDate(resourceBean.getDate());
		// 		newPoint.setReleaseDate(resourceBean.getDate());
		// 		newPoint.setParentId(resourceBean.getParentId());
		// 		newPoint.setLevel(1);
		// 		repository.save(newPoint);

		// 		resourceBean.setParentId(newPoint.getId());
		// 		resRepository.save(resourceBean);
		// 	});			
		// } catch (Exception e) {
		// 	e.printStackTrace();
		// }
		
		return "redirect:/point/viewEdit";
	}


	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String addEventView(String name, String id1, Model model, Device device) {

		// if(Utl.check(name)) {
		// 	List<PointView> pointList = repository.findEventSum(name);
		// 	for(PointView iv : pointList) {
		// 		List<Point> chs = repository.findByParentId(iv.getId());
		// 		iv.setChcount(chs.size());
		// 		List<Resource> res = resRepository.findByParentId(iv.getId());
		// 		iv.setRcount(res.size());
		// 	}
		// 	model.addAttribute("pointList", pointList);
		// }
		model.addAttribute("name", name);
		model.addAttribute("id1", id1);

		return "point_find";
	}
	

}