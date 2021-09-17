package Homepage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SelectBusServlet")
public class SelectBusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String arrival = request.getParameter("arrival");
		String departure = request.getParameter("departure");

		try {
			List<BusDetails> busDetails = BusDBUtil.sendDetails(arrival, departure);
			request.setAttribute("busDetails", busDetails);
		} catch (Exception e) {
			e.printStackTrace();
		}
		RequestDispatcher dis = request.getRequestDispatcher("availableBuses.jsp");
		dis.forward(request, response);
	}

}
