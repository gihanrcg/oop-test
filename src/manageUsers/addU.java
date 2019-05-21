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
 * Servlet implementation class addU
 */
@WebServlet("/addU")
public class addU extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addU() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{	
		try
		{
			//getting values
			
			String uName = request.getParameter("name");
			String uMail = request.getParameter("mail");
			String uPhone = request.getParameter("phoneNumber");
			String uPass = request.getParameter("password");
			String confirmPass = request.getParameter("cPassword");
			
			//validation
			
			if(uName == "" || uMail == "" || uPhone == "" || uPass == "" || confirmPass == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("register.jsp");
			}
			else if(!confirmPass.equals(uPass))
			{
				JOptionPane.showMessageDialog(null, "Confirm password should be equal to password...");
				response.sendRedirect("register.jsp");
			}			
			else
			{
				DBConnect db = new DBConnect();
				db.st.executeUpdate("INSERT INTO user(name,phone,password,email)VALUES('"+uName+"','"+uPhone+"','"+uPass+"','"+uMail+"')");
				JOptionPane.showMessageDialog(null, "Successfully Registered");
				response.sendRedirect("Home.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		doGet(request, response);
	}

}
