package com.btrs.cards;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


public class cardsDBUtil {
	private static Connection con = null;
	private static Statement state = null;
	private static boolean Success;
       public static boolean addCard(int pid, String cNO,String cHName ,String cType,String cvv,String date) {
    	   
    	   
    	    
    	   boolean Success = false;
    	   
    	   try { 
    		   con = DBconnection.getConnection();
    		   state = con.createStatement();
    		   String sql = "insert into cards values('"+pid+"','"+cNO+"','"+cHName+"','"+cType+"','"+cvv+"','"+date+"') ";
    		   int res = state.executeUpdate(sql);
    		   
    		   if(res > 0) {
    			   Success = true;
    		   }else {
    			   Success = false;
    		   } 
    	   }catch(Exception e) {
    		   e.printStackTrace();
    	   }
    	   return Success;
       }
       
  public static boolean updateCard(int id,String type ,String cNum,String name,String cv,String expD ) {
	  
	  try {
		  
		  con = DBconnection.getConnection();
		  state =con.createStatement();
		  String sql = "update cards set cardholder_Name='"+name+"',CVV='"+cv+"',exp_Date='"+expD+"'"
		  		+ "     where passengerID='"+id+"' and card_No='"+cNum+"'";
		  int res = state.executeUpdate(sql);
		  
		  if(res>0) {
			  Success = true;
		  }else {
			  Success = false;
		  }
		  
	  }catch(Exception e){
		  e.printStackTrace();
	  }
	  
	  
	  
	  return Success;
  }    
   
 
}
