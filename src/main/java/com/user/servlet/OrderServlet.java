package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.Book_Order;
import com.entity.Cart;
import com.entity.User;


@WebServlet("/order")

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
			
		HttpSession session = request.getSession();
			
		int id = Integer.parseInt(request.getParameter("id"));
		
		String name = request.getParameter("username");
		String email = request.getParameter("email");
		String phno = request.getParameter("phno");
		
		String address = request.getParameter("address");
		String landmark = request.getParameter("landmark");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String paymentType = request.getParameter("payment");
		String fullAdd = address+","+landmark+","+city+","+state+","+pincode;
		CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
		List<Cart> blist = dao.getBookByUser(id);
		
		BookOrderImpl dao2 = new BookOrderImpl(DBConnect.getConn());
		int i = dao2.getOrderNo();
		Book_Order o = null;
		
		ArrayList<Book_Order> orderlist = new ArrayList<Book_Order>();
		for (Cart c: blist) {
			o = new Book_Order();
			o.setOrderId("BOOK-ORD-00"+i);
			o.setUserName(name);
			o.setEmail(email);
			o.setPhno(phno);
			o.setFulladd(fullAdd);
			o.setBookName(c.getBookName());
			o.setAuthor(c.getAuthor());
			o.setPrice(c.getPrice()+"");
			o.setPaymentType(paymentType);
			orderlist.add(o);
			i++;
			
		}
		
		if("Select".equals(paymentType)){
			session.setAttribute("failedMsg","Choose Payment Method");
			response.sendRedirect("cart.jsp");
		} else if ("Online Payment".equals(paymentType)) {
			response.sendRedirect("online_order.jsp");
		}else {
		
			boolean f =dao2.saveOrder(orderlist);
			
			if(f) 
			{
				response.sendRedirect("order_success.jsp");
			}
			else
			{
				session.setAttribute("failedMsg","your order failed");
				response.sendRedirect("cart.jsp");
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		




	}

}
