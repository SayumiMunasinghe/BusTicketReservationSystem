package com.btrs.homepage;

public class BusDetails {
	private int busID;
	private String busNumber;
	private int numberOfSeats;
	private String busType;
	private	double seatPrice;
	private int AC;
	private String arrival;
	private String destination;
	private String time;
	
	//default constructor
	public BusDetails() {
		this.busID = 0;
		this.busNumber = null;
		this.numberOfSeats = 0;
		this.busType = null;
		this.seatPrice = 0;
		this.AC = 0;
		this.arrival = null;
		this.destination = null;
		this.time = null;
	}
	//overloaded constructor
	public BusDetails(int busID, String busNumber, int numberOfSeats, String busType, double seatPrice, int AC, String arrival, String destination, String time) {
		
		this.busID = busID;
		this.busNumber = busNumber;
		this.numberOfSeats = numberOfSeats;
		this.busType = busType;
		this.seatPrice = seatPrice;
		this.AC = AC;
		this.arrival = arrival;
		this.destination = destination;
		this.time = time;
	}

	public int getBusID() {
		return busID;
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

	public double getSeatPrice() {
		return seatPrice;
	}

	public String getAC() {
		String service = null;
		if(this.AC == 0) {
			service = "No A/C";
		}
			
		else if(this.AC == 1) {
			service = "With A/C";
		}
		return service;
	}

	public String getArrival() {
		return arrival;
	}

	public String getDestination() {
		return destination;
	}

	public String getTime() {
		return time;
	}
	
	
}
