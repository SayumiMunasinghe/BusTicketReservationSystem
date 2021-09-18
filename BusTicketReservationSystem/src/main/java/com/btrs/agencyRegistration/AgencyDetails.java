package com.btrs.agencyRegistration;

public class AgencyDetails {
	private int agentID;
	private String agentNIC;
	private String agentName;
	private String companyName;
	private String agentPhone;
	private String agentEmail;
	private String agencyLocation;
	private String password;
	private String confirmPassword;
	private String username;
	
	public AgencyDetails(int agentID, String agentNIC, String agentName, String companyName, String agentPhone,
			String agentEmail, String agencyLocation, String password, String confirmPassword, String username) {
		super();
		this.agentID = agentID;
		this.agentNIC = agentNIC;
		this.agentName = agentName;
		this.companyName = companyName;
		this.agentPhone = agentPhone;
		this.agentEmail = agentEmail;
		this.agencyLocation = agencyLocation;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.username = username;
	}

	public int getAgentID() {
		return agentID;
	}

	public String getAgentNIC() {
		return agentNIC;
	}

	public String getAgentName() {
		return agentName;
	}

	public String getCompanyName() {
		return companyName;
	}

	public String getAgentPhone() {
		return agentPhone;
	}
	
	public String getAgentEmail() {
		return agentEmail;
	}

	public String getAgencyLocation() {
		return agencyLocation;
	}

	public String getPassword() {
		return password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public String getUsername() {
		return username;
	}



	
	
}
