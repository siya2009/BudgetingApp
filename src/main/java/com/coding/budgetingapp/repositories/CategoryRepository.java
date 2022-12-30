package com.coding.budgetingapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coding.budgetingapp.domain.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

}
