package manageRequest;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class addwanted
 */
@WebServlet("/addwanted")
public class addwanted extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public addwanted() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("served at:").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			
			//retriving values from the jsp file
			
			String uid = request.getParameter("user");
			String proptype  = request.getParameter("property");
			String description = request.getParameter("description");
			String budget = request.getParameter("budget");
			String location = request.getParameter("Location");
			String contact = request.getParameter("Contact");
	
			
			
			if(proptype == "" || description == "" || budget == "" || location =="" || contact == "") //validate the null values
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("addRequest.jsp");
			}			
			else if( contact.length() != 10){ // validate the phone number
				
				JOptionPane.showMessageDialog(null, "Invalid Phone Number!");
				response.sendRedirect("addRequest.jsp");
			
			}
			else if( !contact.matches("^[0-9]+$")|| !budget.matches("^[0-9.9]+$")){ //validate the phone number and budget
				
				JOptionPane.showMessageDialog(null, "Invalid !");
				response.sendRedirect("addRequest.jsp");
			}
			else
			{   
				// insert values into the database
				
				DBConnect db = new DBConnect();
				db.st.executeUpdate("INSERT INTO `request`(`name`,`description`,`price`,`location`,`contact`,`userId`)VALUES('"+proptype+"','"+description+"','"+budget+"','"+location+"','"+contact+"','"+uid+"')");
				
				JOptionPane.showMessageDialog(null, "Data inserted successfully...");
				response.sendRedirect("viewRequests.jsp");
			}
			
		}
		catch(Exception e){
				System.out.println(e.toString());
		}
		
		doGet(request, response);
		
	}
}


