package com.btrs.agencyRegistration;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;
import com.btrs.interfaces.PersonDatabase;
import com.btrs.DBconnection.DatabaseConnection;

public class AgencyDatabaseUtil implements PersonDatabase{
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	//Checks login and return user ID value and assigns user ID to a session in AgencyLoginServlet page. 
	public static int checkLogin(String userName, String password){
		int output = -1;
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "SELECT * FROM agency WHERE username ='"+userName+"'and password ='"+password+"'";
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				int agentID = rs.getInt("agentID");
				output = agentID;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return output;
	}

//READING data and displaying the data in viewAgencyDetails page 
	public static List<AgencyDetails> viewAgencyData(int userID){
		ArrayList<AgencyDetails> agencyDetailList1 = new ArrayList<>();

		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql = "SELECT * FROM agency WHERE agentID ='"+userID+"'";
			rs = stmt.executeQuery(sql);

			if(rs.next()) {
				int agentID = rs.getInt("agentID");
				String agentNIC = rs.getString("agentNIC");
				String agentName = rs.getString("agentName");
				String companyName = rs.getString("companyName");
				String agentPhone = rs.getString("agentPhone");
				String agentEmail = rs.getString("agentEmail");
				String agencyLocation = rs.getString("agencyLocation");
				String pass = rs.getString("password");
				String username = rs.getString("username");

				AgencyDetails newAgency1 = new AgencyDetails(agentID, agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, pass, username);
				agencyDetailList1.add(newAgency1);
			}else{

			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return agencyDetailList1;
	}

// INSERTING data into the data base from registration
	public static String insertAgencyDetails(String agentNIC, String agentName, String companyName, String agentPhone,String agentEmail, String agencyLocation, String password, String username) 
	{
		ResultSet rs = null;
		String status = "0";
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();
			String sql1 = "SELECT * FROM obtrs.agency WHERE username ='"+username+"'OR agentEmail = '"+agentEmail+"'";
			rs = stmt.executeQuery(sql1);

			//Check if username or email already exist or not
			if(rs.next()) {
				String checkUsername = rs.getString("username");
				String checkAgentEmail = rs.getString("agentEmail");
				if(checkUsername.equals(username)) {
					status = "username";
					return status;
				}
				if(checkAgentEmail.equals(agentEmail)) {
					status = "email";
					return status;
				}
			}

			//This will insert entered data into the database
			String sql2 = "Insert into agency values (0 , '"+agentNIC+"', '"+agentName+"', '"+companyName+"', '"+agentPhone+"', '"+agentEmail+"', '"+agencyLocation+"', '"+password+"','"+username+"')";
			int rs2 = stmt.executeUpdate(sql2);
			if(rs2 > 0) {
				status = "1";
			}else {
				status = "0";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

// UPDATING data in the data base from update form
	public static String UpdateAgencyDetails(int userID, String agentNIC, String agentName, String companyName, String agentPhone,String agentEmail, String agencyLocation, String password, String username) 
	{
		String status = "0";
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();

			String sql2 = "UPDATE agency SET agentNIC = '"+agentNIC+"' , agentName = '"+agentName+"', companyName = '"+companyName+"', agentPhone = '"+agentPhone+"', agentEmail = '"+agentEmail+"', agencyLocation = '"+agencyLocation+"', password = '"+password+"', username ='"+username+"' WHERE agentID = "+userID+"";
			int rs2 = stmt.executeUpdate(sql2);
			if(rs2 > 0) {
				status = "1";
			}else {
				status = "0";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

// DELETING data from the data base from manage agency section
	public static String DeleteAgencyDetails(int userID) 
	{
		String status = "0";
		try {
			con = DatabaseConnection.initializeDatabase();
			stmt = con.createStatement();

			String sql2 = "DELETE FROM agency WHERE agentID = " + userID + "";
			int rs2 = stmt.executeUpdate(sql2);
			if(rs2 > 0) {
				status = "1";
			}else {
				status = "0";
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

// DELETE THE SESSION
}
