
<%@ page import="video.dto.Person"%>
<%@ page import="video.dto.Movie"%>
<%@ page import="video.dto.Address"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="video.util.CountryHelper"%>
<%@ page import="video.util.StateHelper"%>
<%@ page import="video.util.MovieSearchHelper"%>
<%@ page import="video.dto.Account"%>


<%
	String movie = "";
	int movieId = 0;
	String banner = "";
	String name = "";
	boolean availability = false;
	int rentAmount = 0;

	LinkedHashMap<String, String> movies = (LinkedHashMap<String, String>) MovieSearchHelper.states;
	
	String successMessage = (String)session.getAttribute("success");
	
	Movie[] movieList = (Movie[]) request.getAttribute("movieList");
	Person[] personList_SimpleM = (Person[]) request.getAttribute("personList_SimpleM");
	Person[] personList_PremiumM = (Person[]) request.getAttribute("personList_PremiumM");
	Person[] personList_All_Person = (Person[]) request.getAttribute("personList_All_Person");

%>


<div class="rright">
	<!-- Register Form -->
	
		<h1>Admin Panel</h1>
		
	

		<div id="tabs">
		<form id="adminForm" action="Admin" method="post">
			<ul>
				<li><a href="#tabs-1">Create Movie</a></li>
				<li><a href="#tabs-2">Movie Searching</a></li>
				<li><a href="#tabs-3">Movie Listing</a></li>
				<li><a href="#tabs-4">Customer Searching</a></li>
				<li><a href="#tabs-5">Simple Customers</a></li>
				<li><a href="#tabs-6">Premium Customers</a></li>
				<li><a href="#tabs-7">All Customers</a></li>
				<li><a href="#tabs-8">Bill Generating</a></li>
			</ul>
			<div id="tabs-1">

				<br />
				<p>
				<h2 class="accountX">Name:</h2>
				<input id="name" name="name" size="60" minlength="1" maxlength="60"
					value="<%=name%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Banner :</h2>
				<input id="banner" name="banner" size="60" minlength="4"
					maxlength="60" value="<%=banner%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Release Date:</h2>
				<select class="required" id="date" name="releaseDate">
					<option value="">Please Select</option>
					<%
						for (String key : movies.keySet()) {
							String selectedMovieAttr = "";
							if (key.equals(movie)) {
								selectedMovieAttr = "selected=\"selected\"";
							}
							out.println("<option " + selectedMovieAttr + " value=\"" + movies.get(key)
									+ "\">" + movies.get(key) + "</option>");
						}
					%>
				</select>
				<p />
				<br /> <br />
				<p>
				<h2 class="accountX">Rent Amount:</h2>
				$ <input name="rentAmount" id="rentAmount" size="10" minlength="1"
					maxlength="10" value="<%=rentAmount%>" />
				<p />
				<br /> <br />
				<p>
				<h2 class="accountX">Number of Available Movies :</h2>
						<input type="hidden" name="FunctionCall" value="CreateMovie">
				<input name="nbAvailable" id="availability" size="10" minlength="1"
					maxlength="10" value="<%=""%>" /> <input type="submit"
					name="submit" value=" Submit " class="bt_login" id="CreateMovie" />
		
				<p />

