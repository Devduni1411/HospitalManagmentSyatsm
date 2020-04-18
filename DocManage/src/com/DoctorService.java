package com;

import javax.ws.rs.*;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import model.Doctor;


@Path("/Doctors")
public class DoctorService {
	
	Doctor docObj = new Doctor();
	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems()
	{
		return docObj.readItems();
	}
	
	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertDoctor(@FormParam("dName") String dName,
	@FormParam("address") String address,
	@FormParam("email") String email,
	@FormParam("phoneNo") String phoneNo,
	@FormParam("specialization") String specialization,
	@FormParam("hospitalID") String hospitalID)
	{
	String output = docObj.insertDoctor(dName, address, email, phoneNo, specialization, hospitalID);
	return output;
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateDoctor(String itemData)
	{
	
		//Convert the input string to a JSON object
	
		JsonObject itemObject = new JsonParser().parse(itemData).getAsJsonObject();
	
	//Read the values from the JSON object
	
	String dID = itemObject.get("dID").getAsString();
	String dName = itemObject.get("dName").getAsString();
	String address = itemObject.get("address").getAsString();
	String email = itemObject.get("email").getAsString();
	String phoneNo = itemObject.get("phoneNo").getAsString();
	String specialization = itemObject.get("specialization").getAsString();
	
	String output = docObj.updateDoctor(dID, dName, address, email, phoneNo, specialization);
	
	return output;
	}
	
	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteDoctor(String docData)
	{
	//Convert the input string to an XML document
	Document doc = Jsoup.parse(docData, "", Parser.xmlParser());
	//Read the value from the element <itemID>
	String dID = doc.select("dID").text();
	String output = docObj.deleteDoctor(dID);
	return output;
	}

}
