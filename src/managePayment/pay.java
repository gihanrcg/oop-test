package managePayment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DBConnect;

/**
 * Servlet implementation class pay
 */
@WebServlet("/pay")
public class pay extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pay() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		try {
			
			//retrieve payment method ID, ad ID, user ID, price
			String pid = request.getParameter("id");
			String aid = request.getParameter("aid");
			String uid = request.getParameter("uid");
			String price = request.getParameter("price");

			DBConnect db = new DBConnect();
			
			//Insert query 
			db.st.executeUpdate("INSERT INTO `payment`(`amount`,`userId`,`adId`,`pmId`) VALUES('" + price + "','" + uid + "','" + aid + "','" + pid + "')");
			//update query
			db.st.executeUpdate("update advertisement set payment = 'paid' where adId = '" + aid + "'");
			response.sendRedirect("viewBill.jsp?aid=" + aid + "");

		} catch (Exception e) {
			System.out.println(e.toString());
		}

		doGet(request, response);
	}

}
