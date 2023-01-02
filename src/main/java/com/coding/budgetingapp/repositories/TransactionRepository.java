package com.coding.budgetingapp.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coding.budgetingapp.domain.Transaction;

public interface TransactionRepository extends JpaRepository<Transaction, Long> {

}
