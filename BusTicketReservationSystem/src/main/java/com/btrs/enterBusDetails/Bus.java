//this class is used to assign the respective values taken from databaase into variables 
package com.btrs.enterBusDetails;

public class Bus {
	//private int busID;
	//private int aId;
	private String busNumber;
	private int numberOfSeats;
	private String busType;
	private int AC;
	private String uTime;
	private String uArrival;
	private String uDestination;
	private String dTime;
	private String dArrival;
	private String dDestination;
	private double price;
	
	
	//overloaded constructor
	public Bus( String busNumber, int numberOfSeats, String busType, int AC,String uTime,String uArrival, String uDestination,String dTime,String dArrival, String dDestination,double price) {
	//this.busID=busID;
	//this.aId=aId;
	this.busNumber=busNumber;
	this.numberOfSeats=numberOfSeats;
	this.busType=busType;
	this.AC=AC ;
	this.uTime=uTime;
	this.uArrival=uArrival;
	this.uDestination=uDestination;
	this.dTime=dTime;
	this.dArrival=dArrival;
	this.dDestination=dDestination;
	this.price=price;
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
	public int getAC() {
		@SuppressWarnings("null")
		int condition = (Integer) null;
		if(this.AC == 0) {
			condition = 0;
		}
			
		else if(this.AC == 1) {
			condition = 1;
		}
		return condition;

	}

	public String getuTime() {
		return uTime;
	}

	public String getuArrival() {
		return uArrival;
	}

	public String getuDestination() {
		return uDestination;
	}

	public String getdTime() {
		return dTime;
	}

	public String getdArrival() {
		return dArrival;
	}

	public String getdDestination() {
		return dDestination;
	}



	public double getPrice() {
		return price;
	}
}
