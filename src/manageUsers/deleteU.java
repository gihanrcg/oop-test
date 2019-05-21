package manageUsers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnect;

/**
 * Servlet implementation class deleteU
 */
@WebServlet("/deleteU")
public class deleteU extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public deleteU() {
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
		// delete user from database

		String id = request.getParameter("id");

		DBConnect db = new DBConnect();
		try {
			db.st.executeUpdate("delete from user where userId = '" + id + "'");
			response.sendRedirect("adminPanel.jsp");

		} catch (Exception e) {

		}

		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
