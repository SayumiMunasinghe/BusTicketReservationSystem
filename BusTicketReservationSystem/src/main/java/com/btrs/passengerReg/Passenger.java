package com.btrs.passengerReg;

public class Passenger{
	private int pid;
	private String fName;
	private String lName;
	private String email;
	private String password;
	private String telno;
	
	public Passenger(int pid, String fName, String lName, String email, String password, String telno) {
		this.pid = pid;
		this.fName = fName;
		this.lName = lName;
		this.email = email;
		this.password = password;
		this.telno = telno;
	}

	public int getPid() {
		return pid;
	}

	public String getfName() {
		return fName;
	}

	public String getlName() {
		return lName;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public String getTelno() {
		return telno;
	}

}
