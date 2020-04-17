<%@page import="model.Appoinment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%
   //insert item
   
    if (request.getParameter("fullName")!= null)
    {
     
    	
    	Appoinment app = new Appoinment();
 
   
   		String stsMsg = app.insertApp(request.getParameter("fullName"), 
   						request.getParameter("gender"), 
   						request.getParameter("mobileNumber"),
   						request.getParameter("age"), 
   						request.getParameter("address"), 
   						request.getParameter("emailAddress"), 
   						request.getParameter("type"));
   					
   
   						session.setAttribute("statusMsg",stsMsg);
   					
   					
   
    }
   
   
   
   //delete item
   
   if(request.getParameter("AppointmentId") != null)
 {
	 
	Appoinment app = new Appoinment();
	
	  
	 String stsMsg = app.deleteapp(request.getParameter("AppointmentId"));  
	 session.setAttribute("statusMsg", stsMsg);  
 }
  
   //update 
   
   if (request.getParameter("AppointmentId")!= null)
   {
    
   	
	   Appoinment app = new Appoinment();


  		String stsMsg = app.updateapp(request.getParameter("AppointmentId"), 
  				request.getParameter("fullName"), 
  				request.getParameter("gender"), 
  				request.getParameter("mobileNumber"), 
  				request.getParameter("age"), 
  				request.getParameter("address"), 
  				request.getParameter("emailAddress"),
  				request.getParameter("type"));
  			
  		session.setAttribute("statusMsg", stsMsg);  		
  			
  		
  		
   }  
   
 %>
   

   

    

    
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<meta charset="ISO-8859-1">
<title>Appointment Management</title>
</head>
<body>


<div class = "container">
	<div Class="row">
		<div class="col">
		<h1 >Appointment My Doctor</h1>
			<h5 class="text-primary">   Please Enter Patient Details</h5>
			<h6 class="text-danger">   ( Fill the form below and submit your query we will contact you soon as possible )</h6>
 <form method ="post" action ="Appoinment.jsp" class="was-validated">
 
 
 <div class="col-md-4 mb-3">
      <label for="validationDefault01"> Full Name:</label>
      <input type="text"  name="fullName" class="form-control" id="validationDefault01" placeholder="ex-:Gimhani kaushaliya" value="Gimhani kaushaliya" required>
  </div>
 
 
<div class="col-md-4 mb-3">
      <label for="validationDefault01">Gender:</label>
      <input type="text" name="gender" class="form-control" id="validationDefault01" placeholder="ex-:Male or Female" value="ex-:Male or Female" required>
</div> 
 
 
 <div class="col-md-4 mb-3">
      <label for="validationDefault01"> Mobile Number: </label>
      <input type="text" name="mobileNumber" class="form-control" id="validationDefault01" placeholder="ex-:0718963582 / 0112576325" value="ex-:0718963582 / 0112576325" required>
</div> 
 
 
 <div class="col-md-4 mb-3">
      <label for="validationDefault01"> Age: </label>
      <input type="text" name="age" class="form-control" id="validationDefault01" placeholder="ex-:22" value="ex-:22" required>
</div> 
 
 <div class="col-md-4 mb-3">
      <label for="validationDefault01"> Address: </label>
      <input type="text" name="address" class="form-control" id="validationDefault01" placeholder="ex-:kandy" value="ex-:kandy" required>
</div> 
 
 
 

 
 <div class="col-md-4 mb-3">
      <label for="validationDefaultUsername">Email Address:</label>
      <div class="input-group">
        <div class="input-group-prepend">
          <span class="input-group-text" id="inputGroupPrepend2">@</span>
        </div>
        <input name="emailAddress" type="text" class="form-control" id="validationDefaultUsername" placeholder="ex-:kau@gmail.com"" aria-describedby="inputGroupPrepend2" required>
      </div>
    </div>
  
 
 
 <div class="col-md-4 mb-3">
      <label for="validationDefault01">  Type which types of Appointment you required: </label>
      <input type="text" name="type"class="form-control" id="validationDefault01" placeholder="ex-:skin care/eye checkup/hearing test" value="ex-:skin care/eye checkup/hearing test"required>
</div> 
 
 
  <div class="col-md-4 mb-3">
 
 <input    name="btnSubmit" type="submit" value="Book Appoinment" class = "btn btn-primary"> 
 
 </div> 
 </form>
 <br>
 <div class="alert alert-success">
  <%  
  out.print(session.getAttribute("statusMsg")); 
  %> 
  </div>
  <br>
  <% 
	Appoinment app = new Appoinment();   
   	out.print(app.readapp());  
   
 %> 
</div>
 </div>
 </div>





</body>
</html>