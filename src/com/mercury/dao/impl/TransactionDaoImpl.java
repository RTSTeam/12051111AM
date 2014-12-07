package com.mercury.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.dao.TransactionDao;

public class TransactionDaoImpl implements TransactionDao {

	private SimpleJdbcTemplate template;

	public void setDataSource(DataSource dataSource) {
		template = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public boolean hasRecord() {
		Object[] params ={};
		String sql = "select count(*) from transactions";
		
		return !(0==template.queryForInt(sql, params));
	}
	
	@Override
	public List<Transaction> queryTransactions(String userid) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM transactions where userid=?";
		Object[] params = {userid};

		return template.query(sql, new RowMapper<Transaction>() {
			@Override
			public Transaction mapRow(ResultSet rs, int line) throws SQLException {
				// TODO Auto-generated method stub
				Transaction transaction = new Transaction();
				transaction.setTranID(rs.getInt("tranid"));
				transaction.setUserID(rs.getString("userid"));
				transaction.setTicketID(rs.getInt("ticketid"));
				transaction.setPrice(rs.getDouble("price"));
				transaction.setQty(rs.getInt("qty"));
				transaction.setTranType(rs.getString("trantype"));
				return transaction;
			}			
		}, params);
	}
	
	@Override
	public List<Transaction> findOrdered(String userid) {
		// TODO Auto-generated method stub
		String sql = "select * from transactions where userid=? and tranType='Ordered'";
		Object[] params = {userid};
		
		return template.query(sql, new RowMapper<Transaction>() {
			@Override
			public Transaction mapRow(ResultSet rs, int line) throws SQLException {
				// TODO Auto-generated method stub
				Transaction transaction = new Transaction();
				transaction.setTranID(rs.getInt("tranid"));
				transaction.setUserID(rs.getString("userid"));
				transaction.setTicketID(rs.getInt("ticketid"));
				transaction.setPrice(rs.getDouble("price"));
				transaction.setQty(rs.getInt("qty"));
				transaction.setTranType(rs.getString("trantype"));
				return transaction;
			}			
		}, params);
	}
	
	@Override
	public void save(Transaction transaction, boolean hasRecord) {
		// TODO Auto-generated method stub
		Object[] params = {transaction.getUserID(), transaction.getTicketID(), 
				transaction.getPrice(), transaction.getQty(), transaction.getTranType()};
		
		String sql =null;
		if(hasRecord){
		 sql= "insert into transactions values((select Max(tranid)+1 from transactions),?,?,?,?,?)";
		}
		else{
			sql= "insert into transactions values(1,?,?,?,?,?)";
		}
		template.update(sql, params);
	}


	@Override
	public void update(String tranID) {
		Object[] params ={tranID};
		String sql = "update transactions set trantype='refunding' where tranID=? and tranType='processing'";
		template.update(sql, params);
	}

}
