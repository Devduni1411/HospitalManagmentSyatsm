package com;

import model.Payment;

//For REST Service
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
//For JSON
import com.google.gson.*;
//For XML
import org.jsoup.*;
import org.jsoup.parser.*;
import org.jsoup.nodes.Document;

@Path("/payment")

public class PaymentService {

	Payment payobj = new Payment();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readItems() {
		return payobj.readPayment();
	}

	@POST
	@Path("/")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(MediaType.TEXT_PLAIN)
	public String insertPayment (@FormParam("pname") String pname, @FormParam("ano") String ano,
			@FormParam("adate") String adate, @FormParam("amount") String amount,
			@FormParam("cname") String cname, @FormParam("cardno") String cardno,
			@FormParam("expmonth") String expmonth, @FormParam("expyear") String expyear,@FormParam("cvv") String cvv){
		String output = payobj.insertPayment(pname,ano,adate,amount,cname,cardno,expmonth,expyear,cvv);
		return output;
	}

	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updatePayment(String paymentData) {
		// Convert the input string to a JSON object
		JsonObject payobject = new JsonParser().parse(paymentData).getAsJsonObject();
		// Read the values from the JSON object
		String pid = payobject.get("pid").getAsString();
		String pname = payobject.get("pname").getAsString();
		String ano = payobject.get("ano").getAsString();
		String adate = payobject.get("adate").getAsString();
		String amount = payobject.get("amount").getAsString();
		String cname = payobject.get("cname").getAsString();
		String cardno = payobject.get("cardno").getAsString();
		String expmonth = payobject.get("expmonth").getAsString();
		String expyear = payobject.get("expyear").getAsString();
		String cvv = payobject.get("cvv").getAsString();
		
		String output = payobj.updatePayment(pid,pname,ano,adate,amount,cname,cardno,expmonth,expyear,cvv);
		return output;
	}

	@DELETE
	@Path("/")
	@Consumes(MediaType.APPLICATION_XML)
	@Produces(MediaType.TEXT_PLAIN)
	public String deletePayment(String paymentData) {
		// Convert the input string to an XML document
		Document doc = Jsoup.parse(paymentData, "", Parser.xmlParser());

		// Read the value from the element <itemID>
		String pid = doc.select("pid").text();
		String output = payobj.deletePayment(pid);
		return output;  
	}

}
