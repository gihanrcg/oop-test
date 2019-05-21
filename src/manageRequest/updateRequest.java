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
 * Servlet implementation class addUpdate
 */
@WebServlet("/addUpdate")
public class updateRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateRequest() {
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try { 
			String rId  = request.getParameter("rId");
			String proptype  = request.getParameter("property");
			String description = request.getParameter("description");
			String budget = request.getParameter("budget");
			String location = request.getParameter("Location");
			String contact = request.getParameter("Contact");
			
			
			if(proptype == "" || description == "" || budget == "" || location =="" || contact == "")
			{
				JOptionPane.showMessageDialog(null, "You need to fill all the fields..");
				response.sendRedirect("updateRequest.jsp?u=+"+rId+"");
			}			
			else if( contact.length() != 10){
				
				JOptionPane.showMessageDialog(null, "Invalid Phone Number!");
				response.sendRedirect("updateRequest.jsp?u=+"+rId+"" );
			
			}
			else if( !contact.matches("^[0-9]+$")|| !budget.matches("^[0-9]+$")){
				
				JOptionPane.showMessageDialog(null, "Invalid !");
				response.sendRedirect("updateRequest.jsp?u=+"+rId+"");
			
			}
			else
			{
				DBConnect db = new DBConnect();
				db.st.executeUpdate("UPDATE request set name='"+proptype+"',description='"+description+"',price='"+budget+"',location='"+location+"',contact='"+contact+"'where rId = '"+rId+"'");
				
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