</form>
			</div>
			
			<div id="tabs-2">
			<form id="adminForm1" action="Admin" method="post">
				<br />
				<p>
				<h2 class="accountX">Movie ID:</h2>
				<input id="movieId" name="movieId" size="20" minlength="5"
					maxlength="5" value="<%=movieId%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Name:</h2>
				<input id="name" name="name" size="30" minlength="1" maxlength="30"
					value="<%=name%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Banner :</h2>
				<input id="banner" name="banner" size="30" minlength="4"
					maxlength="20" value="<%=banner%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Release Date:</h2>
				<select class="required" id="date" name="date">
					<option value="">Please Select</option>
					<%
						for (String key : movies.keySet()) {
							String selectedMovieAttr = "";
							if (key.equals(movie)) {
								selectedMovieAttr = "selected=\"selected\"";
							}
							out.println("<option " + selectedMovieAttr + " value=\"" + key
									+ "\">" + movies.get(key) + "</option>");
						}
					%>
				</select>
				<p />
				<br /> <br />
				<p>
				<h2 class="accountX">Rent Amount:</h2>
				<input name="rentAmount" id="rentAmount" size="15" minlength="1"
					maxlength="10" value="<%=rentAmount%>" />
				<p />
				<br />

				<p>
				<h2 class="accountX">Availability :</h2>
				<input class="checkbox" name="availability" id="availability"
					type="checkbox" <%=availability%> value="<%=availability%>">

				<input type="submit" name="submit" value=" Start Searching "
					class="bt_login" id="SearchMovie" /> <input type="hidden"
					name="FunctionCall" value="SearchMovie">
				<p />
