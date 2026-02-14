package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

@WebServlet("/removeBook")
public class RemoveBookCart extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int cid = Integer.parseInt(req.getParameter("cid"));
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBook(cid);
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("successMsg", "Book removed from cart");
				resp.sendRedirect("cart.jsp");
			} else {
				
				session.setAttribute("failedMsg", "Something went wrong");
				resp.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			
		}
	}
	

}
