<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*" session="true" errorPage="error.jsp"%>


<%! 
     Connection con = null;
     
     //create new user
     private boolean createUser(String userName, String password){
    	 try{
         String sql = "insert into users values (?,?)";
             PreparedStatement ps = con.prepareStatement(sql);
             ps.setString(1, userName);
             ps.setString(2, password);
             int result = ps.executeUpdate();
             System.out.println("Statement Executed..");
             if(result > 0) {
                 return true;
             }
    	 }
    	 catch(Exception ex){
    		 ex.printStackTrace();
    	 }
             
   		return false;
             
     }
%>     
   

<%
   //read username and password
   String userName = request.getParameter("userName");
   String password = request.getParameter("password");
   

  	String driverClass = application.getInitParameter("dbDriver");
    String url = application.getInitParameter("dbUrl");
    String dbUserName = application.getInitParameter("dbUser");
    String dbPassword = application.getInitParameter("dbPwd");
    
    try {
    	Class.forName(driverClass);
        }catch(Exception ex) {
    	    ex.printStackTrace();
        }
   
    con = DriverManager.getConnection(url, dbUserName, dbPassword);
    System.out.println("Connection Established..");

    //keeping it in application scope, so that it will available for other jsp pages
    application.setAttribute("connection",con);
	    
   // if (isUserNameExists(userName) == false) {	
    boolean authFlag = createUser(userName, password);
   
    System.out.println("User name :" + userName + "\nPassword :" + password + "\nauth Flag : " + authFlag);
    if (authFlag) {
       response.sendRedirect("login.jsp");
   } else {
       response.sendRedirect("error.jsp");
   }
   
%>   
   
   
   