package com.nagarro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpRequestHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.nagarro.model.Employee;
import com.nagarro.model.User;
import com.nagarro.service.EmpService;
import com.nagarro.service.UserService;

@Controller
public class MainController {

	@Autowired
	private UserService userService;

	@Autowired
	private EmpService empService;

	private boolean isValidUser = false;

	@RequestMapping("/")
	public String home() {
		return "index";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}

	// login validation
	@RequestMapping(path = "/validate", method = RequestMethod.POST)
	public String validateUsr(@ModelAttribute User user, Model model, HttpServletRequest request) {
		boolean isValid = userService.validateUser(user);
		String uMsg = "";
		if (isValid) {
			uMsg = user.getUsername();
			model.addAttribute("user", uMsg);
			
			Employee[] emp = empService.getAllEmployeeApi();
			model.addAttribute("employees", emp);
			empService.getAllEmployeeApi();
			
			return "employee_panel";
		} else {
			uMsg = "Invalid credential";
			model.addAttribute("msg", uMsg);
			return "invalid_user";
		}
	}

	// redirecting to sign up page
	@RequestMapping("/sign_up")
	public String showForm(Model model) {
		// model.addAttribute("headers", "Managament");
		System.out.println("creating form");
		return "sign_up";
	}

	// accessing data from sign_up page and adding to user table, redirecting to
	// userPanel page
	@RequestMapping(path = "/processform", method = RequestMethod.POST)
	public String handleForm(@ModelAttribute User user, Model model, HttpServletRequest request) {
		System.out.println("processing " + user.toString());
		this.userService.createUser(user);
		model.addAttribute("user", user.getUsername());

		Employee[] emp = empService.getAllEmployeeApi();
		model.addAttribute("employees", emp);
		empService.getAllEmployeeApi();
		
		return "employee_panel";
	}

//	@RequestMapping("/get_all_emp")
//	public String getAllEmployees(Model model, HttpServletRequest request) {
//		// getting data from rest api server
//		if (isValidUser) {
//			Employee[] emp = empService.getAllEmployeeApi();
//			model.addAttribute("employees", emp);
//			model.addAttribute("user", request.getParameter("user"));
//			empService.getAllEmployeeApi();
//			return "employee_panel";
//		} else {
//			return "invalid_user";
//		}
//
//	}

}
