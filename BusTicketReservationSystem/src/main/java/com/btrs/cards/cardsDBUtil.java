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
       public static boolean addCard(int pid, String cNO,String cHName ,String cType,String cvv,String date) {
    	   
    	   
    	    
    	   boolean Success = false;
    	   
    	   try { 
    		   con = DBconnection.getConnection();
    		   state = con.createStatement();
    		   String sql = "insert into cards values('"+pid+"','"+cNO+"','"+cType+"','"+cHName+"','"+cvv+"','"+date+"') ";
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
       
  public static boolean updateCard(int id,String type ,int cardID,String name,String cv,String expD ) {
	  
	  try {
		  
		  con = DBconnection.getConnection();
		  state =con.createStatement();
		  String sql = "update cards set cardHolderName='"+name+"',cvv='"+cv+"',expiryDate='"+expD+"'"
		  		+ "     where passengerID='"+id+"' and cardID='"+cardID+"'";
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
   
  public static List<cardDetails> getcardDetails(int id,int cardID){
	  ArrayList<cardDetails> card = new ArrayList<>();
	  try {
		  con = DBconnection.getConnection();
		  state = con.createStatement();
		  String sql = "select cardHolderName,cvv,cardNo,cardType,expiryDate where passengerID='"+id+"' AND cardID='"+cardID+"' ";
		  res = state.executeQuery(sql);
		  
		  while(res.next()) {
			  String Num = res.getString(3);
			  String CHName = res.getString(5);
			  String cType = res.getString(4);
			  String cvv = res.getString(6);
			  String date = res.getString(7);
                
			  cardDetails c = new cardDetails(Num,CHName,cType,cvv,date);
			  card.add(c);
		  }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	     
	  
	  return card;
  }
 
}
