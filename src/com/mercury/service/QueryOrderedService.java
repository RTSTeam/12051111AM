package com.mercury.service;

import com.mercury.beans.OrderedInfo;
import com.mercury.dao.TransactionDao;

public class QueryOrderedService {
	private TransactionDao td;

	public TransactionDao getTd() {
		return td;
	}

	public void setTd(TransactionDao td) {
		this.td = td;
	}
	
	public OrderedInfo processQuery(String userid) {
		OrderedInfo orderedInfo = new OrderedInfo();
		orderedInfo.setOrdereds(td.findOrdered(userid));
		return orderedInfo;
	}
	
	
}
