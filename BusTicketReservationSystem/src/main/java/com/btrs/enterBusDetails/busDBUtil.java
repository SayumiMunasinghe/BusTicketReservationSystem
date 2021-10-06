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
		
		 con = DatabaseConnection.initializeDatabase(); 
		 stmt = con.createStatement();
		
		String sql = "SELECT DISTINCT * FROM bus b, busroute r WHERE b.busID=r.busID AND b.aID=2 ";
		ResultSet rs = stmt.executeQuery(sql);
		
//		Bus B = new Bus ("EE3",50, "Luxury",1,"30:00","ghsghdg","idfsjf","34:00","ifisjndf","ksjdffd",100.00);
//		bus.add(B);
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
		 con = DatabaseConnection.initializeDatabase(); 
		 stmt = con.createStatement();
		 
		 
//		String sql = "SELECT time FROM bus b, busroute r WHERE b.busID=r.busID AND b.aID=2 ";
//		ResultSet rs = stmt.executeQuery(sql);
//		 
//		while(rs.next()) {
//			 String DBTime = rs.getString("time");
			 
		
//		String sql1="update bus set busNumber ='"+busNumber+"', numberOfSeats='"+numberOfSeats+"',busType='"+busType+"', AC='"+condition+"' where aID= "+aID+" AND time='"+DBTime+"'";
//		int rs1 = stmt.executeUpdate(sql1);
//		String sql2="update busroute set time ='"+time+"', arrivalLocation='"+arrival+"',destinationLocation='"+destination+"', seatPrice='"+condition+"' where aID= "+aID+" AND time='"+DBTime+"'";
//		int rs2 = stmt.executeUpdate(sql2);
			 

		String sql1="update bus b,busroute r set b.numberOfSeats="+numberOfSeats+",b.busType='"+busType+"',r.time='"+time+"',r.arrivalLocation='"+arrival+"',r.destinationLocation='"+destination+"', r.seatPrice="+Price+" where b.busID=r.busID AND b.aID=2 AND r.id="+id;
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
		 con = DatabaseConnection.initializeDatabase();
		 stmt = con.createStatement();

		//getting price per seat in a given bus going at a given time
		String sql = "select busNumber from bus where aID = 2 ";
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
	
	
public static ArrayList<Bus> getBusDetails(String busNumber){
	ArrayList<Bus> BusDetails = new ArrayList<Bus>();
	
	try {
		 con = DatabaseConnection.initializeDatabase();
		 stmt = con.createStatement();
		 
		 String sql ="Select * from bus b, busroute r where b.busID=r.busID AND aID=2 AND busNumber='"+busNumber+"'";
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
public static ArrayList<Bus> getBusRoutes(String busNumber){
	ArrayList<Bus> BusRoutes = new ArrayList<Bus>();
	
	try {
		 con = DatabaseConnection.initializeDatabase();
		 stmt = con.createStatement();
		 
		 String sql ="Select * from bus b, busroute r where b.busID=r.busID AND aID=2 AND busNumber='"+busNumber+"'";
		 ResultSet rs = stmt.executeQuery(sql);
		 
		 while(rs.next()) {
			 	int id = rs.getInt("id");
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
				BusRoutes.add(B);
		 }}catch(Exception e) {
			 e.printStackTrace();
		 }return BusRoutes;
	}
//public static int getID(int aID,String busNumber) {
//	//this function is used to return the pid of passenger to servlet to send to homepage 
//	int rid = -1;
//		
//	try {
//		
//		//sql statement to insert the new passenger details to the db
//		//just call this function to create connection to db
//		con = DatabaseConnection.initializeDatabase(); 
//		stmt = con.createStatement();
//		
//		String sql = "select r.id from bus b, busroute r where b.busID=r.busID and aID="+aID+" and busNumber='"+busNumber+"'";
//		
//		ResultSet rs = stmt.executeQuery(sql);
//		
//		 if(rs.next()) {
//				int id = rs.getInt("id"); //get the pid from db 
//				rid = id;	//assign to pid
//		}			
//	}catch(Exception e) {
//		e.printStackTrace();
//	}
//	
//	return rid;
//}
public static boolean deleteBus(String busNumber,int aID) {
	   
	   try {
		   con = DatabaseConnection.initializeDatabase();
		   stmt = con.createStatement();
		   
		   String sql = "DELETE FROM bus WHERE busNumber='"+busNumber+"' and aID=2;"; 
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
	
	
	
	
	
	
	

