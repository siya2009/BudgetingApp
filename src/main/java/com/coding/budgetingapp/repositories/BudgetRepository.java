package com.coding.budgetingapp.repositories;

import java.util.Set;
import java.util.TreeSet;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coding.budgetingapp.domain.Budget;
import com.coding.budgetingapp.domain.User;

public interface BudgetRepository extends JpaRepository<Budget, Long> {
	TreeSet<Budget> findByUsersIn(Set<User> users);
	long countByUsersIn(Set<User> users);
}
