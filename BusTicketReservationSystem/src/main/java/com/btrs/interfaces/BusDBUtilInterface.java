package com.btrs.interfaces;

import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import com.btrs.homepage.BusDetails;
import com.btrs.homepage.BusTimes;
import com.btrs.homepage.Order;

public interface BusDBUtilInterface {
	ArrayList<String> getArrival();
	ArrayList<String> getDestination();
	List<BusDetails> sendDetails(String arrival, String destination);
	int getRemainingSeats(int busID, String travelDate, LocalTime timeBus);
	double getPrice(int busID, LocalTime timeBus);
	ArrayList<String> getCardNumbers(int cusID);
	boolean insertBookingDetails(Order o);
	BusDetails getDetails(int busID, LocalTime time);
	boolean deleteBooking(int orderid);
	Order getOrderDetails(int orderid);
	ArrayList<BusTimes> getTimes(String arrival, String destination, String busType);
	boolean updateBooking(int orderid, int busid, Time time);
}
