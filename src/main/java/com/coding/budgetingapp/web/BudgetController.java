package com.coding.budgetingapp.web;

import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.User;
import com.coding.budgetingapp.service.BudgetService;

@Controller
public class BudgetController {
 
	@Autowired
	private BudgetService budgetService;
	
	@RequestMapping(value="/budgets",method = RequestMethod.GET)
	public String getBudget(@AuthenticationPrincipal User user ,ModelMap model) {
		getBudgets(user, model);
		return "budgets";
	}


	private void getBudgets(User user, ModelMap model) {
		TreeSet<Budget> budgets = budgetService.getBudgets(user);
		
		model.put("budgets", budgets);
	}
	
	
	@RequestMapping(value="/budgets",method = RequestMethod.POST)
	public @ResponseBody Budget postBudget(@AuthenticationPrincipal User user ,ModelMap model) {
		

		Budget budget = new Budget();
		budget = budgetService.saveBudget(user, budget);
		
		getBudgets(user, model);
		
		return budget;
	}
}
