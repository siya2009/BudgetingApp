package com.coding.budgetingapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coding.budgetingapp.domain.Group;

public interface GroupRepository extends JpaRepository<Group, Long> {

}
