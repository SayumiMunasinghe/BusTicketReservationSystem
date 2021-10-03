package com.btrs.passengerReg;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.btrs.DBconnection.DatabaseConnection;
import com.btrs.interfaces.PersonDatabase;

//use interface called Person for checkLogin()
public class PassengerDBUtil implements PersonDatabase {
	
	//copy for db connection
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	//til here
	

	public static List<Passenger> CheckExist(int userID){
		ArrayList<Passenger> passenger = new ArrayList<>();
		 
		//validate
		try {
			//copy for db connection for util file
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "SELECT * FROM passenger WHERE pid= "+userID+" ";
			rs = stmt.executeQuery(sql);
			//til here
		
			if(rs.next()) {
				int pid = rs.getInt(1);
				String fname = rs.getString(2);
				String lname = rs.getString(3);
				String pemail = rs.getString(4);
				String passw = rs.getString(5);
				String telno = rs.getString(6);
				
				Passenger p = new Passenger(pid, fname, lname, pemail, passw, telno);
				passenger.add(p);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return passenger;
	}
	
	//checks if user details pw and un exist and return pid to allow login to a session
	public static int checkLogin(String email, String pw){

		int passid = -1;
		//validate
		
		try {
			//copy for db connection for util file
			con = DatabaseConnection.initializeDatabase(); //make connection with db using DatabaseConnection class
			stmt = con.createStatement();
			String sql = "SELECT * FROM passenger WHERE email='"+email+"'and password='"+pw+"'";
			rs = stmt.executeQuery(sql);
			//til here
			
		    if(rs.next()) {
				int pid = rs.getInt(1);
				passid = pid;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return passid;
	}

	///////////////////////////////ADD NEW PASSENGER TO DB FUNCTION////////////////////
	public static boolean insertPassenger(String fname, String lname, String email, String pwd, String phone) {
		
		//variable to check if sql statement execute successfully and inserted a row
		boolean isSuccess = false;
			
		try {
			
			//sql statement to insert the new passenger details to the db
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			
			//the email field in the database is UNIQUE so if email already exist will display an error when inserting
			String sql = "INSERT INTO passenger VALUES (0,'"+fname+"','"+lname+"','"+email+"','"+pwd+"','"+phone+"')";

			//if it would return 1 -> success(row inserted)
			//else if executeupdate return 0 -> unsuccess (row not inserted)
			//change bool variable depending on this
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
	
	///////////////////////GET PASSENGER ID FUNCTION when registering to go homepage////////////////////////
	public static int getID(String email) {
		//this function is used to return the pid of passenger to servlet to send to homepage 
		int passid = -1;
			
		try {
			
			//sql statement to insert the new passenger details to the db
			//just call this function to create connection to db
			con = DatabaseConnection.initializeDatabase(); 
			stmt = con.createStatement();
			
			String sql = "select pid from passenger where email '"+email+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
			 if(rs.next()) {
					int pid = rs.getInt(1); //get the pid from db 
					passid = pid;	//assign to pid
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return passid;
	}
	
	///////////////////////UPDATE PASSENGER PASSWORD FUNCTION////////////////
	public static boolean updatePassword(int userID, String pwd) {
		
		boolean isUpdated = false;
		
		try {
			con = DatabaseConnection.initializeDatabase(); 
			stmt = con.createStatement();
			
			//below sql for update passenger password where the parameter pid = db pid
			String sql = "UPDATE passenger SET password='"+pwd+"' WHERE pid="+userID+"";
			
			//executeupdate() function reutrns 1(sucesss)/0(fail) therefore assign result to int variable
			int rs = stmt.executeUpdate(sql);
			
			//assigning the 0 or 1 depending on update fail or success
			if(rs > 0) {
				isUpdated = true;
			
			}else{
				isUpdated = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
		return isUpdated;
		
	}
	
	///////////////////////UPDATE PASSENGER PHONE FUNCTION////////////////
	public static boolean updatePhone(int userID, String tel) {
		
		boolean isUpdated = false;
		
		try {
			con = DatabaseConnection.initializeDatabase(); 
			stmt = con.createStatement();
			
			//below sql for update passenger phone where the parameter pid = db pid
			String sql = "UPDATE passenger SET phone='"+tel+"' WHERE pid="+userID+"";
			
			//executeupdate() function reutrns 1(sucesss)/0(fail) therefore assign result to int variable
			int rs = stmt.executeUpdate(sql);
			
			//assigning the 0 or 1 depending on update fail or success
			if(rs > 0) {
				isUpdated = true;
			
			}else{
				isUpdated = false;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();		
		}
		
		return isUpdated;
		
	}
	
	/////////////////////DELETE PASSENGER////////////////////
	public static Boolean DeletePassengerDetails(int userID) 
	{
		boolean isDeleted = false;
		
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();

			String sql = "DELETE FROM passenger WHERE pid = " + userID + "";
			int rs = stmt.executeUpdate(sql);
			if(rs > 0) {
				isDeleted = true;
			}else {
				isDeleted = false;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return isDeleted;
	}


}
