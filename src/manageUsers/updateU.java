package manageUsers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class updateU
 */
@WebServlet("/updateU")
public class updateU extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public updateU() {
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
			// getting values from profile page

			String uName = request.getParameter("name");
			String uPhone = request.getParameter("phoneNumber");
			String uPass = request.getParameter("password");
			String uId = request.getParameter("id");

			// validating new values

			if (uName == "" || uPhone == "" || uPass == "") {
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("profile.jsp");
			} else if (!uPhone.matches("^[0-9]+$") || uPhone.length() != 10) {
				JOptionPane.showMessageDialog(null, "Entered Number is Invalid ");
				response.sendRedirect("profile.jsp");
			} else if (!uPass.matches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}") || uPass.length() < 8) {
				JOptionPane.showMessageDialog(null, "Entered Password is Invalid ");
				response.sendRedirect("profile.jsp");
			} else {
				DBConnect db = new DBConnect();
				db.st.executeUpdate("UPDATE user set name='" + uName + "',phone='" + uPhone + "',password='" + uPass
						+ "' where userId='" + uId + "'");
				JOptionPane.showMessageDialog(null, "Data Updated successfully...");
				response.sendRedirect("profile.jsp");
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		doGet(request, response);
	}
}
