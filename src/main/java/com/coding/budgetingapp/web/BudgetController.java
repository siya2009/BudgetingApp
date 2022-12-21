package com.coding.budgetingapp.web;

import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String getBudgets(@AuthenticationPrincipal User user ,ModelMap model) {
		populateUserBudgetsOnModel(user, model);
		return "budgets";
	}

	//@RequestMapping(value = "/budgets/{budgetId}", method = RequestMethod.GET)
	@GetMapping("/budgets/{budgetId}")
	public String getBudget(@PathVariable("budgetId") Long budgetId, ModelMap model) {
		Budget budget = budgetService.findById(budgetId);
		model.put("budget", budget);
		return "budget";
		
	}
	
	private void populateUserBudgetsOnModel(User user, ModelMap model) {
		TreeSet<Budget> budgets = budgetService.getBudgets(user);
		
		model.put("budgets", budgets);
	}
	
	
	@RequestMapping(value="/budgets",method = RequestMethod.POST)
	public @ResponseBody Budget postBudget(@AuthenticationPrincipal User user ,ModelMap model) {
		

		Budget budget = new Budget();
		budget = budgetService.saveBudget(user, budget);
		
		populateUserBudgetsOnModel(user, model);
		
		return budget;
	}
}
