package com.btrs.passengerReg;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.btrs.DBconnection.DatabaseConnection;
import com.btrs.interfaces.Person;

//use interface called Person for checkLogin()
public class PassengerDBUtil implements Person {
	
	//copy for db connection
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	//til here
	
	//checks if user details pw and un exist and return pid to allow login to a session
	public static int checkLogin(String email, String pw){

		int passid = -1;
		//validate
		
		try {
			//copy for db connection for util file
			con = DatabaseConnection.initializeDatabase(); //make connection with db using DatabaseConnection class
			stmt = con.createStatement();
			String sql = "select * from passenger where email='"+email+"'and password='"+pw+"'";
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
	
	public static boolean insertPassenger(String fname, String lname, String email, String pwd, String phone) {
		
		//variable to check if sql statement execute successfully and inserted a row
		boolean isSuccess = false;
			
		try {
			
			//sql statement to insert the new passenger details to the db
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "insert into passenger values (0,'"+fname+"','"+lname+"','"+email+"','"+pwd+"','"+phone+"')";
			
			//if executeupdate return 0 -> unsuccess (row not inserted)
			//else it would return 1 -> success(row inserted)
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
	
	

}
