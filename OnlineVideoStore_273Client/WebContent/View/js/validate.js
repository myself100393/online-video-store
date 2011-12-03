  function submitform()
  {
    document.myform.submit();
  }
  
  function show_alert(){
	  alert("Please login before using the site");
  }
  
  function loginvalidateForm()
  {
  	var user=document.forms["form1"]["user"].value;
  	var pass=document.forms["form1"]["pass"].value;
  
  	if (user==null || user==""){
    	alert("User Name must be filled out");
    	return false;
    }
  	
  	if (pass==null || pass==""){
    	alert("Password must be filled out");
    	return false;
    }
  	
  	
  }
  
  function validateForm()
  {
  	var user=document.forms["validateForm"]["user"].value;
  	var pass=document.forms["validateForm"]["pass"].value;
  	var last=document.forms["validateForm"]["lastN"].value;
  	var first=document.forms["validateForm"]["firstN"].value;
   
  	  
  	if (user==null || user==""){ alert("User Name must be filled out");	return false;}  	
  	if (pass==null || pass==""){ alert("Password must be filled out");	return false;}
  	if (last==null || last==""){ alert("Last Name must be filled out");	return false;}
  	if (first==null || first==""){ alert("First Name must be filled out");	return false;}
 
	
  }//End of validateForm()
  
  
  function advertValidateForm()
  {
  	var name=document.forms["form3"]["name"].value;
  	var des=document.forms["form3"]["des"].value;
  	var info=document.forms["form3"]["sellerInfo"].value;
  	var price=document.forms["form3"]["price"].value;
  	var qty=document.forms["form3"]["qty"].value;
  	  
  	if (name==null || name==""){ alert("Product Name must be filled out");	return false;}  	
  	if (des==null || des==""){ alert("Prodcut Description must be filled out");	return false;}
  	if (info==null || info==""){ alert("Seller Information must be filled out");	return false;}
  	if (price==null || price==""){ alert("Prodcut Price must be filled out");	return false;}
  	if (qty==null || qty==""){ alert("Quantity must be filled out");	return false;}
  	  	 
 	
  }//End of validateForm()
  
  