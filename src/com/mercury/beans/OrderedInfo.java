package com.mercury.beans;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class OrderedInfo {
	private List<Transaction> ordereds;
	@XmlElement(name="ordered")
	public List<Transaction> getOrdereds() {
		return ordereds;
	}

	public void setOrdereds(List<Transaction> ordereds) {
		this.ordereds = ordereds;
	}

	
	
}
