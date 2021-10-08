package com.btrs.DBconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
	
	private Connection con;
	private  String dbDriver;
	private  String dbURL;
	private  String dbName;
	private  String dbUsername;
	private  String dbPassword;
	
	private static DatabaseConnection db;
	
	private DatabaseConnection() throws SQLException, ClassNotFoundException{
		dbDriver = "com.mysql.jdbc.Driver";
		this.dbURL = "jdbc:mysql://localhost:3306/";
		this.dbName = "obtrs";
		this.dbUsername = "root";
		this.dbPassword = "password";
		Class.forName(this.dbDriver);
		this.con =  DriverManager.getConnection(this.dbURL + this.dbName, this.dbUsername, this.dbPassword);
	}
	public static DatabaseConnection getInstance() throws SQLException, ClassNotFoundException{
		if(db == null) {
			db = new DatabaseConnection();
		}
		return db;
	}
	public Connection getCon() {
		return this.con;
	}
}
