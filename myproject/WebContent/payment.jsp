<%@page import="model.Payment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%
   //insert item
   
    if (request.getParameter("pname")!= null)
    {
     
    	
   		Payment payobj = new Payment();  
 
   
   		String stsMsg = payobj.insertPayment(request.getParameter("pname"),
   					request.getParameter("ano"),
   					request.getParameter("adate"),
   					request.getParameter("amount"),
   					request.getParameter("cname"),
   					request.getParameter("cardno"),
   					request.getParameter("expmonth"),
   					request.getParameter("expyear"),
   					request.getParameter("cvv")
   					);
   
   					session.setAttribute("statusMsg",stsMsg);
   					
   					
   
    }
     
   //delete item
     
     if(request.getParameter("pid") != null)
     {
   		Payment payobj = new Payment();   
    	 String stsMsg = payobj.deletePayment(request.getParameter("pid"));  
    	 session.setAttribute("statusMsg", stsMsg);  
     }
 
   //
   
   
    //update item
    if (request.getParameter("pname")!= null)
    {
     
    	
  		Payment payobj = new Payment(); 
 
   
   		String stsMsg = payobj.insertPayment(request.getParameter("pname"),
   					request.getParameter("ano"),
   					request.getParameter("adate"),
   					request.getParameter("amount"),
   					request.getParameter("cname"),
   					request.getParameter("cardno"),
   					request.getParameter("expmonth"),
   					request.getParameter("expyear"),
   					request.getParameter("cvv")
   					);
   
   					session.setAttribute("statusMsg",stsMsg);
   					
   					
   
    }
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>patient payment</title>
<link rel="stylesheet" href="Views/bootstrap.min.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class = "container">
	<div Class="row">
		<div class="col">
		<h3 class="text-primary">   Patient Payment</h3>
<form method ="post" action ="patient.jsp">
 Patient Name: <input name="pname" type="text" placeholder="John More Doe" class = "form-control"><br> 
 Appointment NO: <input name="ano" type="text" placeholder="A01" class = "form-control"><br> 
 Appointment Date:   <input name="adate" type="text" placeholder="2-2-2020" class = "form-control"><br> 
 Amount: <input name="amount" type="text" placeholder="2000lkr" class = "form-control"><br> 
 
 <div class="col-50">
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cname" placeholder="John More Doe" class = "form-control"><br>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardno" placeholder="1111-2222-3333-4444"class = "form-control"><br>
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September" class = "form-control"><br>
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018" class = "form-control"><br>
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352" class = "form-control"><br>
              </div>
            </div>
          </div>
          
      
 
 
 <input    name="btnSubmit" type="submit" value="Pay" class = "btn btn-primary">  
 </form>
  <br>
<div class="alert alert-success">
  <%  
  out.print(session.getAttribute("statusMsg")); 
  %> 
  </div>
<br>
<% 
	Payment payobj = new Payment();  
   	out.print(payobj.readPayment());  
   
 %> 
 </div>
</div>
 </div>
 <br>
</body>
</html>