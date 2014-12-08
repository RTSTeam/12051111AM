package com.mercury.service;

import com.mercury.dao.TransactionDao;

public class AdminRefundService {
	private TransactionDao td;

	public TransactionDao getTd() {
		return td;
	}

	public void setTd(TransactionDao td) {
		this.td = td;
	}
	
	public void processRefund(String tranID) {
		//td.update(tranID);
		td.updateTypeToRefunded(tranID);
	}
}
