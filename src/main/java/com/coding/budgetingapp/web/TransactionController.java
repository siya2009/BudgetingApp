package com.coding.budgetingapp.web;

import java.time.LocalDate;
import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.Category;
import com.coding.budgetingapp.domain.Transaction;
import com.coding.budgetingapp.dto.CategoryDto;
import com.coding.budgetingapp.service.BudgetService;
import com.coding.budgetingapp.service.CategoryService;
import com.coding.budgetingapp.service.TransactionService;

@Controller
@RequestMapping(value = {"/budgets/{budgetId}/groups/{groupId}/catagories/{catagoryId}/transactions",
						"budgets/{budgetId}/transactions"})
public class TransactionController {
	
	@Autowired
	private BudgetService budgetService;
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("")
	public String addTransactionToBudget(@PathVariable Long budgetId, @PathVariable(required = false) 
										Long groupId, @PathVariable(required = false) Long categoryId) {
		Transaction tx = new Transaction();
		Budget budget = budgetService.findById(budgetId);
		
		tx.setBudget(budget);
		budget.getTransactions().add(tx);
		
		tx.setDate(LocalDate.now());
		
		if (categoryId != null) {
			
			Category category = categoryService.findById(categoryId);
			
			tx.setCategory(category);
			category.getTransactions().add(tx);
			
			
		} 
		
		
		tx = transactionService.save(tx);
		return "redirect:/budgets/"+budgetId+"/transactions/"+tx.getId();
				
	}
	
	@GetMapping("{transactionId}")
	public String getTransaction(@PathVariable Long transactionId, ModelMap model) {
		Transaction transaction = transactionService.findById(transactionId);
		model.put("transaction", transaction);
		model.put("budget", transaction.getBudget());
		
		   List<CategoryDto> categories = transaction.getBudget().getGroups()
                   .stream()
                   .map(group -> group.getCategories())
                   .flatMap(Collection::stream)
                   .map(category -> new CategoryDto(category.getId().toString(), category.getName()))
                   .collect(Collectors.toList());
		   
		  
		   
        model.put("categories", categories); 
		return "transaction.html";
	}
	
	@PostMapping("{transactionId}")
	public String postTransaction(@ModelAttribute Transaction transaction, @PathVariable Long transactionId) {
		transaction = transactionService.save(transaction);
		return "redirect:/budgets/"+transaction.getBudget().getId();
	}
	
}
