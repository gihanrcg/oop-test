package managePayment;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import util.DBConnect;

/**
 * Servlet implementation class UpdateCard
 */
@WebServlet("/UpdateCard")
public class UpdateCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCard() {
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
		
		try
		{
			//assign form data to variables
			String pid = request.getParameter("id");
			String cardType = request.getParameter("cardType");
			String cardNo = request.getParameter("cardNumber"); 
			String expMonth = request.getParameter("expMonth");
			String expYear = request.getParameter("expYear");
			String cvv = request.getParameter("securityCode");
			String aid = request.getParameter("aid");
			
			if(cardType == "" || cardNo == "" || expMonth == "" || expYear == "" || cvv == "")	//validate null values
			{
				JOptionPane.showMessageDialog(null, "Please fill all the fields");
				response.sendRedirect("updateCard.jsp?p="+pid+"");
			}
			else if(!cardNo.matches("^[0-9]+$") || cardNo.length() != 16 ){		//validate card number
				
				JOptionPane.showMessageDialog(null, "Invalid Card Number!");
				response.sendRedirect("updateCard.jsp?p="+pid+"");
			
			}
			else if(!cardNo.startsWith("4") && cardType.equals("Visa") ){	//validate card type
				
				JOptionPane.showMessageDialog(null, "Invalid Card Type!");
				response.sendRedirect("updateCard.jsp?p="+pid+"");
			
			}
			else if(!cardNo.startsWith("5") && cardType.equals("Master") ){		//validate card type
				
				JOptionPane.showMessageDialog(null, "Invalid Card Type!");
				response.sendRedirect("updateCard.jsp?p="+pid+"");
			
			}
			else if(!cvv.matches("^[0-9]+$") || cvv.length() != 3 ){	//validate security code
				
				JOptionPane.showMessageDialog(null, "Invalid CVV!");
				response.sendRedirect("updateCard.jsp?p="+pid+"");
			}
			else
			{
				DBConnect db = new DBConnect();
				db.st.executeUpdate("UPDATE paymentmethod set cardType='"+cardType+"',cardNumber='"+cardNo+"',expMonth='"+expMonth+"',expYear='"+expYear+"', secCode='"+cvv+"' where pmId='"+pid+"'");
				JOptionPane.showMessageDialog(null, "Card Details Updated Successfully!");
				response.sendRedirect("PaymentMethods.jsp?aid="+aid+"");
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}

		
		
		doGet(request, response);
	}

}
