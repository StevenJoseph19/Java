<%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LearnToday-Way To Success</title>
</head>
<body>
<div class="container">
<header>
<%@ include file="header.jsp" %>
</header>
<article>
<div class="row">
<div class="jumbotron">
	<h1 class="text-center">Enter to Learn and Exit to Earn</h1>
	<p class="text-center">Our Expertise empower you to achieve your goals and achieve success. </p>
<div class="row">

	<center>
		<form class="form-inline" action="findCourse.jsp">
			<div class="form-group">
				<label class="control-label">Search Course</label>
				<input type="search" class="form-control" name="courseName" placeholder="Enter Course Title" />
				<input type="submit" class="btn btn-primary" value="Search" />
			</div>
		</form>
	</center>
</div>
<br/>
<p class="text-center"><a href="courses.jsp" class="btn btn-lg btn-success">View All Courses</a> </p>
</div>
</div>
<div class="row">
	<p>New Users: <a href="register.jsp">Register Here</a> </p>
</div>
<div class="row">
	<p>Existing Users: <a href="login.jsp">Login Here</a></p>
</div>
</article>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</div>
</body>
</html>