</form>

			</div>
			<div id="tabs-3">
			<form id="movieListingForm" action="Admin" method="post">
				<input id='btnP' type="hidden" name="buttonPressed_Delete_Movie" value="" /> <input
					type="hidden" name="FunctionCall" value="" />

				<input id='btnP' type="hidden" name="buttonPressed_Update" value="" /> 

				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="jQMovie_List">
					<thead>
						<tr>
							<th>Movie ID</th>
							<th>Name</th>
							<th>Banner</th>
							<th>Release Date</th>
							<th>Rent Amount</th>
							<th>Available Number</th>
							<th>Option</th>
                            <th>Option</th>
						</tr>
					</thead>
					<tbody>

						<%
							if (movieList != null) {

								boolean isOdd = true;
								String evenOdd = "odd";

								int j = 1;

								// you should be loop all your data out here
								for (Movie p : movieList) {

									int id = p.getId();
									String moviName = p.getName();
									String movieBanner = p.getBanner();
									Calendar releaseDate_Calendar = p.getReleaseDate();
									Double movieRentAmount = p.getRentAmount();
									int nb_Aailable = p.getNbAvailable();
									// other attributes here...............		

									out.println("<tr class=\"" + ((isOdd) ? "odd" : "even")
											+ " gradeA\">");
									out.println("	<td class=mycolor>" + id + "</td>");
									out.println("	<td class=mycolor>" + moviName + "</td>");
									out.println("	<td class=mycolor>" + movieBanner + "</td>");
									out.println("	<td class=mycolor>"
											+ releaseDate_Calendar.get(Calendar.YEAR) + "</td>");
									out.println("	<td class=mycolor>" + movieRentAmount
											+ "</td>");
									out.println("	<td class=mycolor>" + nb_Aailable + "</td>");
									out.println("	<td class=\"center\">");
									// Ok, onclikc means when you click on the button, then it calls the javascript function 
									// to change the hidden value ( the movie id), then the servlet knows which movie to rent!!
									out.println("		<input type=\"submit\" name=\"submit\" value=\" Delete \" onclick=\"changeHiddenValue_1('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("	<td class=\"center\">");
									out.println("		<input type=\"submit\" name=\"submit\" value=\" Update \" onclick=\"changeHiddenValue_2('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("</tr>");
									//toggle					
									isOdd = !isOdd;
								}
							}
						%>

					</tbody>

				</table>
			</form>
			</div>

			<div id="tabs-4">
			<form id="adminForm3" action="Admin" method="post">
				<br />
				<p>
				<h2 class="accountX">Customer ID :</h2>
				<input id="cus_id" name="cus_id" size="30" minlength="4"
					maxlength="20" value="<%="0"%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">First Name:</h2>
				<input id="first_name" name="first_name" size="30" minlength="1"
					maxlength="30" value="<%=""%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Last Name :</h2>
				<input id="last_name" name="last_name" size="30" minlength="1"
					maxlength="20" value="<%=""%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">User Name :</h2>
				<input id="username" name="username" size="30" minlength="1"
					maxlength="20" value="<%=""%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Registration Date:</h2>
				<input name="reg_date" id="reg_date" size="15" minlength="1"
					maxlength="10" value="<%="YYYY-MM-DD"%>" />
				<p />
				<br /> <br />
				<p>
				<h2 class="accountX">Last Log in Date :</h2>
				<input name="last_login" id="last_login" size="15" minlength="1"
					maxlength="10" value="<%="YYYY-MM-DD"%>" /> <input type="submit"
					name="submit" value=" Start Searching " class="bt_login"
					id="SearchCustomer" /> <input type="hidden" name="FunctionCall"
					value="Logon">
				<p />
		</form>		
			</div>

			<div id="tabs-5">
			<form id="simpleMListingForm" action="" method="post">
				<input id='btnP' type="hidden" name="buttonPressed_Delete_SimpleM" value="" /> <input
					type="hidden" name="FunctionCall" value="deleteSimpleMember" />

				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="simpleMember_Table">
					<thead>
						<tr>
							<th>Customer ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>User Name</th>
							<th>Registration Date</th>
							<th>Last Time Logged In</th>
							<th>Option</th>
						</tr>
					</thead>
					<tbody>

						<%
							if (personList_SimpleM != null) {

								boolean isOdd = true;
								String evenOdd = "odd";

								int j = 1;

								// you should be loop all your data out here
								for (Person p : personList_SimpleM) {

									int id = p.getId();
									String fName = p.getFirstName();
									String lName = p.getLastName();
									String userName = p.getUsername();
									Calendar reg_Calendar = p.getRegistration();
									Calendar lastLogIn_Calendar = p.getLast_login();
									// other attributes here...............		

									out.println("<tr class=\"" + ((isOdd) ? "odd" : "even")
											+ " gradeA\">");
									out.println("	<td class=mycolor>" + id + "</td>");
									out.println("	<td class=mycolor>" + fName + "</td>");
									out.println("	<td class=mycolor>" + lName + "</td>");
									out.println("	<td class=mycolor>" + userName + "</td>");
									out.println("	<td class=mycolor>"
											+ reg_Calendar.get(Calendar.YEAR)+"-"+(reg_Calendar.get(Calendar.MONTH)+1)+"-"+ reg_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=mycolor>"
											+ lastLogIn_Calendar.get(Calendar.YEAR)+"-"+(lastLogIn_Calendar.get(Calendar.MONTH)+1)+"-"+ lastLogIn_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=\"center\">");
									// Ok, onclikc means when you click on the button, then it calls the javascript function 
									// to change the hidden value ( the movie id), then the servlet knows which movie to rent!!
									out.println("		<input type=\"submit\" name=\"submit\" value=\" Delete \" onclick=\"changeHiddenValue_3('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("</tr>");
									//toggle					
									isOdd = !isOdd;
								}
							}
						%>

					</tbody>
				</table>
			</form>
			</div>
			<div id="tabs-6">
			<form id="premiumMListingForm" action="" method="post">
				<input id='btnP' type="hidden" name="buttonPressed_Delete_PreM" value="" /> <input
					type="hidden" name="FunctionCall" value="deletePreMember" />

				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="premiumMember_Table">
					<thead>
						<tr>
							<th>Customer ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>User Name</th>
							<th>Registration Date</th>
							<th>Last Time Logged In</th>
							<th>Option</th>
						</tr>
					</thead>
					<tbody>

						<%
							if (personList_PremiumM != null) {

								boolean isOdd = true;
								String evenOdd = "odd";

								int j = 1;

								// you should be loop all your data out here
								for (Person p : personList_PremiumM) {

									int id = p.getId();
									String fName = p.getFirstName();
									String lName = p.getLastName();
									String userName = p.getUsername();
									Calendar reg_Calendar = p.getRegistration();
									Calendar lastLogIn_Calendar = p.getLast_login();
									// other attributes here...............		

									out.println("<tr class=\"" + ((isOdd) ? "odd" : "even")
											+ " gradeA\">");
									out.println("	<td class=mycolor>" + id + "</td>");
									out.println("	<td class=mycolor>" + fName + "</td>");
									out.println("	<td class=mycolor>" + lName + "</td>");
									out.println("	<td class=mycolor>" + userName + "</td>");
									out.println("	<td class=mycolor>"
											+ reg_Calendar.get(Calendar.YEAR)+"-"+(reg_Calendar.get(Calendar.MONTH)+1)+"-"+ reg_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=mycolor>"
											+ lastLogIn_Calendar.get(Calendar.YEAR)+"-"+(lastLogIn_Calendar.get(Calendar.MONTH)+1)+"-"+ lastLogIn_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=\"center\">");
									// Ok, onclikc means when you click on the button, then it calls the javascript function 
									// to change the hidden value ( the movie id), then the servlet knows which movie to rent!!
									out.println("		<input type=\"submit\" name=\"submit\" value=\" Delete \" onclick=\"changeHiddenValue_4('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("</tr>");
									//toggle					
									isOdd = !isOdd;
								}
							}
						%>

					</tbody>
				</table>
			</form>
			</div>
			
            <div id="tabs-7">
			<form id="allMListingForm" action="" method="post">
				<input id='btnP' type="hidden" name="buttonPressed_Delete_AllM" value="" /> <input
					type="hidden" name="FunctionCall" value="deleteInAllMember" />

					<table cellpadding="0" cellspacing="0" border="0" class="display"
						id="allMember_Table">
						<thead>
							<tr>
								<th>Customer ID</th>
								<th>First Name</th>
								<th>Last Name</th>
								<th>User Name</th>
								<th>Registration Date</th>
								<th>Last Time Logged In</th>
								<th>Option</th>
							</tr>
						</thead>
						<tbody>

							<%
							if (personList_PremiumM != null) {

								boolean isOdd = true;
								String evenOdd = "odd";

								int j = 1;

								// you should be loop all your data out here
								for (Person p : personList_PremiumM) {

									int id = p.getId();
									String fName = p.getFirstName();
									String lName = p.getLastName();
									String userName = p.getUsername();
									Calendar reg_Calendar = p.getRegistration();
									Calendar lastLogIn_Calendar = p.getLast_login();
									// other attributes here...............		

									out.println("<tr class=\"" + ((isOdd) ? "odd" : "even")
											+ " gradeA\">");
									out.println("	<td class=mycolor>" + id + "</td>");
									out.println("	<td class=mycolor>" + fName + "</td>");
									out.println("	<td class=mycolor>" + lName + "</td>");
									out.println("	<td class=mycolor>" + userName + "</td>");
									out.println("	<td class=mycolor>"
											+ reg_Calendar.get(Calendar.YEAR)+"-"+(reg_Calendar.get(Calendar.MONTH)+1)+"-"+ reg_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=mycolor>"
											+ lastLogIn_Calendar.get(Calendar.YEAR)+"-"+(lastLogIn_Calendar.get(Calendar.MONTH)+1)+"-"+ lastLogIn_Calendar.get(Calendar.DAY_OF_MONTH)+ "</td>");
									out.println("	<td class=\"center\">");
									// Ok, onclikc means when you click on the button, then it calls the javascript function 
									// to change the hidden value ( the movie id), then the servlet knows which movie to rent!!
									out.println("		<input type=\"submit\" name=\"submit\" value=\" Delete \" onclick=\"changeHiddenValue_5('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("</tr>");
									//toggle					
									isOdd = !isOdd;
								}
							}
						%>

						</tbody>
					</table>
				</form>
			            </div>

			<div id="tabs-8">
				<br />
				<p>
				<h2 class="accountX">Generate Bill for Premium Member</h2>
				<input type="submit" name="submit"
					value=" Start Generation Process " class="bt_login"
					id="SearchMovie" /> <input type="hidden" name="FunctionCall"
					value="Logon">
				<p />
			</div>
			<br />
	</form>
</div>
