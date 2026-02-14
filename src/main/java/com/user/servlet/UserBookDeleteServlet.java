package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

@WebServlet("/userBookDelete")
public class UserBookDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int bid = Integer.parseInt(req.getParameter("bid"));
			String email = req.getParameter("email");
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.userBookDelete(email, bid);
			
			HttpSession session = req.getSession();
			if (f) {
				session.setAttribute("succMsg", "Book Deleted Successfully");
				resp.sendRedirect("oldBook.jsp");
			} else {
				session.setAttribute("failMsg", "Something went wrong");
				resp.sendRedirect("oldBook.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
