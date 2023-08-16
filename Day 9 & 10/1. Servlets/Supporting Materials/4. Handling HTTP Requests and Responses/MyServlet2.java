package com.godrej.demos;

import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.io.*;

public class MyServlet2 extends GenericServlet {

	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<h2>Using RequestDispatcher object</h2>");
		out.println("Executing the second servlet <br/> <br/>");

//Reading and printing all the parameters of this Servlet
		out.println("</b> Reading all the parameter and their values </b>  <br/>");
		Enumeration enum1 = getInitParameterNames();
		while (enum1.hasMoreElements()) {
			String paramName = (String) enum1.nextElement();
			String paramValue = getInitParameter(paramName);
			out.println("Parameter " + paramName + " has a value " + paramValue);
			out.println("<br/>");
		}
		out.println("<br/>");
	}
}