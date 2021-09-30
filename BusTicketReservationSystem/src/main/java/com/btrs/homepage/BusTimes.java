package com.btrs.homepage;

import java.sql.Time;

public class BusTimes {
	private int busid;
	private Time time;
	
	public BusTimes(int busid, Time time) {
		this.busid = busid;
		this.time = time;
	}

	public int getBusid() {
		return busid;
	}

	public Time getTime() {
		return time;
	}
	
}
