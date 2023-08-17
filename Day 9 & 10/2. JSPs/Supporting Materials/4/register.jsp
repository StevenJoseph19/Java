<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LearnToday - Registration Form</title>
</head>
<body>


<div class="container">
<header>
<%@ include file="header.jsp" %>
</header>

<article>
<h1 class="page-header">Registration Form</h1>
<form name="registrationForm" class="form-horizontal" action="registerUser.jsp" method="post">

<div class="form-group">
<label class="col-md-2 control-label">User name :</label>
<div class="col-md-4">
<input type="text" class="form-control" name="userName" required/> 
</div>
</div>

<div class="form-group">
<label class="col-md-2 control-label">Password :</label>
<div class="col-md-4">
<input type="password" class="form-control" name="password" required/> 
</div>
</div>

<div class="form-group">
<div class="col-md-4 col-md-offset-2">
<input type="submit" name="btnRegister" value="Register" class="btn btn-primary"/>
</div>
</div>

<%
   String username_error = (String)request.getAttribute("userName");
   if (username_error==null) {
   	username_error="";
   }
%>

<div class="row">
<div class="col-md-4 col-md-offset-2">
<p class="text-danger"><%=username_error%> </p>
</div>
</div>

</form>
</article>

<footer>
<%@ include file="footer.jsp" %>
</footer>
</div>
</body>
</html>