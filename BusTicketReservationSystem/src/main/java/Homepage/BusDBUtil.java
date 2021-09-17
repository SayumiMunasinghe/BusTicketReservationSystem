package Homepage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
//import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

//import DBconnection.DatabaseConnection;

public class BusDBUtil {

	public static List<BusDetails> sendDetails(String arrival, String destination) {

		ArrayList<BusDetails> bd = new ArrayList();
		
		//			try {
		//				Connection con = DatabaseConnection.initializeDatabase();
		//			} catch (ClassNotFoundException e) {
		//				e.printStackTrace();
		//			} catch (SQLException e) {
		//				e.printStackTrace();
		//			}	
		
		//creating database connection
		String dbDriver = "com.mysql.jdbc.Driver";
		String dbURL = "jdbc:mysql:// localhost:3306/";

		String dbName = "obtrs";
		String dbUsername = "root";
		String dbPassword = "password";
		
		try {
			Class.forName(dbDriver);
			Connection con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
			
			Statement stmt = con.createStatement();
			//getting busses with the given arrival and destination locations
			String sql = "	select b.busID, b.busNumber, b.numberOfSeats, b.busType, b.seatPrice, b.AC, r.time from bus b, busroute r where b.busID = r.busID AND r.arrivalLocation LIKE '"+arrival+"' AND r.destinationLocation LIKE '"+destination+"'";
			ResultSet rs = stmt.executeQuery(sql);

			if(rs.next()) {
				int busID = rs.getInt(1);
				String busNumber = rs.getString(2);
				int noOfSeats = rs.getInt(3);
				String busType = rs.getString(4);
				double seatPrice = rs.getDouble(5);
				int AC = rs.getInt(6);
				String time = rs.getString(7);
				
				BusDetails b = new BusDetails(busID, busNumber, noOfSeats, busType, seatPrice, AC, arrival, destination, time);
				bd.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return bd;
	}
}
