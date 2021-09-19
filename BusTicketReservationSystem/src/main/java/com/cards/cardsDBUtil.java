package com.cards;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class cardsDBUtil {
       public static boolean addCard(String cNO,String cHName ,String cType,String cvv,String date) {
    	   
    	   boolean isSuccess = false;
    	    
    	   //Create database connection
    	   String url ="jdbc:mysql://localhost:3306/obtrs";
    	   String user ="root";
    	   String password ="password";
    	   
    	   try {
    		   
    		   Class.forName("com.mysql.jdbc.Driver");
    		   
    		   Connection con = DriverManager.getConnection(url, user, password);
    		   Statement state = con.createStatement();
    		   String sql = "insert into cards values('"+cNO+"','"+cHName+"','"+cType+"','"+cvv+"','"+date+"') ";
    		   int res = state.executeUpdate(sql);
    		   
    		   if(res > 0) {
    			   isSuccess = true;
    		   }else {
    			   isSuccess = false;
    		   } 
    	   }catch(Exception e) {
    		   e.printStackTrace();
    	   }
    	   return isSuccess;
       }
}
