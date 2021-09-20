package passengerReg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class PassengerDBUtil {
	
	public static List<Passenger> Register(String email, String pw){
		ArrayList<Passenger> passenger = new ArrayList<>();
		
		//create database connection
		String url = "jdbc:mysql://localhost:3306/obtrs";
		String user = "root";
		String password = "password"; 
		
		//validate
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, user, password);
			Statement stmt = con.createStatement();
			
			String sql = "select * from passenger where email='"+email+"'and password='"+pw+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
		
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

}
