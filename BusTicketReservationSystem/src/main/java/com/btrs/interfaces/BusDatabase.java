package com.btrs.interfaces;

import java.util.ArrayList;
import java.util.List;

import com.btrs.enterBusDetails.Bus;

public interface BusDatabase {
	
	public boolean InsertBus(int aID,String busNumber, int busSeat, String type,int condition,String upTime,String upArrival,String upDestination,String downTime,String downArrival,String downDestination, double seatPrice);
	public  List<Bus> getBusDetails(int aID);
	public boolean updatebus(int id,String busNumber, int numberOfSeats,String busType, String condition, String time, String arrival, String destination, int aID,double Price );
	public ArrayList<String> getBusNumbers(int aID );
	public ArrayList<Bus> getBusDetails(String busNumber,int aID);
	public boolean deleteBus(String busNumber,int aID);

}
