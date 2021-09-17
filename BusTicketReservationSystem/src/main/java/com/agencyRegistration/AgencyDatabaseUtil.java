package com.agencyRegistration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AgencyDatabaseUtil {
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
	

	public static boolean insertAgencyDetails(String agentNIC, String agentName, String companyName, String agentPhone,
			String agentEmail, String agencyLocation, String password, String confirmPassword, String username) {
		
		
		boolean status = false;
		
		
		//Creating DB connection 
//		String url = "jdbc:mysql://localhost:3306/testdb";
//		String uName = "root";
//		String pWord = "password";
		
		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			Connection con = DriverManager.getConnection(url, uName, pWord);
			
		    Class.forName("com.mysql.jdbc.Driver");         
		    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/obtrs","root","password");  
			Statement stmt = con.createStatement();
			String sql = "Insert into agency values (0 , '"+agentNIC+"', '"+agentName+"', '"+companyName+"', '"+agentPhone+"', '"+agentEmail+"', '"+agencyLocation+"', '"+password+"', '"+confirmPassword+"','"+username+"')";
//			String sql = "Insert into new_table values (4 , 5)";
			
			int rs = stmt.executeUpdate(sql);
		
//			int rs = stmt.executeUpdate(sql);
			
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
 