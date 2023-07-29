<%@ page language="java" session="true" import="java.sql.*, java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Learntoday - All Courses</title>
</head>
<body>
<div class="container">
<header>
<jsp:include page="header.jsp" flush="true" />
</header>

<article>
<jsp:scriptlet>
  List courseList = new ArrayList();
 // String user = (String)session.getAttribute("user");
 // String message = "Welcome "+user+" !";
  Connection con = (Connection) application.getAttribute("connection");
  String sql = "select CourseTitle from course";
  Statement stmt = con.createStatement();
  ResultSet rs = stmt.executeQuery(sql);
  while(rs.next()) {
	  System.out.println("adding : " + rs.getString(1));
      courseList.add(rs.getString(1));
  }
  
</jsp:scriptlet>  
<form action="findCourse.jsp">
<table>
<% 
    for(int index=0; index< courseList.size();index++) 
    {
       String course = (String) courseList.get(index);
       System.out.println("Course Name : " + course);
%>    

               <tr>
                   <td> <jsp:text><![CDATA[<input type="radio" name="courseName" value="]]>
                        </jsp:text>
                                <jsp:expression>course</jsp:expression>
                        <jsp:text><![CDATA[">]]></jsp:text>  
                        <jsp:expression>course</jsp:expression>
                   </td>
               </tr>
<jsp:scriptlet>    
    }
</jsp:scriptlet>  
               <tr>
                  <td> <input type="submit" name="submit" value="Get Details"/></td>
               </tr>
           </table>
        </form>
 
       

</article>

<footer>
<jsp:include page="footer.jsp" flush="true" />
</footer>
</div>
</body>
</html>