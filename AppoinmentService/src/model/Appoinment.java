package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Appoinment {

	
	
	//connection
	public Connection connect() 
	{  
		
		Connection con = null;            
	try         
	{          
		
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		//con = DriverManager.getConnection(arg0)ection("jdbc:mysql://127.0.0.1:3306/appoinment?useTimezone=true&serverTimezone=UTC","user","pass", "root", "");
		
		con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/appoinment?useTimezone=true&serverTimezone=UTC","root","");  
	
	 
	 //For testing          
	System.out.print("Successfully connected");            
	}
        
		catch(Exception e)         
			{         
	
	
					e.printStackTrace();  
					System.out.print("Successfully not connected");   
			}              

			return con;
			
	} 
	
	
	
	
	//insert
public String insertApp (String fullName , String gender ,String mobileNumber , String age ,String address ,String emailAddress , String type) {
		
		String output = "";
		
		try
		{
				Connection con = connect();
				
				if(con == null) 
				{
					return "Error while connecting to the database";
				}
				
				//create a prepared statement
				
				String query =  " insert into appointment(`AppointmentId`,`fullName`,`gender`,`mobileNumber`,`age`,`address`,`emailAddress`,`type`)"  + " values (?, ?, ?, ?, ?, ?, ?, ?)"; 
				 
				 
				
				PreparedStatement preparedStmt = con.prepareStatement(query);	
				
				
				//binding values
				
				preparedStmt.setInt(1,0);
				preparedStmt.setString(2,fullName);
				preparedStmt.setString(3,gender);
				preparedStmt.setString(4,mobileNumber);
				preparedStmt.setString(5,age);
				preparedStmt.setString(6,address);
				preparedStmt.setString(7,emailAddress);
				preparedStmt.setString(8,type);
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

// develop read operation

public String readapp() {

	String output = "";
	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for reading.";
		}

		// preapare the html table to be displayed
		output = "<table class=\"table\" border=\"1\">" + "<tr><th scope=\"col\">fullName</th>"
				+ "<th scope=\"col\">gender</th>" + "<th scope=\"col\">mobileNumber</th>"
				+ "<th scope=\"col\">age</th>" + "<th scope=\"col\">address</th>"
				+ "<th scope=\"col\">emailAddress</th>"
				+ "<th scope=\"col\">type</th>" + "<th scope=\"col\">Update</th>"
				+ "<th scope=\"col\">Remove</th></tr>";

		String query = "Select * from appointment";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);

		// iterate through the rows in the result set
		while (rs.next()) {

			String AppointmentId = Integer.toString(rs.getInt("AppointmentId"));
			String fullName = rs.getString("fullName");
			String gender = rs.getString("gender");
			String mobileNumber = rs.getString("mobileNumber");
			String age = rs.getString("age");
			String address = rs.getString("address");
			String emailAddress = rs.getString("emailAddress");
			String type = rs.getString("type");


			// Add into the html table

			output += "<tr><td>" + fullName + "</td>";
			output += "<td>" + gender + "</td>";
			output += "<td>" + mobileNumber + "</td>";
			output += "<td>" + age + "</td>";
			output += "<td>" + address + "</td>";
			output += "<td>" + emailAddress + "</td>";
			output += "<td>" + type + "</td>";

			// buttons

			output += "<td><input name=\"btnUpdate\" "
					+ " type=\"button\" value=\"Update\" class=\"btn btn-danger\"></td>"
					+ "<td><form method=\"post\" action=\"Appoinment.jsp\">" + "<input name=\"btnRemove\" "
					+ " type=\"submit\" value=\"Remove\" class=\"btn btn-danger\">"
					+ "<input name=\"AppointmentId\" type=\"hidden\" " + " value=\"" + AppointmentId + "\">"
					+ "</form></td></tr>";

		}

		con.close();

		// complete the html table
		output += "</table>";

	} catch (Exception e)

	{
		output = "Error while reading the items.";
		System.err.println(e.getMessage());

	}

	return output;

}






//Delete appoinment
public String deleteapp(String AppointmentId) {

	String output = "";

	try {

		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for deleting.";

		}

		// create a prepared statement

		String query = "delete from appointment where AppointmentId=?";

		PreparedStatement preparedStmt = con.prepareStatement(query);

		// binding values
		preparedStmt.setInt(1, Integer.parseInt(AppointmentId));

		// execute the statement
		preparedStmt.execute();
		con.close();

		output = "Deleted successfully";
	}

	catch (Exception e) {
		output = "Error while deleting the appoinment.";
		System.err.println(e.getMessage());

	}

	return output;

}


	
	//Update appoinment

public String updateapp(String AppointmentId, String fullName, String gender, String mobileNumber, String age,String address, String emailAddress,String type) 
{
	String output = "";

	try {
		Connection con = connect();

		if (con == null) {
			return "Error while connecting to the database for updating.";
		}

		// create a prepared statement 
		String query = "UPDATE appointment SET fullName=?,gender=?,mobileNumber=?,age=?,address=?,emailAddress=?,type=? WHERE AppointmentId=?";

		PreparedStatement preparedStmt = con.prepareStatement(query);

		// binding values 
		preparedStmt.setString(1, fullName); 
		preparedStmt.setString(2, gender); 
		preparedStmt.setString(3, mobileNumber);
		preparedStmt.setString(4, age); 
		preparedStmt.setString(5, address); 
		preparedStmt.setString(6, emailAddress); 
		preparedStmt.setString(7, type); 
		preparedStmt.setInt(8,Integer.parseInt(AppointmentId));

		// execute the statement 
		preparedStmt.execute(); 
		con.close();

		output = "Updated successfully";
	} catch (Exception e) {
		output = "Error while updating the Appoinment.";
		System.err.println(e.getMessage());
	}

	return output;
}


	
}
