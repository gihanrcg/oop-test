package manageAdvertisement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnect;





/**
 * Servlet implementation class deletead
 */
@WebServlet("/deletead")
public class deletead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deletead() {
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
		
	
		String id = request.getParameter("id"); //getting the advertisement id
		
		
		try {
			
			DBConnect db = new DBConnect(); //database connection
			//delete query to delete data 
			db.st.executeUpdate("delete from advertisement where adId= '"+id+"'"); 
			
			
			if(request.getParameter("mad").equals("admin")) {
				response.sendRedirect("manageAllAds.jsp");
			}else if(request.getParameter("mad").equals("user")) {
				response.sendRedirect("viewads.jsp");
			}
			
		}
		catch(Exception e) {
		       
	    }
		
		
		doGet(request, response);
	}
}
