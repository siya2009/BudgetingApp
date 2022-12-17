package com.coding.budgetingapp.service;

import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Service;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.User;
import com.coding.budgetingapp.repositories.BudgetRepository;

@Service
public class BudgetService {
	
	@Autowired
	private BudgetRepository budgetRepo;
	
	public TreeSet<Budget> getBudgets(@AuthenticationPrincipal User user){
		Set<User> users = new HashSet<>();
		users.add(user);
		
		return budgetRepo.findByUsersIn(users);
		
		
	}
}
