package manageRequest;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.DBConnect;

/**
 * Servlet implementation class deleteRequest
 */
@WebServlet("/deleteRequest")
public class deleteRequest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteRequest() {
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
		
			String rId = request.getParameter("rId"); // assign the request iD from jsp
				
		try{
			
			DBConnect db = new DBConnect();
			
			//delete the request from database
			db.st.executeUpdate("delete from request where rId = '"+rId+"' ");
			

			if(request.getParameter("mr").equals("admin")) {
				response.sendRedirect("manageAllRequests.jsp");
			}else if(request.getParameter("mr").equals("user")) {
				response.sendRedirect("viewRequests.jsp");
			}
			
			
		}
		catch(Exception e){
			
		}
		
		
		
		
		doGet(request, response);
	}

}
