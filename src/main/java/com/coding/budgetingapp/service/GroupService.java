package com.coding.budgetingapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.Group;
import com.coding.budgetingapp.repositories.GroupRepository;

@Service
public class GroupService {
    
	@Autowired
	private GroupRepository groupRepo;
	
	@Autowired
	private BudgetService budgetService;
	
	public Group createNewGroup(Long budgetId) {
		Group group = new Group();
		Budget budget = budgetService.findById(budgetId);
		group.setBudget(budget);
		budget.getGroups().add(group);
		
		return save(group);
		
		
	}

	public Group save(Group group) {
		return groupRepo.save(group);
		
	}

	public Group findById(Long groupId) {
		return groupRepo.findById(groupId).get();
	}
}
