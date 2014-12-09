package com.mercury.beans;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class RefundInfo {
	private List<Transaction> refunds;
	@XmlElement(name="refund")
	public List<Transaction> getRefunds() {
		return refunds;
	}

	public void setRefunds(List<Transaction> refunds) {
		this.refunds = refunds;
	}
		
}
