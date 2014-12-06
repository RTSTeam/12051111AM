package com.mercury.dao;

import java.util.List;
import com.mercury.beans.Transaction;

public interface TransactionDao {
	public void update(String tranID);
	public void save(Transaction transaction, boolean hasRecord);
	public List<Transaction> queryTransactions(String userid);
	public boolean hasRecord();
}
