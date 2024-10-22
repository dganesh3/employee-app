package com.jsp.employee_app_prc.controller;

import javax.persistence.PersistenceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jsp.employee_app_prc.dao.EmployeeDao;
import com.jsp.employee_app_prc.entity.Employee;

import jakarta.validation.ConstraintViolationException;

@Controller
public class EmployeeController {

	@Autowired
	private EmployeeDao dao;

	@RequestMapping(path = "/home")
	public String index(Model model) {
		model.addAttribute("employees", dao.getAllEmployeeDao());
		return "home";
	}

	@RequestMapping(path = "/add")
	public String addEmployee(Model model) {
		model.addAttribute("employee", new Employee());
		return "addemployee";
	}

	@PostMapping(path = "/save")
	public String saveEmployee(@ModelAttribute Employee employee, Model model, RedirectAttributes redirectAttributes) {
		try {
			dao.saveEmployeeDao(employee);
			model.addAttribute("employees", dao.getAllEmployeeDao());
			return "home";
		} catch (PersistenceException e) {
			if (e.getCause() instanceof ConstraintViolationException ) {
				redirectAttributes.addFlashAttribute("error", "Email already exists. Please use a different email.");
			}
			else
			{
				redirectAttributes.addFlashAttribute("error", "An unexpected error occurred: " + e.getMessage());

			}
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred: " + e.getMessage());
		}
		return "addemployee";
	}

	@RequestMapping(path = "/edit")
	public String updateEmployee(@RequestParam int id, Model model) {
		model.addAttribute("employee", dao.findEmployeeDao(id));
		return "updateemploye";
	}

	@PostMapping(path = "/update")
	public String updateEmployee(@ModelAttribute Employee employee, Model model) {
		Employee emp = dao.updateEmployeeDao(employee);
//			System.out.println(employee);
		if (emp != null) {
			model.addAttribute("employees", dao.getAllEmployeeDao());
			return "home";
		}
		model.addAttribute("message", "employee not update with");
		return "error";
	}

	@RequestMapping(path = "/remove")
	public String removeEmployee(@RequestParam int id, Model model) {
		dao.removeEmployeeDto(id);
		model.addAttribute("employees", dao.getAllEmployeeDao());
		return "home";
	}
}
