package com.mercury.dao;

import java.util.List;
import com.mercury.beans.Transaction;

public interface TransactionDao {
	public void save(Transaction transaction);
	public List<Transaction> queryTransactions(String userid);
}
