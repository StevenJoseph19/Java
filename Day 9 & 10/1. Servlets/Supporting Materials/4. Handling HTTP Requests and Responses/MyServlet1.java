package com.godrej.demos;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class MyServlet1 extends GenericServlet {

	public void service(ServletRequest request, ServletResponse response) throws

	ServletException, IOException {

//Creating an object of RequestDispatcher to forward the request to another servlet named -SecondServlet
		RequestDispatcher reqDispatch = request.getRequestDispatcher("SecondServlet");

//Using RequestDispatcher forward() method to forward the current request and response to another Servlet.
//		reqDispatch.forward(request, response);

		// Using RequestDispatcher include() method to include the content of another
		// Servlet in this Servlet.
		reqDispatch.include(request, response);

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

//Reading and printing all the parameters of this Servlet
		out.println("</b> Reading all the parameter and their values </b>  <br/>");
		Enumeration enum1 = getInitParameterNames();
		while (enum1.hasMoreElements()) {
			String paramName = (String) enum1.nextElement();
			String paramValue = getInitParameter(paramName);
			out.println("Parameter " + paramName + " has a value " + paramValue);
			out.println("<br/>");
		}
	}
}