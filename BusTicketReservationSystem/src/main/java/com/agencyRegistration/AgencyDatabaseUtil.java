package com.agencyRegistration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AgencyDatabaseUtil {
	public static List<AgencyDetails> validate(String userName, String password){
		
		ArrayList<AgencyDetails> AgDetail = new ArrayList<>();
		
		//Creating DB connection 
		String url = "jdbc:mysql;//localhost:3306/obtrs";
		String uName = "root";
		String pWord = "password";
		
		//Validation of data
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, uName, pWord);
			Statement stmt = con.createStatement();
			String sql = "SELECT * FROM agency WHERE username ='"+userName+"'and password ='"+password+"'";
			ResultSet rs = stmt.executeQuery(sql);
			
			 //IF condition goes here
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return AgDetail;
	}
	
	
	// INSERTINGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGgg
	
	
	public static boolean insertAgencyDetails(String agentNIC, String agentName, String companyName, String agentPhone,
			String agentEmail, String agencyLocation, String password, String confirmPassword, String username) {
		
		
		
		
		boolean isSuccess = false;
		
		//Creating DB connection 
		String url = "jdbc:mysql;//localhost:3306/obtrs";
		String uName = "root";
		String pWord = "password";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, uName, pWord);
			Statement stmt = con.createStatement();
			String sql = "INSERT INTO agency VALUES(0 , '"+agentNIC+"', '"+agentName+"', '"+companyName+"', '"+agentPhone+"', '"+agentEmail+"', '"+agencyLocation+"', '"+password+"', '"+confirmPassword+"','"+username+"')";
			int rs = stmt.executeUpdate(sql);
		
		
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return isSuccess;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
 