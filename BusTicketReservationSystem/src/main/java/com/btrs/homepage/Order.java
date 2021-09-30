package com.btrs.homepage;

import java.sql.Time;
import java.time.LocalDate;

public class Order {
	private int orderID;
	private int customerID;
	private int busID;
	private String cardNo;
	private Time time;
	private int reservedSeats;
	private double totalPrice;
	private LocalDate date;
	
	public Order() {
		this.orderID = 0;
		this.customerID = 0;
		this.busID = 0;
		this.cardNo = null;
		this.time = null;
		this.reservedSeats = 0;
		this.totalPrice = 0;
		this.date = null;
	}
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}
	public void setBusID(int busID) {
		this.busID = busID;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public void setReservedSeats(int reservedSeats) {
		this.reservedSeats = reservedSeats;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public void setDate(LocalDate date) {
		this.date = date;
	}
	//constructor
	public Order(int customerID, int busID, String cardNo, Time time, int reservedSeats, double totalPrice, LocalDate date) {
		this.customerID = customerID;
		this.busID = busID;
		this.cardNo = cardNo;
		this.time = time;
		this.reservedSeats = reservedSeats;
		this.totalPrice = totalPrice;
		this.date = date;
	}
	//overloaded constructor with orderID
	public Order(int orderID, int customerID, int busID, String cardNo, Time time, int reservedSeats, double totalPrice, LocalDate date) {
		this.orderID = orderID;
		this.customerID = customerID;
		this.busID = busID;
		this.cardNo = cardNo;
		this.time = time;
		this.reservedSeats = reservedSeats;
		this.totalPrice = totalPrice;
		this.date = date;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getOrderID() {
		return orderID;
	}
	public int getCustomerID() {
		return customerID;
	}

	public int getBusID() {
		return busID;
	}

	public String getCardNo() {
		return cardNo;
	}

	public Time getTime() {
		return time;
	}

	public int getReservedSeats() {
		return reservedSeats;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public LocalDate getDate() {
		return date;
	}
	
	
	
}
