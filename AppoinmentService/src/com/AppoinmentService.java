package com;



//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//For JSON
import com.google.gson.*;

import model.Appoinment;

//For XML 
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/Appoinment")

public class AppoinmentService {

	
	Appoinment app = new Appoinment();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readapp() {
		return app.readapp();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertApp(@FormParam("fullName") String fullName,
			@FormParam("gender") String gender,
			@FormParam("mobileNumber") String mobileNumber,
			@FormParam("age") String age,
			@FormParam("address") String address,
			@FormParam("emailAddress") String emailAddress,
			@FormParam("type") String type)
		{
			String output = app.insertApp(fullName, gender, mobileNumber, age, address, emailAddress, type);
			return output;
	} 

	
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML) 
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteApp(String itemData)
	{  
		//Convert the input string to an XML document
		Document doc = Jsoup.parse(itemData, "", Parser.xmlParser());
		
		//Read the value from the element <AppointmentId>
		String AppointmentId = doc.select("AppointmentId").text();  
		
		 String output = app.deleteapp(AppointmentId);  
		 
		 return output; 
		 } 
	
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateApp(String itemData)
	{
		// Convert the input string to a JSON object 
		JsonObject itemObject = new JsonParser().parse(itemData).getAsJsonObject();
		
		// Read the values from the JSON object 
		String AppointmentId = itemObject.get("AppointmentId").getAsString(); 
		String fullName = itemObject.get("fullName").getAsString();
		String gender = itemObject.get("gender").getAsString();
		String mobileNumber = itemObject.get("mobileNumber").getAsString();
		String age =itemObject.get("age").getAsString();
		String address =itemObject.get("address").getAsString();
		String emailAddress =itemObject.get("emailAddress").getAsString();
		String type =itemObject.get("type").getAsString();
		String output = app.updateapp(AppointmentId, fullName, gender, mobileNumber, age, address, emailAddress, type);
		return output;
	}
	
	
	
	
	
	
	
	
	
}
