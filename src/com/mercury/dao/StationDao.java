package com.mercury.dao;

import java.util.List;

import com.mercury.beans.Station;

public interface StationDao {
	public void save(Station station);
	public void delete(Station station);
	public List<Station> queryAll();
}
