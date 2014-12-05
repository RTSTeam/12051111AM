package com.mercury.resources;

import java.security.NoSuchAlgorithmException;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import com.mercury.beans.Station;
import com.mercury.beans.StationInfo;
import com.mercury.service.StationService;


@Path("/insertstation")
public class InsertStationResource {
	private StationService ss;
	
	public InsertStationResource() {
		if (ss==null) {
			ApplicationContext actx = new ClassPathXmlApplicationContext("config.xml");
			ss = (StationService)actx.getBean("stationService");
		}
	}
	
	@POST
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public StationInfo execute(
			@FormParam("stationid") int sid,
			@FormParam("stationabbrevation") String stationAbbr,
			@FormParam("stationfullname") String stationFullName
			) throws NoSuchAlgorithmException {
		Station station = new Station();
		station.setSid(sid);
		station.setStationAbbr(stationAbbr);
		station.setStationFullName(stationFullName);
		return ss.saveProcess(station);
	}
}
