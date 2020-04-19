
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
 { 
// Clear alerts---------------------
$("#alertSuccess").text(""); 
$("#alertSuccess").hide(); 
$("#alertError").text(""); 
$("#alertError").hide(); 
// Form validation-------------------
var status = validateDoctorForm(); 
if (status != true) 
{ 
$("#alertError").text(status); 
$("#alertError").show(); 
    return; 
} 
// If valid------------------------
$("#formItem").submit(); 
});



function validateDoctorForm() 
{ 
// Name
     if ($("#dName").val().trim() == "")
    { 
           return"Insert Doctor Name."; 
    } 
// Address
      if ($("#address").val().trim() == "")
     {  
           return"Insert Address."; 
// Email
    if ($("#email").val().trim() == "")
     {  
           return"Insert email."; 
     } 
     } 
// Phone no-------------------------------
       if ($("#phoneNo").val().trim() == "")
     { 
           return"Insert Phone Number."; 
      } 
// is numerical value

      var tmpPrice = $("#phoneNo").val().trim();

        if (!$.isNumeric(phoneNo))
       {
             return"Insert a numerical value for Phone Number.";
       } 


// specialization------------------------
       if ($("#specialization").val().trim() == "") 
        { 
           return"Insert specialization.";
        } 
           returntrue; 
}