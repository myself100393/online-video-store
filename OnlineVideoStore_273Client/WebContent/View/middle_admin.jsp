 				<%@ page import="video.dto.Person" %>
 				<%@ page import="video.dto.Address" %>
 				<%@ page import="java.util.Locale" %>
 				<%@ page import="java.util.LinkedHashMap" %> 				 
 				<%@ page import="video.util.CountryHelper" %> 
 				<%@ page import="video.util.StateHelper" %> 				
 				<%@ page import="video.dto.Account;" %>
 				<%
 					LinkedHashMap<String,String> countries =  (LinkedHashMap<String,String>)CountryHelper.countries;
					LinkedHashMap<String,String> states =  (LinkedHashMap<String,String>)StateHelper.states;
		 			
 			
 				
 					int simpleM = 1;
 					int premiumM =2;
 					
 					Person person = (Person)request.getAttribute("person"); 
 				 	String firstN ="" , lastN ="", pwd ="", lastLogin ="" , reg ="", userN = "";			
 				 	
 				 	if(person!=null){					
 				 		 firstN = person.getFirstName();
 				 		 lastN = person.getLastName();
 				 		 pwd = person.getPassword();					
 				 		 lastLogin = person.getLast_login();
 				 		 reg = person.getRegistration();
 				 		 userN = person.getUsername();				
 				 	}	
 				 				 				
 				 	Account account = (Account)request.getAttribute("account");
 				 		double bal = 0;
 				 		double fee = 0;
 				 		int outstand = 0;
 				 		int userId = 0;
 				 		String ssn = "";
 				 		int userType = 0;
 				 		int accountId = 0; 
 				 		String userTypeStr = "";
 				 		if(account!=null){
 				 			 bal = account.getBalance();
 				 			 fee = account.getMonthlyFee();
 				 			 outstand = account.getOutstandingMovies();
 				 			 userId = account.getPersonId();
 				 			 ssn = ((ssn=account.getSsn())==null)?"":ssn;
 				 			 userType = account.getUserType();
 				 			 accountId = account.getId();
 				 						 				 
 				 			 //(1 = simple member; 2 = premium member)
 				 			 if(userType==simpleM){
 				 				 userTypeStr = "";
 				 			 }else if(userType==premiumM){
 				 			     userTypeStr = "Checked";
 				 			 }
 				 	}
 				 		
 	 				Address address = (Address)request.getAttribute("address"); 
 	 				String city ="" , country ="", state ="", st ="" , zip = "";			
 	 				 	
 	 				if(address!=null){					
 	 					city = address.getCity();
 	 				 	country = address.getCountry();
 	 				 	state = address.getState();					
 	 				 	st = address.getStreet();
 	 				 	zip = address.getZip(); 	 				 		 				
 	 				} 	 				 	
 				%>



	 		<div class="rright">			
				<!-- Register Form -->
				<form id="advertForm" action="Account" method="post">
					<h1>Your Account Info</h1>	
					
					
					 				
					 <div id="tabs">
						<ul>
							<li><a href="#tabs-1">User</a></li>
							<li><a href="#tabs-2">Account</a></li>
							<li><a href="#tabs-3">Address</a></li>
						</ul>
						<div id="tabs-1">
						
								<p>  
									<h2 class="accountX">User Name:<em>*</em></h2>
				     				<input id="name" name="name" size="30" class="required" minlength="1" value="<%=userN%>"/>
				   			   	<p/>
			   		
			   				   	<br/>
			   				   	<p>
									<h2 class="accountX">First Name:<em>*</em></h2>
									<input id="fname" name="fname" size="30" class="required" minlength="1" value="<%=firstN%>"/>
								<p/>
			   				   	
			   				   	<br/>
			   				   	<p>					
								<h2 class="accountX">Last Name:<em>*</em></h2>
			   					<input id="lname" name="lname" size="30" class="required" minlength="1" value="<%=lastN%>"/>
			 					<p/>  					
   				   							
						</div>
						<div id="tabs-2">
						
						  		<br/>
			   				   	<p>   					
			     				<h2 class="accountX">Password:<em>*</em></h2>
			     				<input id="pwd" name="pwd" size="30" class="required" minlength="1" value="<%=pwd%>" />
								<p/>   					   
			   				   	
			   				   	<br/>
			   				   	<p>     				
			     				<h2 class="accountX">Last Login:</h2>
			     				<input id="lastLogin" name="lastLogin" size="30"   disabled="disabled" value="<%=lastLogin%>" />
			 					<p/>
			 					  				   	
			   				   	<br/>
			   				   	<p>   					
			   					<h2 class="accountX">Registered On:</h2>
			     				<input id="registration" name="registration" size="30"   disabled="disabled" value="<%=reg%>" />
			 					<p/>
			 					  	
			 					<br/>
			   				   	<p>    					  					
			   					<%	if(userType==simpleM){	%>		
				   					<h2 class="accountX">Balance: </h2>
			     					<input id="bal" name="bal" size="30"   disabled="disabled" value="<%=bal%>" />   								 			
				   				<%	}else if(userType==premiumM){ %>
				   					<h2 class="accountX">Monthly Fee: </h2>
			     					<input id="fee" name="fee" size="30"   disabled="disabled" value="<%=fee%>" />   								 			
				   				<% } %>
				   		  		<p/>
			   				   	
			   				   	<br/>
			   				   	<p>	   		  					
			   					<h2 class="accountX">Outstanding Movies:</h2>
			     				<input id="outstand" name="outstand" size="30"   disabled="disabled" value="<%=outstand%>" />
								<p/>
								   				   	
			   				   	<br/>
			   				   	<p>   					
			   					<h2 class="accountX">User ID:</h2>
			     				<input id="userId" name="userId" size="30"   disabled="disabled" value="<%=userId%>" />
			  					<p/>
			  					 				   	
			   				   	<br/>
			   				   	<p>   					  				 
			     				<h2 class="accountX">Membership #:<em>*</em></h2>
			     				<input id="ssn" name="ssn" size="30" class="required" minlength="9" maxlength="9" value="<%=ssn%>" />
			  					<p/>
			  					 				   	
			   				   	<br/>
			   				   	<p>   				 	
								<h2 class="accountX">Premium:</h2>
				            	<input class="checkbox" name=userType id="userType" type="checkbox" <%=userTypeStr%> value="<%=userType%>" />
			   					<p/>
			   
						
 						
						</div>
						<div id="tabs-3">
						   	   	<br/>
			   				   	<p>	          	
			 		     		<h2 class="accountX">Street:<em>*</em></h2>
			     				<input id="st" name="st" size="30" class="required" minlength="4" maxlength="30" value="<%=st%>" />
			 					<p/>  		
			 							   	
			   				   	<br/>
			   				   	<p> 		   		  
			       				<h2 class="accountX">city:<em>*</em></h2>   
			       				<input id="city" name="city" size="30" class="required" minlength="4" maxlength="30" value="<%=city%>" />
			 					<p/>		    				
			   				   	
			   				   	<br/>
			   				   	<p>	
			      				<h2 class="accountX">State:<em>*</em></h2>
			     				<select class="required" id="state" name="state">
			     					<option value="">Please Select</option>
			     					<option value="xx">NOT LISTED</option>     								
			 					  <%
			 					  	for (String key : states.keySet()) { 						  
			 					  		String selectedState="";
			 						  	if(key.equals(state)){
			 						  		selectedState="selected=\"selected\"";			  		
			 						  	}	
			 							out.println("<option "+selectedState+" value=\""+key+"\">"+states.get(key)+"</option>"); 			 
			 						}
			 					  %> 						
								</select>
			 					<p/>
			 					  				   	
			   				   	<br/>
			   				   	<p>					
			   					<h2 class="accountX">Country:<em>*</em></h2>   					
			     				<select class="required" id="country" name="country">
			     					<option value="">Please Select</option>     								
			 					  <%
			 					  	for (String key : countries.keySet()) { 						  
			 					  		String selected="";
			 						  	if(key.equals(country)){
			 						  		selected="selected=\"selected\"";			  		
			 						  	}	
			 							out.println("<option "+selected+" value=\""+key+"\">"+countries.get(key)+"</option>"); 			 
			 						}
			 					  %> 						
								</select>
								<p/>
													  										
			   				   	
			   				   	<br/>
			   				   	<p>	 
								<h2 class="accountX">Zip:<em>*</em></h2>
			     				<input id="zip" name="zip" size="30" class="required" minlength="5" maxlength="10" value="<%=zip%>" />
			 					<p/>  


						</div>
					</div>
  	 	
					

 									   	
			
   				
					
					<input type="hidden" name="FunctionCall" value="UpdateUser">
					<input type="hidden" name="accountId" value="<%=accountId%>">
					<input type="hidden" name="userId" value="<%=userId%>">
					<br/>
					<p>
						<input type="submit" name="submit" value="Update Account" class="bt_advert" />
					</p>
					<br/>
				</form>
			</div>
 