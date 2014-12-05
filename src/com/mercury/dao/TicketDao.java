package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Ticket;

public interface TicketDao {
	public void save(Ticket ticket);
	public void delete(Ticket ticket);
	public List<Ticket> queryTickets(String departureStationName, String arrivalStationName, 
			int departureYear, int departureMonth, int departureDay, int departureHour,
			int neededQty);
}
