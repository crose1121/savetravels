package com.rose.savetravels.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.rose.savetravels.models.Expense;
import com.rose.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/expenses")
	public String index(Model model) {
		model.addAttribute("allExpenses",expenseService.allExpenses());
		model.addAttribute("expense", new Expense());
		return "index.jsp";
	}
	
	@PostMapping("/expenses")
	public String create(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
		if (result.hasErrors()) {
			model.addAttribute("allExpenses", expenseService.allExpenses());
			return "index.jsp";
		}
		else {
			expenseService.create(expense);
			return "redirect:/expenses";
		}
	}
	
	
	
	
	
	
	
	
}
