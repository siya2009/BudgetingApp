package com.coding.budgetingapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.budgetingapp.domain.Transaction;
import com.coding.budgetingapp.repositories.TransactionRepository;

@Service
public class TransactionService {
	
	@Autowired
	private TransactionRepository transRepo;
	
	public Transaction save(Transaction transaction) {
		return transRepo.save(transaction);
	}

	public Transaction findById(Long transactionId) {
		return transRepo.findById(transactionId).get();
	}
}
