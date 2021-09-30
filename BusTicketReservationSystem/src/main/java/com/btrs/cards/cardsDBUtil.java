package com.btrs.cards;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class cardsDBUtil {
	private static Connection con = null;
	private static Statement state = null;
	private static ResultSet res = null;
	private static boolean Success;
	
       public static boolean addCard( String cNO,String cType,String cHName ,String cvv,String date,int pid) {
    	   
    	   
    	    
    	   boolean Success = false;
    	   
    	   try { 
    		   con = DBconnection.getConnection();
    		   state = con.createStatement();
    		   String sql = "insert into cards values('"+cNO+"','"+cType+"','"+cHName+"','"+cvv+"','"+date+"',"+pid+")";
    		   int res = state.executeUpdate(sql);
    		   
    		   if(res>0) {
    			   Success = true;
    		   }else
    			   Success = false;
    		   
    		  
       }catch(Exception e) {
     	  e.printStackTrace(); 
          }
    	   return Success;
       }
       
  public static boolean updateCard(int id,String type ,String cNum,String name,String cv,String expD ) {
	  
	  try {
		  
		  con = DBconnection.getConnection();
		  state =con.createStatement();
		  String sql = "update cards set cardHolderName='"+name+"',cvv='"+cv+"',expiryDate='"+expD+"'"
		  		+ "     where pid="+id+"";
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
