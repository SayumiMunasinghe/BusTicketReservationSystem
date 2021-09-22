package com.btrs.passengerReg;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import DBconnection.DatabaseConnection;

public class PassengerDBUtil {
	
	//copy for db connection
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	//til here
	
	public static int CheckExist(String email, String pw){
//		ArrayList<Passenger> passenger = new ArrayList<>();
		
		//create database connection
//		String url = "jdbc:mysql://localhost:3306/obtrs";
//		String user = "root";
//		String password = "password"; 

		  int passid = -1;
		//validate
		try {
//			Class.forName("com.mysql.jdbc.Driver");
			
//			Connection con = DriverManager.getConnection(url, user, password);
//			Statement stmt = con.createStatement();

			//copy for db connection for util file
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "select * from passenger where email='"+email+"'and password='"+pw+"'";
			rs = stmt.executeQuery(sql);
			//til here
			
//			String sql = "select * from passenger where email='"+email+"'and password='"+pw+"'";
			
//			ResultSet rs = stmt.executeQuery(sql);
			
		    if(rs.next()) {
				int pid = rs.getInt(1);
//				String fname = rs.getString(2);
//				String lname = rs.getString(3);
//				String pemail = rs.getString(4);
//				String passw = rs.getString(5);
//				String telno = rs.getString(6);
				
//				Passenger p = new Passenger(pid, fname, lname, pemail, passw, telno);
//				passenger.add(p);
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
		
		int passid = -1;
			
		try {
			
			//sql statement to insert the new passenger details to the db
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "select pid from passenger where email '"+email+"'";
			
			//if executeupdate return 0 -> unsuccess (row not inserted)
			//else it would return 1 -> success(row inserted)
			//change bool variable depending on this
			ResultSet rs = stmt.executeQuery(sql);
			
			 if(rs.next()) {
					int pid = rs.getInt(1);
					passid = pid;
					
			}
			
			 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return passid;
	}
	
	

}
