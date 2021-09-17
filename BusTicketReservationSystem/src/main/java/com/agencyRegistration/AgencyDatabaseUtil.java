package com.agencyRegistration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DBconnection.DatabaseConnection;

public class AgencyDatabaseUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
//	public static List<AgencyDetails> validate(String userName, String password){
//		
//		ArrayList<AgencyDetails> AgDetail = new ArrayList<>();
//		
//		//Creating DB connection 
//		String url = "jdbc:mysql;//localhost:3306/obtrs";
//		String uName = "root";
//		String pWord = "password";
//		
//		//Validation of data
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			
//			Connection con = DriverManager.getConnection(url, uName, pWord);
//			Statement stmt = con.createStatement();
//			String sql = "SELECT * FROM agency WHERE username ='"+userName+"'and password ='"+password+"'";
//			ResultSet rs = stmt.executeQuery(sql);
//			
//			 //IF condition goes here
//			
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		return AgDetail;
//	}
	
	
	// INSERTINGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGgg
	

	public static boolean insertAgencyDetails(String agentNIC, String agentName, String companyName, String agentPhone,String agentEmail, String agencyLocation, String password, String confirmPassword, String username) 
	{
		boolean status = false;
		
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "Insert into agency values (0 , '"+agentNIC+"', '"+agentName+"', '"+companyName+"', '"+agentPhone+"', '"+agentEmail+"', '"+agencyLocation+"', '"+password+"', '"+confirmPassword+"','"+username+"')";
			int rs = stmt.executeUpdate(sql);

			if(rs > 0) {
				status = true;
			}else {
				status = false;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
 