package com.mercury.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.simple.SimpleJdbcTemplate;

import com.mercury.beans.Station;
import com.mercury.dao.StationDao;

public class StationDaoImpl implements StationDao {

	private SimpleJdbcTemplate template;
	
	public void setDataSource(DataSource dataSource) {
		template = new SimpleJdbcTemplate(dataSource);
	}
	
	@Override
	public void save(Station station) {
		Object[] params = {station.getSid(), station.getStationAbbr(), station.getStationFullName()};
		String sql = "insert into stations values(?,?,?)";
		template.update(sql, params);

	}

	@Override
	public void delete(Station station) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Station> queryAll() {
		String sql = "select * from stations";
		return template.query(sql, new RowMapper<Station>() {
			@Override
			public Station mapRow(ResultSet rs, int line) throws SQLException {
				Station station = new Station();
				station.setSid(rs.getInt("sid"));
				station.setStationAbbr(rs.getString("stationabbr"));
				station.setStationAbbr(rs.getString("stationfullname"));
				return station;
			}			
		});
	}

}
