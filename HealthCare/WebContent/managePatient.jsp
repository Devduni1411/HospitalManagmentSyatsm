<%@ page import="model.Patient" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
		//Intert user
		if (request.getParameter("fname") != null)
		{
			Patient patientObj = new Patient();
			 	String stsMsg = patientObj.insertUser(request.getParameter("fname"),
			 			request.getParameter("lname"),
						request.getParameter("address"),
						request.getParameter("email"),
						request.getParameter("phone"),
						request.getParameter("nic"),
						request.getParameter("dob"),
						request.getParameter("username"),
						request.getParameter("password"));
			 			session.setAttribute("statusMsg", stsMsg);
		}
		
		//Update user
				if (request.getParameter("pid") != null)
				{
					Patient patientObj = new Patient();
					 	String stsMsg = patientObj.updateUser(request.getParameter("pid"),
					 			request.getParameter("fname"),
					 			request.getParameter("lname"),
								request.getParameter("address"),
								request.getParameter("email"),
								request.getParameter("phone"),
								request.getParameter("nic"),
								request.getParameter("dob"),
								request.getParameter("username"),
								request.getParameter("password"));
					 			session.setAttribute("statusMsg", stsMsg);
				}

		//Delete user
		if (request.getParameter("pid") != null)
		{
			Patient patientObj = new Patient();
			String stsMsg = patientObj.deletePatient(request.getParameter("pid"));
			session.setAttribute("statusMsg", stsMsg);
		}
%>    
    
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="Views/bootstrap.min.css">
		<script src="js/validation.js" type="text/javascript"></script>
		<meta charset="ISO-8859-1">
		<title>User management</title>
	</head>
	<body>
		<div class="container">
			<div Class="row">
				<div class="col">
					<h1>User management</h1>
					 		<form method="post" action="managePatient.jsp">
					  			First name: <input name="fname" type="text" class="form-control" placeholder="Enter firstname" ><br>
					  			Last name: <input name="lname" type="text" class="form-control" placeholder="Enter lastname"><br>
					 			Address: <input name="address" type="text" class="form-control" placeholder="Enter address"><br>
								Email: <input name="email" type="email" class="form-control" placeholder="Enter email" id="email"><br>
								Phone number: <input name="phone" type="text" class="form-control" placeholder="Enter phone"><br>
								NIC: <input name="nic" type="text" class="form-control" placeholder="Enter nic"><br>
								Birthday: <input name="dob" type="text" class="form-control" placeholder="Enter birthday"><br>
								User name: <input name="username" type="text" class="form-control" placeholder="Enter username"><br>
								Password: <input name="password" type="text" class="form-control" placeholder="Enter password"><br> 
					  		<input name="btnSubmit" type="submit" value="Save" class="btn btn-primary">
						 	</form>
						 	<div class="alert alert-success">
						 		<% out.print(session.getAttribute("statusMsg")); %>
						 	</div>
					 <br>
					 <%
					 		Patient patientObj = new Patient();
					 		out.print(patientObj.readUsers());
					 %>
				</div>
			</div>
		</div>
	</body>
</html>