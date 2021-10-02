package com.btrs.cards;

public class cardDetails {
	private String cNum;
    private String cType;
    private String date;
    private String cHName;
    private String cvv;
    
	public cardDetails( String cNum, String cType,  String cHName, String cvv,String date) {
		
		this.cNum = cNum;
		this.cType = cType;
		this.date = date;
		this.cHName = cHName;
		this.cvv = cvv;
	}

	

	public String getcNum() {
		return cNum;
	}

	public String getcType() {
		return cType;
	}

	public String getDate() {
		return date;
	}

	public String getcHName() {
		return cHName;
	}

	public String getCvv() {
		return cvv;
	}

    
}
