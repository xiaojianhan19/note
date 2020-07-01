package com.note.demo.diary;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/diary")
public class DiaryController {
	//private static final Logger log = LoggerFactory.getLogger(DiaryController.class);

	// @Autowired
	// DiaryService service;

    @Autowired
    DiaryRepository repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String readDiarys(@RequestParam(value = "targetDate", required = false) String chgDate, Model model) {
		String date = (chgDate != null) ? chgDate : LocalDate.now().toString();
		model.addAttribute("date", date);
        
        Optional<DiaryBean> diary = repository.findById(date);
        if(diary.isPresent())
        {
		    model.addAttribute("diaryBean", diary.get());
        }
        else
        {
            model.addAttribute("diaryBean", new DiaryBean(date));
        }
		return "diary";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addDiaryViewBean(RedirectAttributes redirectAttributes, @ModelAttribute("diaryBean") DiaryBean diary, Model model) {
		//service.save(diary);
		diary.setLength(diary.getMemo().length());
        repository.save(diary);
		redirectAttributes.addAttribute("targetDate", diary.getDate());
		return "redirect:/diary/";
	}


}