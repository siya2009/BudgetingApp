package com.coding.budgetingapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.budgetingapp.domain.Category;
import com.coding.budgetingapp.repositories.CategoryRepository;

@Service
public class CategoryService {
   
	@Autowired
	public CategoryRepository categoryRepo;
	
	public Category saveCategory(Category category) {
		return categoryRepo.save(category);
	}

	public Category findById(Long categoryId) {
		return categoryRepo.findById(categoryId).get();
	}
}
