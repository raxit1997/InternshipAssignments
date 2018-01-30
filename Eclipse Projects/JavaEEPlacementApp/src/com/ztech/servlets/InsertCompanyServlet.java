package com.ztech.servlets;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ztech.delegates.AdminDelegator;

@WebServlet("/InsertCompanyServlet")
public class InsertCompanyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Logger logger = Logger.getLogger(InsertCompanyServlet.class.getName());

	public InsertCompanyServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd;
		try {
			String companyName = request.getParameter("companyName");
			if (companyName.equals("")) {
				request.setAttribute("responseMessage", "Enter all the fields");
				return;
			}
			int companyid = Integer.parseInt(request.getParameter("companyid"));
			int arrearCriteria = Integer.parseInt(request.getParameter("arrearCriteria"));
			float cgpaCriteria = Float.parseFloat(request.getParameter("cgpaCriteria"));
			String companyPassword = request.getParameter("companyPassword");
			AdminDelegator adminDelegator = new AdminDelegator();
			String responseMessage = adminDelegator.insertCompanyDetails(companyid, companyName, arrearCriteria,
					cgpaCriteria, companyPassword);
			if (!responseMessage.equals("")) {
				request.setAttribute("responseMessage", "The company details are inserted.");
			} else {
				request.setAttribute("responseMessage", responseMessage);
			}
			rd = request.getRequestDispatcher("./pages/insert-company.jsp");
			rd.forward(request, response);
		} catch (NumberFormatException e) {
			logger.warning("The details entered are of different format.");
			request.setAttribute("responseMessage", "Enter the details properly.");
			rd = request.getRequestDispatcher("./pages/insert-company.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
