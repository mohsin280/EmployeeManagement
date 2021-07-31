package com.nagarro.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nagarro.model.Employee;
import com.nagarro.service.EmpService;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empService;
	
	@RequestMapping("/emp_details")
	public String home(HttpServletRequest request,Model model) {
		model.addAttribute("user", request.getParameter("user"));
		return "emp_details";
	}
	
	@RequestMapping("add_emp")
	public String addEmp(@ModelAttribute Employee employee,Model model) {
		empService.postEmployeeApi(employee);
		return "emp_add_success";
	}
	
	@RequestMapping("/empEdit/{id}")
	public String editEmp(@PathVariable("id") int empCode,Model model) {
		model.addAttribute("id", empCode);
		return "edit_emp_details";
		
	}
	
	@RequestMapping("empEdit/update_emp/{id}")
	public String updateEmp(@ModelAttribute Employee employee ,@PathVariable("id") int id) {
		empService.updateEmployeeApi(employee, id);
		return "update_success";
	}
}
