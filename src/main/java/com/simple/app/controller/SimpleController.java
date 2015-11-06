package com.simple.app.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.simple.app.entities.UserDto;
import com.simple.app.service.IUserService;
import com.simple.app.userserviceimplement.UserDao;

@Controller
public class SimpleController {

	@Autowired
	IUserService userservice;
	
	private static final Logger logger = LoggerFactory
			.getLogger(SimpleController.class);

	@RequestMapping(value = "/")
	public String index(ModelMap model) {
		model.addAttribute("list", userservice.listUser());
		return "listUser";
	}

	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUser(ModelMap map,
			@RequestParam("btnAddNSearch") String btn) {
		if (btn.equals("Add New")) {
			return "adduser";
		} else {
			return "ggg";
		}

	}

	@RequestMapping(value = "/addUserAction",method=RequestMethod.POST)
	public String addUserAction(@RequestParam("file")  MultipartFile file,
			HttpServletRequest request, ModelMap model) {
		System.out.println("olo");
		String filename = file.getOriginalFilename();

		if (!file.isEmpty()) {
			try {

					filename = filename+ "-"+".jpg";
				
				
				byte[] bytes = file.getBytes();

				// creating the directory to store file
				String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/profile/");
				System.out.println(savePath);
				File path = new File(savePath);
				if(!path.exists()){
					path.mkdir();
				}
				
				// creating the file on server
				File serverFile = new File(savePath + File.separator + filename );
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				//student.setImage(filename);
				
				
				System.out.println(serverFile.getAbsolutePath());
				System.out.println("You are successfully uploaded file " + filename);
				

			} catch (Exception e) {
				System.out.println("You are failed to upload " + filename
						+ " => " + e.getMessage());
			}
		} else {
			System.out.println("You are failed to upload " + filename
					+ " because the file was empty!");
		}

		return "listUser";
	}
}
