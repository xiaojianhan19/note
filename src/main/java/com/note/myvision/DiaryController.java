package com.note.myvision;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.TemporalAdjusters;
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

    @Autowired
    DiaryRepository repository;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String read(String date, Model model) {
		if(!Utl.check(date)) { date = LocalDate.now().toString();}
		model.addAttribute("date", date);
        
        List<Diary> diaryList = repository.findByDate(date);
        if(diaryList.size() == 0)
        {
			model.addAttribute("diary", new Diary(date));
			return "diary";
        }
        else if(diaryList.size() == 1)
        {
			model.addAttribute("diary", diaryList.get(0));
			return "diary";
		}
		else
		{
			model.addAttribute("diaryList", diaryList);
			return "diaryList";
		}		
	}

	@RequestMapping(value = "/readByPeriod", method = RequestMethod.GET)
	public String readByPeriod(Model model, String date, String start, String end) {
		
		if(!Utl.check(date)) { date = LocalDate.now().toString();}
		model.addAttribute("date", date);
		if(!Utl.check(start) || !Utl.check(end)) 
		{
			LocalDate localDate = LocalDate.parse(date, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
			start = localDate.with(TemporalAdjusters.firstDayOfMonth()).toString();
			end = localDate.with(TemporalAdjusters.lastDayOfMonth()).toString();		
		}
		model.addAttribute("start", start);
		model.addAttribute("end", end);

        List<Diary> diaryList = repository.findByDateBetweenOrderByDateDesc(start, end);
		model.addAttribute("diaryList", diaryList);
		return "diaryList";	
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Integer id, Model model) {
		
        Optional<Diary> diary = repository.findById(id);
        if(diary.isPresent())
        {
			model.addAttribute("diary", diary.get());
			model.addAttribute("date", diary.get().getDate());
			return "diary";
        }
        else
        {
			String date = LocalDate.now().toString();
			model.addAttribute("diary", new Diary());
			model.addAttribute("date", date);
			return "diary";
		}
	
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(RedirectAttributes redirectAttributes, @ModelAttribute("diary") Diary diary, Model model) {

		diary.setLength(diary.getText().length());
        repository.save(diary);
		redirectAttributes.addAttribute("date", diary.getDate());
		return "redirect:/diary/";
	}


}