package com.user.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.*;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.User;
import com.mysql.cj.Session;
import com.razorpay.*;

/**
 * Servlet implementation class OrderCreation
 */
public class OrderCreation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrderCreation() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RazorpayClient client = null;
		String orderId = null;
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("userObj");
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		List<Cart> cart = dao.getBookByUser(u.getId());
		double totalPrice = 0;
		for (Cart c : cart) {
			totalPrice = c.getTotal_price();
		}

		try {
			client = new RazorpayClient("rzp_test_mpoXI0kSCNDKuU", "xIrR8G31eZtYzdC6EzGfz86s");
			JSONObject options = new JSONObject();
			options.put("amount", totalPrice * 100); // amount in the smallest currency unit
			options.put("currency", "INR");
			options.put("receipt", "order_rcptid_11");
			options.put("payment_capture", true);

			Order order = client.Orders.create(options);
			orderId = order.get("id");

		} catch (Exception e) {
			e.printStackTrace();
		}
		response.getWriter().append(orderId);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RazorpayClient client = null;

		try {
			client = new RazorpayClient("rzp_test_mpoXI0kSCNDKuU", "xIrR8G31eZtYzdC6EzGfz86s");
			JSONObject options = new JSONObject();
			options.put("razorpay_payment_id", request.getParameter("razorpay_payment_id")); // amount in the smallest
																								// currency unit
			options.put("razorpay_order_id", request.getParameter("razorpay_order_id"));
			options.put("razorpay_signature", request.getParameter("razorpay_signature"));
			boolean SigRes = Utils.verifyPaymentSignature(options, "Secret");
			if (SigRes) {
				response.getWriter().append("SUCCESS");

			} else {
				response.getWriter().append("FAIL");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
