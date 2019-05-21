package manageAdvertisement;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;
import util.DBConnect;

/**
 * Servlet implementation class updateadd
 */
@WebServlet("/updateadd")
public class updateadd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateadd() {
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
		
		try
		{
			//retrieve data from update jsp file
			String propName = request.getParameter("Property Name");   
			String propLoc  = request.getParameter("Property loc");
			String propSize  = request.getParameter("psize");
			String propPrice = request.getParameter("Sale price");
			String propId = request.getParameter("id");
			String image = request.getParameter("image");
			String unit = request.getParameter("unit");
			String contact = request.getParameter("contactNo");
			String description = request.getParameter("description");
			
			
			if( propName== "" ||  propLoc== "" || propSize == "" || propPrice == "" || contact == "" || description == "")
			{
			
				response.sendRedirect("update.jsp?x="+propId+"");
            }
			else if(!propName.matches("[a-zA-Z]+")) {
				
				JOptionPane.showMessageDialog(null,"Invalid property Name");
				response.sendRedirect("update.jsp?x="+propId+"");
			}
			else if(!propLoc.matches("[a-zA-Z]+")) {
				
				JOptionPane.showMessageDialog(null,"Invalid property location");
				response.sendRedirect("update.jsp?x="+propId+"");
				
			}
			else if(!propSize.matches("^[0-9.9]+")) {
				
				JOptionPane.showMessageDialog(null,"Invalid property size");
				response.sendRedirect("update.jsp?x="+propId+"");
				
			}
			else if(!propPrice.matches("^[0-9.9]+")) {
				
				JOptionPane.showMessageDialog(null,"Invalid property price");
				response.sendRedirect("update.jsp?x="+propId+"");
			}
			else if(!contact.matches("^[0-9]+") ||  contact.length() != 10) {
				
				JOptionPane.showMessageDialog(null,"Invalid contact number");
				response.sendRedirect("update.jsp?x="+propId+"");
			}
			else
			{
				DBConnect db = new DBConnect();  
				//update query to update data
				db.st.executeUpdate("UPDATE advertisement set name='"+propName+"',location ='"+propLoc+"',size='"+propSize+"',unit='"+unit+"',price='"+propPrice+"',image='"+image+"',contact='"+contact+"',description='"+description+"' where adId='"+propId+"'");

		        response.sendRedirect("viewads.jsp");
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		doGet(request, response);
	}

}
