package com.mercury.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

import com.mercury.beans.Ticket;
import com.mercury.dao.TicketDao;

public class TicketDaoImpl implements TicketDao{
	private SimpleJdbcTemplate template;
	
	public void setDataSource(DataSource dataSource) {
		template = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public void save(Ticket ticket) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public void delete(Ticket ticket) {
		// TODO Auto-generated method stub
	}
	
	@Override
	public List<Ticket> queryTickets(String departureStationName, String arrivalStationName, 
			int departureYear, int departureMonth, int departureDay, int departureHour,
			int neededQty) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM ticket WHERE departureStationName=? AND arrivalStationName=?" +
						"AND departureYear=? AND departureMonth=? AND departureDay=? AND departureHour>=? AND avaiQty>=?";
		Object[] params = {departureStationName, arrivalStationName, departureYear, departureMonth, departureDay,
							departureHour, neededQty};	
		return template.query(sql, new RowMapper<Ticket>() {
			@Override
			public Ticket mapRow(ResultSet rs, int line) throws SQLException {
				// TODO Auto-generated method stub
				Ticket ticket = new Ticket();
				ticket.setTicketID(rs.getInt("tickid"));
				ticket.setDepartureStationName(rs.getString("departureStationName"));
				ticket.setArrivalStationName(rs.getString("arrivalStationName"));
				ticket.setDepartureYear(rs.getInt("departureYear"));
				ticket.setDepartureMonth(rs.getInt("departureMonth"));
				ticket.setDepartureDay(rs.getInt("departureDay"));
				ticket.setDepartureHour(rs.getInt("departureHour"));
				ticket.setDepartureMinute(rs.getInt("departureMinute"));
				ticket.setArrivalYear(rs.getInt("arrivalYear"));
				ticket.setArrivalMonth(rs.getInt("arrivalMonth"));
				ticket.setArrivalDay(rs.getInt("arrivalDay"));
				ticket.setArrivalHour(rs.getInt("arrivalHour"));
				ticket.setArrivalMinute(rs.getInt("arrivalMinute"));
				ticket.setPrice(rs.getInt("price"));
				ticket.setTotalQty(rs.getInt("totalQty"));
				ticket.setAvaiQty(rs.getInt("avaiQty"));
				return ticket;
			}			
		}, params);
	}


}
