package model;

import java.sql.*;

public class Payment {
	
	
	
	public Connection connect() 
	{  
		
		Connection con = null;            
	try         
	{          
		
	Class.forName("com.mysql.jdbc.Driver");         
	con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/patient","root","");    


	 //For testing          
	System.out.print("Successfully connected");            
	}
        
		catch(Exception e)         
			{         

					e.printStackTrace();  
					System.out.print("Successfully connected");   
			}              

			return con;
			
	} 
	
	
	//insert
	
	public String insertPayment (String pname , String ano ,String adate , String amount,String cname , String cardno ,String expmonth , String expyear , String cvv  ) {
		
		String output = "";
		
		try
		{
				Connection con = connect();
				
				if(con == null) 
				{
					return "Error while connecting to the database";
				}
				
				//create a prepared statement
				
				String query =  " insert into payment (`pid`,`pname`,`ano`,`adate`,`amount`,`cname`,`cardno`,`expmonth`,`expyear`,`cvv`)"  + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"; 
				 
				 
				
				PreparedStatement preparedStmt = con.prepareStatement(query);	
				
				
				//binding values
				
				preparedStmt.setInt(1,0);
				preparedStmt.setString(2,pname);
				preparedStmt.setString(3,ano);
				preparedStmt.setString(4,adate);
				preparedStmt.setDouble(5,Double.parseDouble(amount));
				preparedStmt.setString(6,cname);
				preparedStmt.setString(7,cardno);
				preparedStmt.setString(8,expmonth);
				preparedStmt.setString(9,expyear);
				preparedStmt.setString(10,cvv);
				
				//execute the statement
				preparedStmt.execute();
				con.close();
				
				output ="Inserted successfully";
				
				
			}
		catch(Exception e) {
			
			output = "Error while inserting";
			System.err.println(e.getMessage());
		}
		
		return output;
		
		
}
	
	
	//update

	public String updatePayment(String pid,String pname , String ano ,String adate , String amount,String cname , String cardno ,String expmonth , String expyear , String cvv  ) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE payment SET pname=?,ano=?,adate=?,amount=?,cname=?,cardno=?,expmonth=?,expyear=?,cvv=? WHERE pid=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
		
			
			preparedStmt.setString(1,pname);
			preparedStmt.setString(2,ano);
			preparedStmt.setString(3,adate);
			preparedStmt.setDouble(4,Double.parseDouble(amount));
			preparedStmt.setString(5,cname);
			preparedStmt.setString(6,cardno);
			preparedStmt.setString(7,expmonth);
			preparedStmt.setString(8,expyear);
			preparedStmt.setString(9,cvv);
			preparedStmt.setInt(10, Integer.parseInt(pid));
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";
		} catch (Exception e) {
			output = "Error while updating the payment.";
			System.err.println(e.getMessage());
		}
		return output;
	}
	

	//develop read operation 
	
	public String readPayment() {
		
		String output = "";
		try
		{
			Connection con = connect();
			
			if(con == null) 
			{
				return "Error while connecting to the database for reading.";
			}
			
			//preapare the html table to be displayed 
			output =  "<table class=\"table\" border=\"1\">"
					+ "<tr><th scope=\"col\">Patient Name</th>"
					+ "<th scope=\"col\">Appointment No</th>"
					+ "<th scope=\"col\">Appointment Date</th>"
					+ "<th scope=\"col\">Amount</th>"
					+ "<th scope=\"col\">Card Name</th>"
					+ "<th scope=\"col\">Card No</th>"
					+ "<th scope=\"col\">Expire Month</th>"
					+ "<th scope=\"col\">Expire Year</th>"
					+ "<th scope=\"col\">CVV</th>"
					+ "<th scope=\"col\">UPDATE</th>"
					+ "<th scope=\"col\">REMOVE</th></tr>";
			
			
			String query = "Select * from payment";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			
			//iterate through the rows in the result set
			while(rs.next()) {
				
				String pid = Integer.toString(rs.getInt("pid"));
				String pname = rs.getString("pname"); 
				String ano = rs.getString("ano"); 
				String adate = rs.getString("adate"); 
				String amount = Double.toString(rs.getDouble("amount")); 
				String cname = rs.getString("cname"); 
				String cardno = rs.getString("cardno"); 
				String expmonth = rs.getString("expmonth"); 
				String expyear = rs.getString("expyear"); 
				String cvv = rs.getString("cvv"); 
				
				
				
				
				//Add into the html table
				
				
				output += "<tr><td>" + pname+ "</td>"; 
				output += "<td>" + ano+ "</td>"; 
				output += "<td>" + adate + "</td>"; 
				output += "<td>" + amount + "</td>"; 
				output += "<td>" +cname + "</td>"; 
				output += "<td>" + cardno+ "</td>"; 
				output += "<td>" + expmonth + "</td>"; 
				output += "<td>" + expyear + "</td>"; 
				output += "<td>" + cvv + "</td>"; 
				
				//buttons
				
				output += "<td><input name=\"btnUpdate\" "
						 + " type=\"button\" value=\"Update\" class=\"btn btn-danger\"></td>"
						 + "<td><form method=\"post\" action=\"payment.jsp\">"
						 + "<input name=\"btnRemove\" "
						 + " type=\"submit\" value=\"Remove\" class=\"btn btn-danger\">"
						 + "<input name=\"pid\" type=\"hidden\" "
						 + " value=\"" + pid + "\">" + "</form></td></tr>";
				
			}
			
			con.close();
			
			//complete the html table
			output += "</table>";
			
			
		}
		catch (Exception e)
		
		{
			output = "Error while reading the items.";   
			System.err.println(e.getMessage()); 
			
		}
		
		return output;
		
	}
	
	
	//delete
public String deletePayment(String pid) {
		
		String output = ""; 

		  try {
			  
			  Connection con = connect(); 
			  
			  if (con == null)   
			  {    
				  return "Error while connecting to the database for deleting.";   
				  
			  } 
			  
			// create a prepared statement   
			  
			  String query = "delete from payment where pid=?"; 
			  
			  PreparedStatement preparedStmt = con.prepareStatement(query); 
			  
			// binding values  
			  preparedStmt.setInt(1, Integer.parseInt(pid)); 
			  
			  
			// execute the statement   
			  preparedStmt.execute();   
			  con.close(); 
			  
			  output = "Deleted successfully"; 
		  	}
		  
		  catch (Exception e)  
		  {  
			  output = "Error while deleting the from database.";   
			  System.err.println(e.getMessage());  
			  
		  }
		  
		  return output; 
		
	}
	


	

}


