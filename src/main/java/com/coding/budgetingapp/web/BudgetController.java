package com.coding.budgetingapp.web;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
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
		return "budgets";
	}

	// @RequestMapping(value = "/budgets/{budgetId}", method = RequestMethod.GET)
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

	
	  
	  @RequestMapping(value="/budgets/{budgetId}", method = RequestMethod.PUT)
	  public @ResponseBody void putBudget(@AuthenticationPrincipal User user, @RequestParam String startDate,
	  @RequestParam String endDate, @PathVariable Long budgetId) throws ParseException { 
	  
	   Budget budget = budgetService.findById(budgetId);
	  
	   budget.setStartDate(budgetService.convertStringToDate(startDate));
	   budget.setEndDate(budgetService.convertStringToDate(endDate));
	    System.out.println("Start date"+startDate+" and enddate is ***"+endDate);
	    System.out.println("Budget name is "+budget.getName());
	    budgetService.saveBudget(user, budget);
	  }
	 

	@RequestMapping(value = "/budgets", method = RequestMethod.POST)
	public @ResponseBody Budget postBudget(@AuthenticationPrincipal User user, ModelMap model) {

		Budget budget = new Budget();
		Calendar cal = Calendar.getInstance();

		cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1, 0, 0, 0);
		cal.set(Calendar.MILLISECOND, 0);

		Date firstOfMonth = cal.getTime();
		cal.set(Calendar.DATE, cal.getActualMaximum(Calendar.DATE));
		cal.set(Calendar.HOUR_OF_DAY, cal.getActualMaximum(Calendar.HOUR_OF_DAY));
		cal.set(Calendar.MINUTE, cal.getActualMaximum(Calendar.MINUTE));
		cal.set(Calendar.SECOND, cal.getActualMaximum(Calendar.SECOND));
		cal.set(Calendar.MILLISECOND, 0);

		Date lastOfMonth = cal.getTime();
		budget.setStartDate(firstOfMonth);
		budget.setEndDate(lastOfMonth);
		budget = budgetService.saveBudget(user, budget);

		populateUserBudgetsOnModel(user, model);

		return budget;
	}
}
