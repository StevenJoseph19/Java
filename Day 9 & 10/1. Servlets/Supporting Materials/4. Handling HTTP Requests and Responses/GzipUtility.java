package com.godrej.demos;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.zip.GZIPOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GzipUtility {

	public static boolean isGzipSupported(HttpServletRequest request)
	{
			String encodings = request.getHeader("Accept-Encoding");
			return (encodings != null ) &&(encodings.contains("gzip"));
	}
		
	public static boolean isGzipDisabled(HttpServletRequest request)
	{
			String flag = request.getParameter("disableGzip");
			return (( flag!=null) && (!flag.equalsIgnoreCase("false")));
	} 
		

	public static PrintWriter getGzipWriter(HttpServletResponse response) throws IOException
	{
			return (new PrintWriter(new GZIPOutputStream(response.getOutputStream())));
	}
	
}
