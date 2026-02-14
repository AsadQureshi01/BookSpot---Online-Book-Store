package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;
@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("fname");
			String email = req.getParameter("email");
			String phno = req.getParameter("phno");
			String password = req.getParameter("password");
			
			User us = new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			HttpSession session = req.getSession();
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f = dao.checkPassword(id, password);
			if (f) {
				boolean f2 = dao.updateProfile(us);
				if (f2) {
					session.setAttribute("successMsg", "Profile Updated");
					resp.sendRedirect("editProfile.jsp");
					//System.out.println("User registration success");
				} else {
					//System.out.println("failed");
					session.setAttribute("failedMsg", "Something went wrong");
					resp.sendRedirect("editProfile.jsp");
				}
			} else {
				session.setAttribute("failedMsg", "Password is incorrect");
				resp.sendRedirect("editProfile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
