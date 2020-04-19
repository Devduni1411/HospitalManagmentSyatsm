<%@page import="model.*"%> 
<%@page import="com.*"%>  
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
   <%
    if (request.getParameter("dName") != null)
    {
    	
    	Doctor docObj = new Doctor();
		String stsMsg = docObj.insertDoctor(request.getParameter("dName"),
		request.getParameter("address"),
		request.getParameter("email"),
		request.getParameter("phoneNo"),
		request.getParameter("specialization"));
		session.setAttribute("statusMsg", stsMsg);
		
    }	
   
   if (request.getParameter("dID") != null)
   {
   		
   	    Doctor docObj = new Doctor();
   		String stsMsg = docObj.deleteDoctor(request.getParameter("dID"));
   		session.setAttribute("statusMsg", stsMsg);
   		

   		
   }

		


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<!-- head code meta tag -->
<meta name ="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="Views/bootstrap.min.css">

<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- java script files -->
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/main1.js"></script>
<title>Doctor Management</title>
</head>
<body>
<div class="container">
	<div class="row">
	
		<div class="col">
<h1>Doctor Management</h1>
<form  id="formItem" method="post" action="doctor.jsp">
Doctor name: <input name="dName" type="text" class="form-control"><br> 
Address: <input name="address" type="text" class="form-control"><br> 
E-mail:<input name="email" type="text" class="form-control"><br> 
Phone no: <input name="phoneNo" type="text" class="form-control"><br>
Specialization: <input name="specialization" type="text" class="form-control"><br> <input 
id="btnSave" name="btnSave" type="submit" value="Save" class="btn btn-primary">
</form>
<div class="alert alert-success">
<%
out.print(session.getAttribute("statusMsg"));
%>
</div>
<br>
<%
Doctor itemObj = new Doctor();
out.print(itemObj.readItems());
%>



</div>
</div>
</div>


</body>
</html>