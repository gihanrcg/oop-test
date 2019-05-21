package manageUsers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class adUpdate
 */
@WebServlet("/adUpdate")
public class adUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public adUpdate() {
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
		try {
			// getting values

			String type = request.getParameter("type");
			String id = request.getParameter("id");

			// updating user type

			if (type.equals("admin") || type.equals("user")) {
				DBConnect db = new DBConnect();
				db.st.executeUpdate("UPDATE user set type='" + type + "' where userId = '" + id + "'");
				JOptionPane.showMessageDialog(null, "Data Updated Successfully!");
				response.sendRedirect("adminPanel.jsp");
			} else {
				JOptionPane.showMessageDialog(null, "Invalid Input");
				response.sendRedirect("adminUpdate.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		doGet(request, response);
	}

}
