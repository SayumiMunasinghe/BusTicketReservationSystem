package com.btrs.homepage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

import com.btrs.DBconnection.DatabaseConnection;


public class BusDBUtil {
	public static int orderID;
	
	public static ArrayList<String> getArrival() {
		
		ArrayList<String> arrival = new ArrayList<String>();
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting price per seat in a given bus going at a given time
			String sql = "select distinct arrivalLocation from obtrs.busroute";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				arrival.add(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrival;
	}
	public static ArrayList<String> getDestination() {
		
		ArrayList<String> destination = new ArrayList<String>();
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting price per seat in a given bus going at a given time
			String sql = "select distinct destinationLocation from obtrs.busroute";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				destination.add(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return destination;
	}
	public static List<BusDetails> sendDetails(String arrival, String destination) {

		ArrayList<BusDetails> bd = new ArrayList<BusDetails>();

		try {

			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting busses with the given arrival and destination locations
			String sql = "select b.busID, b.busNumber, b.numberOfSeats, b.busType, r.seatPrice, b.AC, r.time from bus b, busroute r where b.busID = r.busID AND r.arrivalLocation LIKE '"+arrival+"' AND r.destinationLocation LIKE '"+destination+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {

				int busID = rs.getInt(1);
				String busNumber = rs.getString(2);
				int noOfSeats = rs.getInt(3);
				String busType = rs.getString(4);
				double seatPrice = rs.getDouble(5);
				int AC = rs.getInt(6);
				String time = rs.getString(7);

				BusDetails b = new BusDetails(busID, busNumber, noOfSeats, busType, seatPrice, AC, arrival, destination, time);
				bd.add(b);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bd;
	}
	public static int getRemainingSeats(int busID, String travelDate, LocalTime timeBus) {
		
		int noOfSeatsRemaining = 0;
		int totalSeats = 0;
		int takenNoOfSeats = 0;
		Date date = Date.valueOf(travelDate);
		Time time = Time.valueOf(timeBus);
		try {

			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting sum of seats reserved in a given bus on a given date at a given time
			String sql = "select sum(numberOfSeats) from obtrs.order  where date = '"+date+"' AND btime = '"+time+"' AND busID = "+busID+"";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {

				takenNoOfSeats = rs.getInt(1);
			}
			String sql2 = "select numberOfSeats from bus where busID = "+busID;
			ResultSet rs2 = stmt.executeQuery(sql2);
			if(rs2.next()) {

				totalSeats = rs2.getInt(1);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		noOfSeatsRemaining = totalSeats - takenNoOfSeats;
		return noOfSeatsRemaining;
	}
	public static double getPrice(int busID, LocalTime timeBus) {
		
		double price = 0;
		Time time = Time.valueOf(timeBus);
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting price per seat in a given bus going at a given time
			String sql = "select r.seatPrice from busroute r, bus b  where b.busID = r.busID AND r.busID = "+busID+" AND r.time = '"+time+"'";
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {

				price = rs.getDouble(1);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return price;
	}
	public static ArrayList<String> getCardNumbers(int cusID ) {
		
		ArrayList<String> cardNos = new ArrayList<String>();
		
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting price per seat in a given bus going at a given time
			String sql = "select cardNo from cards where pid = "+cusID;
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				cardNos.add(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cardNos;
	}
	public static boolean insertBookingDetails(Order o) {
		boolean status = false;
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//inserting record to order table once a payment is done and booking completed
			String sql = "insert into obtrs.order values(0, "+o.getCustomerID()+", "+o.getBusID()+", '"+o.getTime()+"', "+o.getReservedSeats()+", "+o.getTotalPrice()+", '"+o.getCardNo()+"', '"+o.getDate()+"')";
			int rs = stmt.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
			if(rs > 0) {
				status = true;
				ResultSet result = stmt.getGeneratedKeys();
				if(result.next())
				{
					orderID = result.getInt(1);
				}
			}
			else if(rs == 0) {
				status = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static BusDetails getDetails(int busID, LocalTime time) {
		BusDetails b = new BusDetails();
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();
			Time timedb = Time.valueOf(time);
			//getting bus details for a given busID and time
			String sql = "select b.busID, b.busNumber, b.numberOfSeats, b.busType, r.seatPrice, b.AC, r.arrivalLocation, r.destinationLocation, r.time from bus b, busroute r where b.busID = r.busID AND b.busID = " + busID + " AND r.time LIKE '"+timedb+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {

				int busid = rs.getInt(1);
				String busNumber = rs.getString(2);
				int noOfSeats = rs.getInt(3);
				String busType = rs.getString(4);
				double seatPrice = rs.getDouble(5);
				int AC = rs.getInt(6);
				String arrival = rs.getString(7);
				String destination = rs.getString(8);
				String obtime = rs.getString(7);

				b = new BusDetails(busid, busNumber, noOfSeats, busType, seatPrice, AC, arrival, destination, obtime);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}
	public static boolean deleteBooking(int orderid) {
		boolean status = false;
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//inserting record to order table once a payment is done and booking completed
			String sql = "delete from obtrs.order where orderID="+orderid;
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				status = true;
			}
			else if(rs == 0) {
				status = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	public static Order getOrderDetails(int orderid) {
		Order order = new Order();
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting order details for given orderid
			String sql = "select * from obtrs.order where orderID="+orderid;
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				
				int customerid = rs.getInt(2);
				int busid = rs.getInt(3);
				String sttime = rs.getString(4);
				LocalTime time = LocalTime.parse(sttime);
				Time orTime = Time.valueOf(time);
				int seats = rs.getInt(5);
				double price = rs.getDouble(6);
				String cardno = rs.getString(7);
				String stdate = rs.getString(8);
				LocalDate orderDate = LocalDate.parse(stdate); 
						
				order.setOrderID(orderid);
				order.setCustomerID(customerid);
				order.setBusID(busid);
				order.setTime(orTime);
				order.setReservedSeats(seats);
				order.setTotalPrice(price);
				order.setCardNo(cardno);
				order.setDate(orderDate);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return order;
		
	}
	public static ArrayList<BusTimes> getTimes(String arrival, String destination, String busType) {
		ArrayList<BusTimes> btl = new ArrayList<BusTimes>();
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//
			String sql = "select distinct r.busID, r.time from obtrs.busroute r, obtrs.bus b where r.arrivalLocation='"+arrival+"' AND r.destinationLocation='"+destination+"' AND b.busType='"+busType+"'";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				int busid = rs.getInt(1);
				Time time = rs.getTime(2);
				BusTimes bt = new BusTimes(busid, time);
				btl.add(bt);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return btl;
	}
	public static boolean updateBooking(int orderid, int busid, Time time) {
		boolean status = false;
		try {
			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//updating booking time and busid
			String sql = "update obtrs.order set busID="+busid+", btime='"+time+"' where orderID="+orderid;
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				status = true;
			}
			else if(rs == 0) {
				status = false;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}
}
