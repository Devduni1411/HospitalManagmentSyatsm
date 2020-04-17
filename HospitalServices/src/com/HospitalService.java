package com;

//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

//For JSON
import com.google.gson.*;

import model.Hospital;

//For XML 
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/Hospitals")
public class HospitalService {

	Hospital hospitalObj = new Hospital(); 

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readHospitals() {
		return hospitalObj.readHospitals();
	}
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertHospital(@FormParam("hospitalNo") String hospitalNo,
			@FormParam("hospitalName") String hospitalName,
			@FormParam("hospitalAddress") String hospitalAddress,
			@FormParam("hospitalPhone") String hospitalPhone,
			@FormParam("hospitalEmail") String HospitalEmail,
			@FormParam("hospitalPassword") String hospitalPassword)
		{
			String output = hospitalObj.insertHospital(hospitalNo, hospitalName, hospitalAddress, hospitalPhone, HospitalEmail, hospitalPassword);
			return output;
	} 

@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateHospital(String itemData)
	{
		// Convert the input string to a JSON object 
		JsonObject hospitalObject = new JsonParser().parse(itemData).getAsJsonObject();
		
		// Read the values from the JSON object 
		String hospitalID = hospitalObject.get("hospitalID ").getAsString(); 
		String hospitalNo = hospitalObject.get("hospitalNo").getAsString();
		String hospitalName = hospitalObject.get("hospitalName").getAsString();
		String hospitalAddress = hospitalObject.get("hospitalAddress").getAsString();
		String hospitalPhone =hospitalObject.get("hospitalPhone").getAsString();
		String hospitalEmail = hospitalObject.get("hospitalEmail").getAsString();
		String hospitalPassword =hospitalObject.get("hospitalPassword").getAsString();
		
		String output = hospitalObj.updateHospital(hospitalID, hospitalNo, hospitalName, hospitalAddress, hospitalPhone, hospitalEmail, hospitalPassword);
		return output;
	}



@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML) 
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteHopital(String itemData)
	{  
		//Convert the input string to an XML document
			Document doc = Jsoup.parse(itemData, "", Parser.xmlParser());
		
		//Read the value from the element <itemID>
		String hospitalID = doc.select("hospitalID").text();  
		
		 String output = hospitalObj.deleteHospital(hospitalID);  
		 
		 return output; 
		 } 
}

