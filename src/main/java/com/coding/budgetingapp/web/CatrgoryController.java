package com.coding.budgetingapp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coding.budgetingapp.domain.Category;
import com.coding.budgetingapp.domain.Group;
import com.coding.budgetingapp.service.CategoryService;
import com.coding.budgetingapp.service.GroupService;

@Controller
@RequestMapping("/budgets/{budgetId}/groups/{groupId}/categories")
public class CatrgoryController {
  
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private CategoryService categoryService;
	
	
	@PostMapping("")
	public String postCategory(@PathVariable Long groupId) {
		Category category = new Category();
		Group group = groupService.findById(groupId);
		
		category.setGroup(group);
		group.getCategories().add(category);
		category.setName("Test Category");
		
		category = categoryService.saveCategory(category);
		
		return "redirect:/budgets/"+group.getBudget().getId()+"/groups/"+group.getId()+"/categories/"+category.getId();
	}
	
	@GetMapping("{categoryId}")
	public String getCategory(@PathVariable Long categoryId, ModelMap model) {
		Category category = categoryService.findById(categoryId);
		model.put("category", category);
		model.put("group", category.getGroup());
		return "category.jsp";
	}
	
	@PostMapping("{categoryId}")
	public String saveCategory(@ModelAttribute Category category, @PathVariable Long categoryId) {
		Category categoryFromDB = categoryService.findById(categoryId);
		
		categoryFromDB.setName(category.getName());
		categoryFromDB.setBudget(category.getBudget());
		
		categoryFromDB = categoryService.saveCategory(categoryFromDB);
		
		Long budgetId = categoryFromDB.getGroup().getBudget().getId();
		return "redirect:/budgets/" + budgetId;
	}

}
