package com.btrs.cards;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.btrs.DBconnection.DatabaseConnection;
import com.btrs.interfaces.CardInterface;


public class cardsDBUtil implements CardInterface {
	private static DatabaseConnection db;
	private static Connection con;
	private static Statement state = null;
	private static ResultSet res = null;
	private static boolean Success;
	
       public  boolean addCard( String cNO,String cType,String cHName ,String cvv,String date,int pid) {
    	   
    	   
    	    
    	   boolean Success = false;
    	   
    	   try { 
    		   db = DatabaseConnection.getInstance();
    		   con = db.getCon();
    		   state =con.createStatement();
    		   String sql = " insert into cards values('"+cNO+"','"+cType+"','"+cHName+"','"+cvv+"','"+date+"',"+pid+")" ;
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
 
 //Create sql query to update card details      
  public  boolean updateCard(String cNum,String name,String cv,String expD ) {
	  
	  try {
		  
		   db = DatabaseConnection.getInstance();
		   con = db.getCon();
		  state =con.createStatement();
		  String sql = "update cards set cardHolderName='"+name+"',cvv='"+cv+"',expiryDate='"+expD+"' where cardNo='"+cNum+"' ";
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
 
  
  
  
  
 
 
  //Create sql query to read card details      
  public  List<cardDetails> viewCardDetails(String cardNo){
	  ArrayList<cardDetails> cardDetails1 = new ArrayList<>();
	  
	  try {
		  db = DatabaseConnection.getInstance();
		  con = db.getCon();
		  state = con.createStatement();
		  String sql = "SELECT * FROM cards where cardNo='"+cardNo+"'";
		  res = state.executeQuery(sql);
		  
		  if(res.next()) {
			  String cNO =res.getString("cardNo");
			  String cardType = res.getString("cardType");
			  String cardHN = res.getString("cardHolderName");
			  String cvv = res.getString("cvv");
			  String expDate = res.getString("expiryDate");
			  
			  cardDetails newCard = new cardDetails (cNO,cardType,cardHN,cvv,expDate);
			  cardDetails1.add(newCard);
		  }else {
			  
		  }
		  
	  }catch(Exception e) {
		  
	  }
	  
	  return cardDetails1;
  }
  
  //Create sql query to read card numbers according to cus id     
  public  ArrayList<String> getCardNumbers(int cusID ) {
		
		ArrayList<String> cardNos = new ArrayList<String>();
		
		try {
			db = DatabaseConnection.getInstance();
 		    con = db.getCon();
			Statement stmt = con.createStatement();

		
			String sql = "select cardNo from cards where pid = "+cusID;
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {

				cardNos.add(rs.getString(1));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cardNos;
	}
  
  //Create sql query to delete card details according to cardNo     
   public  boolean deleteCard(String cardNo) {
	   
	   try {
		   db = DatabaseConnection.getInstance();
		   con = db.getCon();
		   state = con.createStatement();
		   
		   String sql = "delete from cards where cardNo='"+cardNo+"'"; 
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
