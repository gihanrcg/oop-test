package managePayment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnect;

/**
 * Servlet implementation class deleteCard
 */
@WebServlet("/deleteCard")
public class deleteCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCard() {
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
		
		//retrieving payment method ID and Ad ID
		String pid = request.getParameter("id");
		String aid = request.getParameter("aid");
		
						
		try{
			DBConnect db = new DBConnect();
			
			//delete query to delete payment method
			db.st.executeUpdate("delete from paymentmethod where pmId = '"+pid+"' ");
			response.sendRedirect("PaymentMethods.jsp?aid="+aid+"");
			
		}
		catch(Exception e){
			
		}
		
		doGet(request, response);
	}

}
