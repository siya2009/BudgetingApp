package com.coding.budgetingapp.web;

import java.text.ParseException;
import java.time.LocalDate;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.User;
import com.coding.budgetingapp.service.BudgetService;

@Controller
public class BudgetController {

	@Autowired
	private BudgetService budgetService;

	@RequestMapping(value = "/budgets", method = RequestMethod.GET)
	public String getBudgets(@AuthenticationPrincipal User user, ModelMap model) {
		populateUserBudgetsOnModel(user, model);
		return "budgets.jsp";
	}

	// @RequestMapping(value = "/budgets/{budgetId}", method = RequestMethod.GET)
	@GetMapping("/budgets/{budgetId}")
	public String getBudget(@PathVariable("budgetId") Long budgetId, ModelMap model) {
		Budget budget = budgetService.findById(budgetId);
		
		boolean hasCategories = budget.getGroups().stream()
						  .filter(group -> group.getCategories().size() > 0)
						  .count() > 0;
						
		model.put("budget", budget);
		model.put("hasCategories", hasCategories);
		return "budget.jsp";

	}

	private void populateUserBudgetsOnModel(User user, ModelMap model) {
		TreeSet<Budget> budgets = budgetService.getBudgets(user);

		model.put("budgets", budgets);
	}

	
	  
	  @RequestMapping(value="/budgets/{budgetId}", method = RequestMethod.PUT)
	  public @ResponseBody void putBudget(@AuthenticationPrincipal User user, @RequestParam String startDate,
	  @RequestParam String endDate, @PathVariable Long budgetId) throws ParseException { 
	  
	   Budget budget = budgetService.findById(budgetId);
	  
	   budget.setStartDate(budgetService.convertStringToDate(startDate));
	   budget.setEndDate(budgetService.convertStringToDate(endDate));
	   budgetService.saveBudget(user, budget);
	  }
	 

	@RequestMapping(value = "/budgets", method = RequestMethod.POST)
	public @ResponseBody Budget postBudget(@AuthenticationPrincipal User user, ModelMap model) {

		Budget budget = new Budget();
		
		LocalDate firstOfMonth = LocalDate.now().withDayOfMonth(1);
		LocalDate lastOfMonth = LocalDate.now().withDayOfMonth(firstOfMonth.lengthOfMonth());
		budget.setStartDate(firstOfMonth);
		budget.setEndDate(lastOfMonth);
		budget = budgetService.saveBudget(user, budget);

		populateUserBudgetsOnModel(user, model);

		return budget;
	}
}
