package manageAdvertisement;

import util.DBConnect;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;




/**
 * Servlet implementation class addprop
 */
@WebServlet("/addprop")
@MultipartConfig(maxFileSize = 16177215)
public class addprop extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addprop() {
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
			
			
			//retrieving data from the jsp file
			String uid = request.getParameter("user");
			String propName = request.getParameter("PropertyName");
			String propLoc  = request.getParameter("PropertyLoc");
			String propSize  = request.getParameter("psize");
			String propPrice = request.getParameter("SalePrice");
			String image = request.getParameter("image");
			String unit = request.getParameter("unit");
			String contact = request.getParameter("contactNo");
			String description = request.getParameter("description");
			
		    //validation
			
			if(propName == "" || propLoc == "" || propSize == "" || propPrice == "" || contact == "" || description == "")   //validate null values
			{
				JOptionPane.showMessageDialog(null,"Please fill all the fields");
				response.sendRedirect("Add.jsp");
			
			}
			else if(!propName.matches("[a-zA-Z]+")) {       //validate property name
				
				JOptionPane.showMessageDialog(null,"Invalid property Name");
				response.sendRedirect("Add.jsp");
			}
			else if(!propLoc.matches("[a-zA-Z]+")) {        //validate property location
				
				JOptionPane.showMessageDialog(null,"Invalid property location");
				response.sendRedirect("Add.jsp");
				
			}
			else if(!propSize.matches("^[0-9.9]+")) {        //validate property size
				
				JOptionPane.showMessageDialog(null,"Invalid property size");
				response.sendRedirect("Add.jsp");
				
			}
			else if(!propPrice.matches("^[0-9.9]+")) {       //validate property price
				
				JOptionPane.showMessageDialog(null,"Invalid property price");
				response.sendRedirect("Add.jsp");
			}
			else if(!contact.matches("^[0-9]+") ||  contact.length() != 10) {   //validate phone number
				
				JOptionPane.showMessageDialog(null,"Invalid contact number");
				response.sendRedirect("Add.jsp");
			}
			else {
			    DBConnect db = new DBConnect();
			    //insert query to insert data into the database
			    db.st.executeUpdate("INSERT INTO `advertisement`(`name`,`location`,`size`,`unit`,`price`,`userId`,`image`,`contact`,`description`) VALUES ('"+propName+"','" +propLoc+"','"+propSize+"','"+unit+"','"+propPrice+"','"+uid+"','"+image+"','"+contact+"','"+description+"')");
			    response.sendRedirect("Payment.jsp");
			}
			   
		    
		   
		   }
		catch(Exception e) {
		       System.out.println(e.toString());
		       
	    }
		
		
		
		doGet(request, response);
	}

}
