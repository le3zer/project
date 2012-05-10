<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Chronicle</title>
</head>
<body>
<div id="head">
<h1><b>The Chronicle</b></h1>
<p><%= new java.util.Date()%></p>
<div id="logIn">
<a href="logIn.jsp" >Log In</a>
</div>
</div>
<div id="menu">
<table align="center" cellpadding="5">
  <tr>
	<td><a href="home.jsp">Home</a></td>
	<td><a href="news.jsp">News</a></td>
	<td><a href="signUp.jsp">Sign Up</a></td>
	<td><a href="database.jsp">Database</a></td>
  </tr>
  </table>
</div>

<div id="news">
<table border="1">
<tr>
<th>News</th>
</tr>
<tr>
<td>Find out all the latest movie news right here. <a href="news.jsp">News>>></a></td>
</tr>
</table>
</div>
<div id="database">
<table border="1">
<tr>
<th>Database</th>
</tr>
<tr>
<td>View all the films which have been added to the database and read the reviews and leave your own thoughts on the reviewed movies. <a href="database.jsp">Database>>></a></td>
</tr>
</table>
</div>
<div id="body">
<h3>Message from the Administrator</h3>
<p>Hi guys, I'm the administrator of this site and I welcome you to this site</p>
</div>
</body>
</html>