package com.note.demo;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/")
public class DemoController {

	@Autowired
	BackupService backupService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayIndex() {
		return "index";
    }
	
	@RequestMapping(value = "/backup", method = RequestMethod.GET)
	public String backup() {
		try {
		  //backupService.DBDump();
		} catch(Exception e) {}
		return "index";
	}	
}