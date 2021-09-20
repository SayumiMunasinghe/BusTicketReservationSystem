package com.btrs.homepage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import DBconnection.DatabaseConnection;


public class BusDBUtil {

	public static List<BusDetails> sendDetails(String arrival, String destination) {

		ArrayList<BusDetails> bd = new ArrayList();

		try {

			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting busses with the given arrival and destination locations
			String sql = "select b.busID, b.busNumber, b.numberOfSeats, b.busType, b.seatPrice, b.AC, r.time from bus b, busroute r where b.busID = r.busID AND r.arrivalLocation LIKE '"+arrival+"' AND r.destinationLocation LIKE '"+destination+"'";
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
	public static int getRemainingSeats(int busID, Date travelDate, LocalTime time) {
		
		int noOfSeatsRemaining = 0;
		int totalSeats = 0;
		int takenNoOfSeats = 0;
		try {

			Connection con = DatabaseConnection.initializeDatabase();
			Statement stmt = con.createStatement();

			//getting busses with the given arrival and destination locations
			String sql = "select sum(numberOfSeats) from order where date = '"+travelDate+"' AND btime = '"+time+"' AND busID = "+busID;
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {

				takenNoOfSeats = rs.getInt(1);
				System.out.println(takenNoOfSeats);

			}
			String sql2 = "select numberOfSeats from bus where busID = "+busID;
			ResultSet rs2 = stmt.executeQuery(sql);
			if(rs2.next()) {

				totalSeats = rs2.getInt(1);
				System.out.println(totalSeats);

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
}
