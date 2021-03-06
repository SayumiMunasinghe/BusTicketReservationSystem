package com.btrs.agencyRegistration;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ManageAgencyDetailsServlet")
public class ManageAgencyDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AgencyDatabaseUtil objectName = new AgencyDatabaseUtil();
		
//INSERTING AGENCY DATA TO DATABASE
	    if(request.getParameter("insertDetails") != null) {
			String agentNIC = request.getParameter("agentNIC");
			String agentName = request.getParameter("agentName");
			String companyName = request.getParameter("companyName");
			String agentPhone = request.getParameter("agentPhone");
			String agentEmail = request.getParameter("agentEmail");
			String agencyLocation = request.getParameter("agencyLocation");
			String password = request.getParameter("password");
			String username = request.getParameter("userName");
		
			String status = objectName.insertAgencyDetails(agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, password, username);
			if (status == "1") {
				RequestDispatcher d1 = request.getRequestDispatcher("AgencySuccess.jsp");
				d1.forward(request, response);
			} else if (status == "0"){
				RequestDispatcher d2 = request.getRequestDispatcher("result2.jsp");
				d2.forward(request, response);
			} else if (status == "username"){
				String popup = "1";
				request.setAttribute("popup", popup);
				RequestDispatcher d3 = request.getRequestDispatcher("agencyRegistration.jsp");
				d3.forward(request, response);
			}else if (status == "email"){
				String popup = "2";
				request.setAttribute("popup", popup);
				RequestDispatcher d5 = request.getRequestDispatcher("agencyRegistration.jsp");
				d5.forward(request, response);
	 		}
	    }
		
//VIEWING AGENCY DATA FROM DATABASE
		if(request.getParameter("viewDetails") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			if(userID == -1) {
				String popup = "1";
				request.setAttribute("popup1", popup);
				RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
				d6.forward(request, response);
			}
			try {
				List<AgencyDetails> agencyListDetails = objectName.viewAgencyData(userID);
				request.setAttribute("agencyListDetails", agencyListDetails);	
				String loadOne = "1";
				request.setAttribute("loadOne", loadOne);
				boolean ans = agencyListDetails.isEmpty();
				if (ans == true) {
					String popup = "1";
					request.setAttribute("popup1", popup);
					RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
					d6.forward(request, response);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			String showTable1 = "1";
			request.setAttribute("showTable1", showTable1);
			String showTable2 = "0";
			request.setAttribute("showTable2", showTable2);
			RequestDispatcher d6 = request.getRequestDispatcher("viewAgencyDetails.jsp");
			d6.forward(request, response);
		}
		
//UPDATING AGENCY DATA ON DATABASE
		if(request.getParameter("updateDetails") != null) {
			String agentNIC = request.getParameter("agentNIC");
			String agentName = request.getParameter("agentName");
			String companyName = request.getParameter("companyName");
			String agentPhone = request.getParameter("agentPhone");
			String agentEmail = request.getParameter("agentEmail");
			String agencyLocation = request.getParameter("agencyLocation");
			String password = request.getParameter("password");
			String username = request.getParameter("userName");
			
			HttpSession session = request.getSession();
			int userID = (int)session.getAttribute("userID");
			objectName.UpdateAgencyDetails(userID ,agentNIC, agentName, companyName, agentPhone, agentEmail, agencyLocation, password, username);
			String updateSuccess = "1";
			request.setAttribute("updateSuccess", updateSuccess);
			RequestDispatcher d7 = request.getRequestDispatcher("AgencySuccess.jsp");
			d7.forward(request, response);
		}
		
//DELETING AGENCY DATA FROM DATABASE
		if(request.getParameter("deleteDetails") != null) {
			HttpSession session = request.getSession();
			int userID = (int) session.getAttribute("userID");
			objectName.DeleteAgencyDetails(userID);
			session.removeAttribute("userID");
			session.removeAttribute("mode");
			String deleteSuccess = "1";
			request.setAttribute("deleteSuccess", deleteSuccess);
			RequestDispatcher d7 = request.getRequestDispatcher("AgencySuccess.jsp");
			d7.forward(request, response);
		}	
	}
}


