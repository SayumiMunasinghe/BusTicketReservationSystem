package com.btrs.enterBusDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalTime;
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
public static boolean InsertBus(int aID,String busNumber, int busSeat, String type,int condition,String upTime,String upArrival,String upDestination,String downTime,String downArrival,String downDestination, double seatPrice) {
	
	isSuccess = false;
	
	//create database connection
	
	
	try {
		 con = DatabaseConnection.initializeDatabase(); 
		 stmt = con.createStatement();
		
		LocalTime time = LocalTime.parse(upTime);
		Time uptime = Time.valueOf(time);
		
		LocalTime time1 = LocalTime.parse(downTime);
		Time downtime = Time.valueOf(time1);

		
		String sql= "Insert into obtrs.bus values (0, "+aID+",'"+busNumber+"', "+busSeat+", '"+type+"', "+condition+") ";
		

		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			//isSuccess = true;
			
			String sql1= "Insert into obtrs.busroute values ((SELECT busID FROM bus where busNumber= '"+busNumber+"'),'"+uptime+"','"+upArrival+"','"+upDestination+"',"+seatPrice+")";
			String sql2="Insert INTO obtrs.busroute values((SELECT busID FROM bus where busNumber= '"+busNumber+"'),'"+downtime+"','"+downArrival+"','"+downDestination+"',"+seatPrice+")";
			int rs1 = stmt.executeUpdate(sql1);
			int rs2 = stmt.executeUpdate(sql2);
			
			if((rs1  >0)&& (rs2 > 0)) {
				isSuccess = true;
			}//else {
//				isSuccess = false;
//			}
//			
		}else {
			isSuccess = false;
		}
		
	  
	}catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}
	
//readddddddd-------------------------------------------------------------------------------	
public static List<Bus> getBusDetails(int aID){
	
	//int convertedaid = Integer.parseInt(aid);
	ArrayList<Bus> bus = new ArrayList<>();
	
	try {
		
		 con = DatabaseConnection.initializeDatabase(); 
		 stmt = con.createStatement();
		
		String sql = "SELECT * FROM bus b, busroute r WHERE b.busID=r.busID AND b.aID=1 ";
		ResultSet rs = stmt.executeQuery(sql);
		
		Bus B = new Bus ("EE3",50, "Luxury",1, "30:00","ghsghdg","idfsjf","34:00","ifisjndf","ksjdffd",100.00);
		bus.add(B);
		/*if(rs.next()) {
			
			String busNumber = rs.getString("busNumber");
			int numberOfSeats = rs.getInt("numberOfSeats");
			String busType = rs.getString("busType");
			int AC = rs.getInt("AC");
			String uTime = rs.getString("time");
			String uArrival = rs.getString("arrivalLocation");
			String uDestination = rs.getString("destinationLocation");
			String dTime = rs.getString("time");
			String dArrival = rs.getString("arrivalLocation");
			String dDestination = rs.getString("destinationLocation");
			double price = rs.getDouble("seatPrice");
			
			Bus B = new Bus (busNumber,numberOfSeats, busType,AC, uTime,uArrival,uDestination,dTime,dArrival,dDestination,price);
			bus.add(B);
		}*/
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return bus;
}

//updateeeeeeeeeeeeeeee-----------------------------------------------------------------------------

public static boolean updatebus(String busNumber, int numberOfSeats,String busType, String condition, int aID ) {
	
	try {
		 con = DatabaseConnection.initializeDatabase(); 
		 stmt = con.createStatement();
		
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
