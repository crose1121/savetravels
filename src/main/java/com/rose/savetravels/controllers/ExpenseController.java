package com.rose.savetravels.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
	
	@GetMapping("/expenses/{id}")
	public String findExpense(@PathVariable("id") Long id, Model model) {
		model.addAttribute(expenseService.findOne(id));	
		return "details.jsp";
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
	
	@GetMapping("/expenses/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseService.findOne(id));
		return "edit.jsp";
	}
	
	@PutMapping("/expenses/update/{id}")
	public String update(
			@PathVariable("id") Long id,
			@Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
			return "edit.jsp";
		}
		else {
			expenseService.update(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		expenseService.delete(id);
		return "redirect:/expenses";
	}
	
	
	
	
	
}
