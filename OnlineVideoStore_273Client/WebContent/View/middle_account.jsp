 				<%@ page import="video.dto.Person" %>
 				<%@ page import="video.dto.Address" %>
 				<%@ page import="java.util.Locale" %>
 				<%@ page import="java.util.LinkedHashMap" %> 				 
 				<%@ page import="video.util.CountryHelper" %> 
 				<%@ page import="video.util.StateHelper" %> 				
 				<%@ page import="video.util.MovieSearchHelper" %> 
 				<%@ page import="video.dto.Account;" %>
 				<%
 					LinkedHashMap<String,String> countries =  (LinkedHashMap<String,String>)CountryHelper.countries;
					LinkedHashMap<String,String> states =  (LinkedHashMap<String,String>)StateHelper.states;
					LinkedHashMap<String,String> movies =  (LinkedHashMap<String,String>)MovieSearchHelper.states;
		 			
 			
 				
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
 				 		int movieId = 0;
 				 		String banner = "";
 				 		String name = "";
 				 		boolean availability = false;
 				 		int rentAmount = 0;
 				 		
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
 	 				String city ="" , country ="", state ="", st ="" , zip = "",movie="";			
 	 				 	
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
							<li><a href="#tabs-4">Movie Search/Renting </a></li>
							<li><a href="#tabs-5">Movie Return</a></li>
							<li><a href="#tabs-6">Movie Listing</a></li>
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
						<div id="tabs-4">
			   				   	<br/>
			   				   	<p>	   		  					
			   					<h2 class="accountX">Movie ID:</h2>
			     				<input id="movieId" name="movieId" size="20" minlength="5" maxlength="5" value="<%=movieId%>" />
								<p/>
								   				   	
			   				   	<br/>
			   				   	<p>   					
			   					<h2 class="accountX">Name:</h2>
			     				<input id="name" name="name" size="30"  minlength="1" maxlength="30" value="<%=name%>" />
			  					<p/>
			  					 				   	
			   				   	<br/>
			   				   	<p>   					  				 
			     				<h2 class="accountX">Banner :</h2>
			     				<input id="banner" name="banner" size="30" minlength="4" maxlength="20" value="<%=banner%>" />
			  					<p/>
			  					 				   	
			   				   	<br/>
			   				   	<p>   				 	
								<h2 class="accountX">Release Date:</h2>
			   					<select class="required" id="date" name="date">
			     					<option value="">Please Select</option>
			 					  <%
			 					  	for (String key : movies.keySet()) { 						  
			 					  		String selectedMovieAttr="";
			 						  	if(key.equals(movie)){
			 						  		selectedMovieAttr="selected=\"selected\"";			  		
			 						  	}	
			 							out.println("<option "+selectedMovieAttr+" value=\""+key+"\">"+movies.get(key)+"</option>"); 			 
			 						}
			 					  %> 	
			 					  </select>	
			 					<p/>
						   	   	<br/>

			   				   	<br/>
			   				   	<p>   				 	
								<h2 class="accountX">Rent Amount:</h2>
				            	<input name="rentAmount" id="rentAmount"  size="15" minlength="1" maxlength="10" value="<%=rentAmount%>" />
			   					<p/>
						   	   	<br/>

			   				   	<p>	          	
			 		     		<h2 class="accountX">Availability :</h2>
			     				<input class ="checkbox" name="availability" id="availability" type ="checkbox"<%=availability%> value="<%=availability%>">     			 	
			 					  				
					            <input type="submit" name="submit" value=" Start Searching " class="bt_login" id="SearchMovie" />
					            <input type="hidden" name="FunctionCall" value="Logon">
			 					<p/>  		
			   				   	
						</div>
  	 	
  				    <div id="tabs-4">
  				    </div>
					
  				    <div id="tabs-5">
<table cellpadding="0" cellspacing="0" border="0" class="display" id="example" style="width:940px">
	<thead>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			<th>Platform(s)</th>
			<th>Engine version</th>
			<th>CSS grade</th>
		</tr>
	</thead>
	<tbody>
		<tr class="gradeX">
			<td>Trident</td>
			<td>Internet
				 Explorer 4.0</td>
			<td>Win 95+</td>
			<td class="center">4</td>
			<td class="center">X</td>
		</tr>
		<tr class="gradeC">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.0</td>
			<td>Win 95+</td>
			<td class="center">5</td>
			<td class="center">C</td>
		</tr>
		</tbody>
