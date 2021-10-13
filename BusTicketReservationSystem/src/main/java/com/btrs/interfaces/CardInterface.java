package com.btrs.interfaces;

import java.util.ArrayList;
import java.util.List;

import com.btrs.cards.cardDetails;

public interface CardInterface {
	boolean addCard( String cNO,String cType,String cHName ,String cvv,String date,int pid);
	boolean updateCard(String cNum,String name,String cv,String expD );
	List<cardDetails> viewCardDetails(String cardNo);
	ArrayList<String> getCardNumbers(int cusID );
	boolean deleteCard(String cardNo);
}
