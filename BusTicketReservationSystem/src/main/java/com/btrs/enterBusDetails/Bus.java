package com.btrs.enterBusDetails;

public class Bus {
	private int busID;
	private int aId;
	private String busNumber;
	private int numberOfSeats;
	private String busType;
	private boolean AC;
	
	public Bus( int busID, int aId, String busNumber, int numberOfSeats, String busType, boolean AC) {
	this.busID=busID;
	this.aId=aId;
	this.busNumber=busNumber;
	this.numberOfSeats=numberOfSeats;
	this.busType=busType;
	this.AC=AC;
	}
	
	
	
	public int getBusID() {
		return busID;
	}
	public int getaID() {
		return aID;
	}
	public String getBusNumber() {
		return busNumber;
	}
	public int getNumberOfSeats() {
		return numberOfSeats;
	}
	public String getBusType() {
		return busType;
	}
	public boolean isAC() {
		return AC;
	}
}
