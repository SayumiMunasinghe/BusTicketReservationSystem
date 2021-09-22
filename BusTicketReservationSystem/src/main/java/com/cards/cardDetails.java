package com.cards;

public class cardDetails {
    private int id;
    private String cNum;
    private String cType;
    private String date;
    private String cHName;
    private String cvv;
    
	public cardDetails(int id, String cNum, String cType, String date, String cHName, String cvv) {
		this.id = id;
		this.cNum = cNum;
		this.cType = cType;
		this.date = date;
		this.cHName = cHName;
		this.cvv = cvv;
	}

	public int getId() {
		return id;
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
