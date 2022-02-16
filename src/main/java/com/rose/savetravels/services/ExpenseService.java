package com.rose.savetravels.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rose.savetravels.models.Expense;
import com.rose.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	@Autowired
	ExpenseRepository expenseRepository;
	
	//methods which will use the repository to talk to the database
	
	//find all
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	
	//create one
	public Expense create(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	//find one
	public Expense findOne(Long id) {
		return expenseRepository.findById(id).orElse(null);
	}
	
	//update one
	public Expense update(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	//delete
	public void delete(Long id) {
		expenseRepository.deleteById(id);
	}
	
	
	
	
	
	
	
	
	
	
}
