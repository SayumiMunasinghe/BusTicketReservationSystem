package com.btrs.enterBusDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.btrs.DBconnection.DatabaseConnection;

public class busDBUtil {
	private static Connection con = null;
	private static Statement stmt = null;
	private static boolean isSuccess;
	
	//read part---------------THIS IS SOME BS. DELETE THIS LATER
	/*public static List<Bus> validate(int aID) {
		
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
			
			String sql = "select * from bus where aid = 1  ";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				String busNumber = rs.getString(3);
				int numberOfSeats = rs.getInt(4);
				String busType = rs.getString(5);
				String AC = rs.getString(6);
				
				Bus B = new Bus (busNumber,numberOfSeats, busType,AC);
				bus.add(B);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return bus;
		
		
		
}*/
	

	

	

	


	
	
	
	//insert part---------------------------------------------------------------
public static boolean InsertBus(int aID,String busNumber, int busSeat, String type, String condition/*, String day*/) {
	
	boolean isSuccess = false;
	
	//create database connection
	String url= "jdbc:mysql://localhost:3306/obtrs" ;
	String user = "root"; 
	String pass = "password";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con = DriverManager.getConnection(url, user, pass);
		Statement stmt = con.createStatement();
		
		String sql= "Insert into bus values (0, "+aID+",'"+busNumber+"', '"+busSeat+"', '"+type+"', '"+condition+"')";
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
	
//readddddddd-------------------------------------------------------------------------------	
public static List<Bus> getBusDetails(String aid){
	
	int convertedaid = Integer.parseInt(aid);
	
	ArrayList<Bus> bus = new ArrayList<>();
	
	try {
		
		Connection con = DatabaseConnection.initializeDatabase(); 
		Statement stmt = con.createStatement();
		
		String sql = "select * from bus where aid = '"+convertedaid+"' ";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			String busNumber = rs.getString(3);
			int numberOfSeats = rs.getInt(4);
			String busType = rs.getString(5);
			String AC = rs.getString(6);
			
			Bus B = new Bus (busNumber,numberOfSeats, busType,AC);
			bus.add(B);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return bus;
}

//updateeeeeeeeeeeeeeee-----------------------------------------------------------------------------

public static boolean updatebus(String busNumber, int numberOfSeats,String busType, String condition ) {
	
	try {
		Connection con = DatabaseConnection.initializeDatabase(); 
		Statement stmt = con.createStatement();
		
		String sql="update bus set busNumber ='"+busNumber+"', numberOfSeats='"+numberOfSeats+"',busType='"+busType+"', AC='"+condition+"' where aID= "+aID+"";
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
