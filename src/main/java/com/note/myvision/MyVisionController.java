package com.note.myvision;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.InputStream;

import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/")
public class MyVisionController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String displayIndex() {
		return "redirect:/item/"; 
    }
	
	// @RequestMapping(value = "/backup", method = RequestMethod.GET)
	// public String backup() {
	// 	try {
	// 		String cmd = "D:\\\\Development\\\\PostgreSQL\\\\bin\\\\pg_dump -c --dbname=postgresql://postgres:123456@localhost:5432/myvision2022 -f D:\\\\Project\\\\myvision\\\\data\\\\sql\\\\20231031.sql";
	// 		Process ps = Runtime.getRuntime().exec(cmd);
	// 		InputStream eS = ps.getErrorStream();
	// 		// int ret = ps.waitFor();
	// 		// if(ret != 0) {
	// 		// 	System.out.println("Backup Error : " + ret);
	// 		// }
	// 	  //backupService.DBDump();
	// 	} catch(Exception e) {}
	// 	return "index";
	// }

	// @RequestMapping(value = "/sample", method = RequestMethod.GET)
	// public String sampleGragh() {
	// 	return "sampleGragh";
	// }
}