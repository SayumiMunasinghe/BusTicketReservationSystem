//this class is used to assign the respective values taken from databaase into variables 
package com.btrs.enterBusDetails;

public class Bus {
	//private int busID;
	//private int aId;
	private String busNumber;
	private int numberOfSeats;
	private String busType;
	private String AC;
	
	public Bus( String busNumber, int numberOfSeats, String busType, String AC) {
	//this.busID=busID;
	//this.aId=aId;
	this.busNumber=busNumber;
	this.numberOfSeats=numberOfSeats;
	this.busType=busType;
	this.AC=AC ;
	}
	
	
	
	/*public int getBusID() {
		return busID;
	}
	public int getaId() {
		return aId;
	}*/
	public String getBusNumber() {
		return busNumber;
	}
	public int getNumberOfSeats() {
		return numberOfSeats;
	}
	public String getBusType() {
		return busType;
	}
	public String getAC() {
		return AC;
	}
}
