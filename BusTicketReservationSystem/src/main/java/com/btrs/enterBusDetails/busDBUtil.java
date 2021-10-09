package com.btrs.enterBusDetails;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.btrs.DBconnection.DatabaseConnection;
import com.btrs.cards.DBconnection;

public class busDBUtil {
	private static DatabaseConnection db;
	private static Connection con;
	private static Statement stmt = null;
	private static boolean isSuccess;
	

	
	//insert part---------------------------------------------------------------
public static boolean InsertBus(int aID,String busNumber, int busSeat, String type,int condition,String upTime,String upArrival,String upDestination,String downTime,String downArrival,String downDestination, double seatPrice) {
	
	isSuccess = false;
	
	try {
		 db = DatabaseConnection.getInstance();
		 con = db.getCon();
		 stmt = con.createStatement();
		
		LocalTime time = LocalTime.parse(upTime);
		Time uptime = Time.valueOf(time);
		
		LocalTime time1 = LocalTime.parse(downTime);
		Time downtime = Time.valueOf(time1);

		
		String sql= "Insert into obtrs.bus values (0, "+aID+",'"+busNumber+"', "+busSeat+", '"+type+"', "+condition+") ";
		

		int rs = stmt.executeUpdate(sql);
		
		if(rs > 0) {
			//isSuccess = true;
			
			String sql1= "Insert into obtrs.busroute values (0,(SELECT busID FROM bus where busNumber= '"+busNumber+"'),'"+uptime+"','"+upArrival+"','"+upDestination+"',"+seatPrice+")";
			String sql2="Insert INTO obtrs.busroute values(0,(SELECT busID FROM bus where busNumber= '"+busNumber+"'),'"+downtime+"','"+downArrival+"','"+downDestination+"',"+seatPrice+")";
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
		
		db = DatabaseConnection.getInstance();
		 con = db.getCon(); 
		 stmt = con.createStatement();
		
		String sql = "SELECT DISTINCT * FROM bus b, busroute r WHERE b.busID=r.busID AND b.aID=1 ";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			
			int id = rs.getInt("id");
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
			
			Bus B = new Bus (id,busNumber,numberOfSeats, busType,AC, uTime,uArrival,uDestination,dTime,dArrival,dDestination,price);
			bus.add(B);
		}
		
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	
	return bus;
}

//updateeeeeeeeeeeeeeee-----------------------------------------------------------------------------

public static boolean updatebus(int id,String busNumber, int numberOfSeats,String busType, String condition, String time, String arrival, String destination, int aID,double Price ) {
	
	try {
		db = DatabaseConnection.getInstance();
		 con = db.getCon();
		stmt = con.createStatement();
		 
		String sql1="update bus b,busroute r set b.numberOfSeats="+numberOfSeats+",b.busType='"+busType+"',r.time='"+time+"',r.arrivalLocation='"+arrival+"',r.destinationLocation='"+destination+"', r.seatPrice="+Price+" where b.busID=r.busID AND b.aID=1 AND r.id="+id;
		int rs1 = stmt.executeUpdate(sql1);
		
		if((rs1 > 0)){
			isSuccess = true;
		}else {
			isSuccess = false;
			}
		}catch(Exception e) {
		e.printStackTrace();
	}
	return isSuccess;
}	
	
	
//to get busNumbers from data base to the drop dwon when updating
public static ArrayList<String> getBusNumbers(int aID ) {
	
	ArrayList<String> busNumbers = new ArrayList<String>();
	
	try {
		db = DatabaseConnection.getInstance();
		 con = db.getCon();
		 stmt = con.createStatement();

		//getting busnumbers per agent
		String sql = "select busNumber from bus where aID = 1 ";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()) {

			busNumbers.add(rs.getString(1));
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	} catch (Exception e) {
		e.printStackTrace();
	}
	return busNumbers;
}
	
//getting busdetails into an array	
public static ArrayList<Bus> getBusDetails(String busNumber){
	ArrayList<Bus> BusDetails = new ArrayList<Bus>();
	
	try {
		db = DatabaseConnection.getInstance();
		 con = db.getCon();
		 stmt = con.createStatement();
		 
		 String sql ="Select * from bus b, busroute r where b.busID=r.busID AND aID=1 AND busNumber='"+busNumber+"'";
		 ResultSet rs = stmt.executeQuery(sql);
		 
		 while(rs.next()) {
			 	int id = rs.getInt("id");
			 	System.out.println(id);
			 	String busNumber1 = rs.getString("busNumber");
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
				
				Bus B = new Bus (id,busNumber1,numberOfSeats, busType,AC, uTime,uArrival,uDestination,dTime,dArrival,dDestination,price);
				BusDetails.add(B);
		 }}catch(Exception e) {
			 e.printStackTrace();
		 }return BusDetails;
	}
//cant remember what this is
//public static ArrayList<Bus> getBusRoutes(String busNumber){
//	ArrayList<Bus> BusRoutes = new ArrayList<Bus>();
//	
//	try {
//		 con = DatabaseConnection.initializeDatabase();
//		 stmt = con.createStatement();
//		 
//		 String sql ="Select * from bus b, busroute r where b.busID=r.busID AND aID=2 AND busNumber='"+busNumber+"'";
//		 ResultSet rs = stmt.executeQuery(sql);
//		 
//		 while(rs.next()) {
//			 	int id = rs.getInt("id");
//			 	String busNumber1 = rs.getString("busNumber");
//				int numberOfSeats = rs.getInt("numberOfSeats");
//				String busType = rs.getString("busType");
//				int AC = rs.getInt("AC");
//				String uTime = rs.getString("time");
//				String uArrival = rs.getString("arrivalLocation");
//				String uDestination = rs.getString("destinationLocation");
//				String dTime = rs.getString("time");
//				String dArrival = rs.getString("arrivalLocation");
//				String dDestination = rs.getString("destinationLocation");
//				double price = rs.getDouble("seatPrice");
//				
//				Bus B = new Bus (id,busNumber1,numberOfSeats, busType,AC, uTime,uArrival,uDestination,dTime,dArrival,dDestination,price);
//				BusRoutes.add(B);
//		 }}catch(Exception e) {
//			 e.printStackTrace();
//		 }return BusRoutes;
//	}

//function to delete bus from database
public static boolean deleteBus(String busNumber,int aID) {
	   
	   try {
		   db = DatabaseConnection.getInstance();
			 con = db.getCon();
		   stmt = con.createStatement();
		   
		   String sql = "DELETE FROM bus WHERE busNumber='"+busNumber+"' and aID=1;"; 
		   int res = stmt.executeUpdate(sql);
		   
		   if(res > 0) {
			   isSuccess = true;
		   }else {
			   isSuccess = false;
		   }
	   }catch(Exception e){
		   e.printStackTrace();
	   }
	   return isSuccess;
}
}
	
	
	
	
	
	
	

