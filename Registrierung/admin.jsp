<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Anmeldung der Schüler</title>
<link href="./sheet.css" rel="stylesheet" type="text/css">
<h1> Bitte geben Sie die Schülerdaten ein</h1>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>

<% String user = (String)session.getAttribute("user"); 

if (user == null)
{
	response.sendRedirect("login.jsp");
	return;
}
%>


<%


	String user1=request.getParameter("user1id"); 
	String pwd=request.getParameter("pwd"); 
	String fname=request.getParameter("fname"); 
	String lname=request.getParameter("lname"); 
	String email=request.getParameter("email"); 
	String klasse=request.getParameter("klasse");
	String fach = request.getParameter("fach");
	Class.forName("com.mysql.jdbc.Driver"); 
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lehrer",
			"root", "root"); 
	Statement st= con.createStatement(); 
	ResultSet rs; 
	int i=st.executeUpdate("insert into schueler1 values ('"+user1+"','"+pwd+"','"+fname+"','"+lname+"','"+email+"','"+klasse+"','"+fach+"')"); 

		out.println("Registered"); 
		
		if (request.getParameter("speichern") != null )
		{
			//speichern i db
		}


%>

	<form action="admin.jsp" method="post">
	User name :<input type="text" name="user1id" /><br/><br/>
	password :<input type="password" name="pwd" /><br/><br/>
	First name :<input type="text" name="fname" /><br/><br/>
	Last name :<input type="text" name="lname" /><br/><br/>
	Email :<input type="text" name="email" /><br/><br/>
	Klasse:<input type="text" name="klasse"/><br><br/>
	Fach:<input type="text" name="fach"/><br><br/>
	<input type ="submit" name="speichern"/>
</form>
</body>
</html>
