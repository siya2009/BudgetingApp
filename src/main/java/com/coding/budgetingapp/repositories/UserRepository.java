package com.coding.budgetingapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coding.budgetingapp.domain.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findByUsername(String username);

}
