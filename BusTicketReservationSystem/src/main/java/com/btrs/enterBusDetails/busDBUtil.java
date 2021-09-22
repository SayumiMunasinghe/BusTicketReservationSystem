package com.btrs.enterBusDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class busDBUtil {
	
	//read part---------------------------------------
	public static List<Bus> validate(int aId) {
		
		ArrayList<Bus> bus = new ArrayList<>();
		
		//create database connection
				String url= "jdbc:mysql://localhost:3306/obtrs" ;
				String user = "root"; 
				String pass = "password";
				
		
		//validate
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();
			
			String sql = "select * from bus where aID = '"+aId+"'  ";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				int busID = rs.getInt(1);
				String busNumber = rs.getString(3);
				int numberOfSeats = rs.getInt(4);
				String busType = rs.getString(5);
				boolean AC = rs.getBoolean(7);
				
				Bus B = new Bus (busID, aId, busNumber, numberOfSeats, busType, AC);
				bus.add(B);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return bus;
		
		
		
}
	

	
	
	
	
	
	
	
	
	
	
	//insert part---------------------------------------------------------------
public static boolean InsertBus(String busNumber, int busSeat, String type, String condition, String day) {
	
	boolean isSuccess = false;
	
	//create database connection
	String url= "jdbc:mysql://localhost:3306/obtrs" ;
	String user = "root"; 
	String pass = "password";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();
		
		String sql= "Insert into bus values (0, 0,'"+busNumber+"', '"+busSeat+"', '"+type+"', '"+condition+"', '"+day+"')";
		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			isSuccess = true;
		}else {
			isSuccess = false;
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return isSuccess;
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
