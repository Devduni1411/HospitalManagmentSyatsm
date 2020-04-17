<%@page import="model.Hospital"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%
         	//Insert Hospital
                      if (request.getParameter("hospitalNo") != null)
                      {
                      	Hospital hospitalObj = new Hospital();
                      	
                      	String stsMsg = hospitalObj.insertHospital(request.getParameter("hospitalNo"),   
                      			request.getParameter("hospitalName"),
                      			request.getParameter("hospitalAddress"),
                      			request.getParameter("hospitalPhone"),
                      			request.getParameter("hospitalEmail"),
                      			request.getParameter("hospitalPassword"));  
                      	 session.setAttribute("statusMsg", stsMsg); 
                      	}
   //Delete item----------------------------------
 	if (request.getParameter("hospitalID") != null)
 	{
 		Hospital hospitalObj = new Hospital();  
 		String stsMsg = hospitalObj.deleteHospital(request.getParameter("hospitalID"));
 		session.setAttribute("statusMsg", stsMsg);
 	} 
   
 	//update
	 if (request.getParameter("hospitalID") != null)
                      {
                      	Hospital hospitalObj = new Hospital();
                      	
                      	String stsMsg = hospitalObj.updateHospital(request.getParameter("hospitalID"),   
                      			request.getParameter("hospitalNo"),
                      			request.getParameter("hospitalName"),
                      			request.getParameter("hospitalAddress"),
                      			request.getParameter("hospitalPhone"),
                      			request.getParameter("hospitalEmail"),
                      			request.getParameter("hospitalPassword")); 
                      	
                      	 session.setAttribute("statusMsg", stsMsg); 
                      	}
 	
         %> 
      

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<meta charset="ISO-8859-1">
<title>Hospital Management</title>
</head>
<body>
<div class = "container">
	<div Class="row">
		<div class="col">
	 <h1>Hospital management</h1>
 	<form method="post" action="hospitals.jsp"> 
  		Hospital no: <input name="hospitalNo" type="text" class = "form-control"><br>
 		Hospital name: <input name="hospitalName" type="text" class = "form-control"><br> 
  		Hospital address: <input name="hospitalAddress" type="text" class = "form-control"><br>
  		Hospital phone: <input name="hospitalPhone" type="text" class = "form-control"><br>
  		Hospital email: <input name="hospitalEmail" type="text" class = "form-control"><br>
  		Hospital password: <input name="hospitalPassword" type="text" class = "form-control"><br>
 		<input name="btnSubmit" type="submit" value="Save" class = "btn btn-primary">
 		<input name="btnSubmit" type="submit" value="Add Doctor" class = "btn btn-primary">
 		
 		
 	</form>
 	<%
 		out.print(session.getAttribute("statusMsg"));
 	%>
 <br>
 	<%
 		Hospital hospitalObj = new Hospital();  
 	 	 	out.print(hospitalObj.readHospitals());
 	%>
 </div>
 </div>
 </div>
</body>
</html>

