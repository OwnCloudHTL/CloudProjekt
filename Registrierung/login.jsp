<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login for Teachers</title>
<link href="./sheet.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%@ page import="java.sql.*"%>
	<%@ page import="javax.sql.*"%>
	<%
	String userid=request.getParameter("usr"); 
	session.putValue("userid",userid); 
	String pwd=request.getParameter("pwd"); 
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lehrer","root","root"); 
	Statement st= con.createStatement(); 
	ResultSet rs=st.executeQuery("select * from lehrer where userid='"+userid+"' AND password = '" + pwd + "'" ); 
	if(rs.next()) 
	{ 


		out.println("welcome"+userid); 
		session.setAttribute("user", userid);
		response.sendRedirect("admin.jsp");

	} 
	else 
	{ 
		out.println("Invalid password try again"); 
	} 
	rs.close();
%>
<a href="index.html">Home</a>

</body>
</html>
