package manageUsers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class loginVal
 */
@WebServlet("/loginVal")
public class loginVal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginVal() {
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
			// getting login values

			String lMail = request.getParameter("uname");
			String lPass = request.getParameter("pass");
			String password = null;
			String type = null;
			String name = null;
			String email = null;
			String userId = null;

			DBConnect dbPass = new DBConnect();
			dbPass.rs = dbPass.st.executeQuery("select * from user where email='" + lMail + "'  ");

			// validate login and checking the user level

			if (!dbPass.rs.next()) {
				JOptionPane.showMessageDialog(null, "Please Enter your Email");
				response.sendRedirect("login.jsp");
			} else {
				do {
					password = dbPass.rs.getString("password");
					type = dbPass.rs.getString("type");
					name = dbPass.rs.getString("name");
					email = dbPass.rs.getString("email");
					userId = dbPass.rs.getString("userId");

				} while (dbPass.rs.next());

				if (password.equals(lPass)) {
					if (type.equals("admin")) {
						HttpSession session = request.getSession();
						session.setAttribute("name", name);
						session.setAttribute("type", type);
						session.setAttribute("email", email);
						session.setAttribute("userId", userId);
						response.sendRedirect("adminPanel.jsp");
					} else {
						HttpSession session = request.getSession();
						session.setAttribute("name", name);
						session.setAttribute("type", type);
						session.setAttribute("email", email);
						session.setAttribute("userId", userId);
						response.sendRedirect("Home.jsp");
					}
				} else {
					JOptionPane.showMessageDialog(null, "Entered Password is incorrect");
					response.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		doGet(request, response);
	}

}