</table>
		</div>

  				    <div id="tabs-6">
 <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" style="width:940px">
	<thead>
		<tr>
			<th>Rendering engine</th>
			<th>Browser</th>
			<th>Platform(s)</th>
			<th>Engine version</th>
			<th>CSS grade</th>
		</tr>
	</thead>
	<tbody>
		<tr class="gradeX">
			<td>Trident</td>
			<td>Internet
				 Explorer 4.0</td>
			<td>Win 95+</td>
			<td class="center">4</td>
			<td class="center">X</td>
		</tr>
		<tr class="gradeC">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.0</td>
			<td>Win 95+</td>
			<td class="center">5</td>
			<td class="center">C</td>
		</tr>
		<tr class="gradeA">
			<td>Trident</td>
			<td>Internet
				 Explorer 5.5</td>
			<td>Win 95+</td>
			<td class="center">5.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Trident</td>
			<td>Internet
				 Explorer 6</td>
			<td>Win 98+</td>
			<td class="center">6</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Trident</td>
			<td>Internet Explorer 7</td>
			<td>Win XP SP2+</td>
			<td class="center">7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Trident</td>
			<td>AOL browser (AOL desktop)</td>
			<td>Win XP</td>
			<td class="center">6</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 1.0</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 1.5</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 2.0</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Firefox 3.0</td>
			<td>Win 2k+ / OSX.3+</td>
			<td class="center">1.9</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Camino 1.0</td>
			<td>OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Camino 1.5</td>
			<td>OSX.3+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape 7.2</td>
			<td>Win 95+ / Mac OS 8.6-9.2</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape Browser 8</td>
			<td>Win 98SE+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Netscape Navigator 9</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.0</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.1</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.2</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.2</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.3</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.3</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.4</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.4</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.5</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.6</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">1.6</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.7</td>
			<td>Win 98+ / OSX.1+</td>
			<td class="center">1.7</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Mozilla 1.8</td>
			<td>Win 98+ / OSX.1+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Seamonkey 1.1</td>
			<td>Win 98+ / OSX.2+</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Gecko</td>
			<td>Epiphany 2.20</td>
			<td>Gnome</td>
			<td class="center">1.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 1.2</td>
			<td>OSX.3</td>
			<td class="center">125.5</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 1.3</td>
			<td>OSX.3</td>
			<td class="center">312.8</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 2.0</td>
			<td>OSX.4+</td>
			<td class="center">419.3</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Safari 3.0</td>
			<td>OSX.4+</td>
			<td class="center">522.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>Google Chrome 1.0</td>
			<td>Win XP+</td>
			<td class="center">525</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>OmniWeb 5.5</td>
			<td>OSX.4+</td>
			<td class="center">420</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>iPod Touch / iPhone</td>
			<td>iPod</td>
			<td class="center">420.1</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Webkit</td>
			<td>S60</td>
			<td>S60</td>
			<td class="center">413</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 7.0</td>
			<td>Win 95+ / OSX.1+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 7.5</td>
			<td>Win 95+ / OSX.2+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 8.0</td>
			<td>Win 95+ / OSX.2+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 8.5</td>
			<td>Win 95+ / OSX.2+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 9.0</td>
			<td>Win 95+ / OSX.3+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 9.2</td>
			<td>Win 88+ / OSX.3+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera 9.5</td>
			<td>Win 88+ / OSX.3+</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Opera for Wii</td>
			<td>Wii</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Nokia N800</td>
			<td>N800</td>
			<td class="center">-</td>
			<td class="center">A</td>
		</tr>
		<tr class="gradeA">
			<td>Presto</td>
			<td>Nintendo DS browser</td>
			<td>Nintendo DS</td>
			<td class="center">8.5</td>
			<td class="center">C/A<sup>1</sup></td>
		</tr>
	</tbody>
</table>
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
 