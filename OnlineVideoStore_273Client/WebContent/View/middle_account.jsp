
<%@ page import="video.dto.Person"%>
<%@ page import="video.dto.Movie"%>
<%@ page import="video.dto.Address"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="video.util.CountryHelper"%>
<%@ page import="video.util.StateHelper"%>
<%@ page import="video.util.MovieSearchHelper"%>
<%@ page import="video.dto.Account;"%>
<%
	LinkedHashMap<String, String> countries = (LinkedHashMap<String, String>) CountryHelper.countries;
	LinkedHashMap<String, String> states = (LinkedHashMap<String, String>) StateHelper.states;
	LinkedHashMap<String, String> movies = (LinkedHashMap<String, String>) MovieSearchHelper.states;

	int simpleM = 1;
	int premiumM = 2;

	Person person = (Person) request.getAttribute("person");
	String firstN = "", lastN = "", pwd = "", userN = "";
	java.util.Date reg = new java.util.Date();
	java.util.Date lastLogin = new java.util.Date();

	if (person != null) {
		firstN = person.getFirstName();
		lastN = person.getLastName();
		pwd = person.getPassword();
		lastLogin = person.getLast_login().getTime();
		reg = person.getRegistration().getTime();
		userN = person.getUsername();
	}

	Account account = (Account) request.getAttribute("account");
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

	if (account != null) {
		bal = account.getBalance();
		fee = account.getMonthlyFee();
		outstand = account.getOutstandingMovies();
		userId = account.getPersonId();
		System.out.println(userId);
		ssn = ((ssn = account.getSsn()) == null) ? "" : ssn;
		userType = account.getUserType();
		System.out.println(userType);
		accountId = account.getId();

		//(1 = simple member; 2 = premium member)
		if (userType == simpleM) {
			userTypeStr = "";
		} else if (userType == premiumM) {
			userTypeStr = "Checked";
		}
	}

	Address address = (Address) request.getAttribute("address");
	String city = "", country = "", state = "", st = "", zip = "", movie = "";

	if (address != null) {
		city = address.getCity();
		country = address.getCountry();
		state = address.getState();
		st = address.getStreet();
		zip = address.getZip();
	}

	Movie[] movieList = (Movie[]) request.getAttribute("movieList");
%>



<div class="rright">
	<!-- Register Form -->
	<form id="advertForm" action="Account" method="post">
		<h1>Your Account Info</h1>



		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">User</a>
				</li>
				<li><a href="#tabs-2">Account</a>
				</li>
				<li><a href="#tabs-3">Address</a>
				</li>
				<li><a href="#tabs-4">Movie Search/Renting </a>
				</li>
				<li><a href="#tabs-5">Movie Return</a>
				</li>
				<li><a href="#tabs-6">Movie Listing/Renting</a>
				</li>
			</ul>
			<div id="tabs-1">

				<p>
				<h2 class="accountX">
					User Name:<em>*</em>
				</h2>
				<input id="name" name="name" size="30" class="required"
					minlength="1" value="<%=userN%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">
					First Name:<em>*</em>
				</h2>
				<input id="fname" name="fname" size="30" class="required"
					minlength="1" value="<%=firstN%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">
					Last Name:<em>*</em>
				</h2>
				<input id="lname" name="lname" size="30" class="required"
					minlength="1" value="<%=lastN%>" />
				<p />
				<input type="hidden" name="FunctionCall" value="UpdateUser">
				<input type="hidden" name="accountId" value="<%=accountId%>">
				<input type="hidden" name="userId" value="<%=userId%>"> <br />
				<p>
					<input type="submit" name="submit" value="Update Account"
						class="bt_advert" />
				</p>

			</div>
			<div id="tabs-2">

				<br />
				<p>
				<h2 class="accountX">
					Password:<em>*</em>
				</h2>
				<input id="pwd" name="pwd" size="30" class="required" minlength="1"
					value="<%=pwd%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Last Login:</h2>
				<input id="lastLogin" name="lastLogin" size="30" disabled="disabled"
					value="<%=lastLogin%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Registered On:</h2>
				<input id="registration" name="registration" size="30"
					disabled="disabled" value="<%=reg%>" />
				<p />

				<br />
				<p>
					<%
						if (userType == simpleM) {
					%>
				
				<h2 class="accountX">Balance:</h2>
				<input id="bal" name="bal" size="30" disabled="disabled"
					value="<%=bal%>" />
				<%
					} else if (userType == premiumM) {
				%>
				<h2 class="accountX">Monthly Fee:</h2>
				<input id="fee" name="fee" size="30" disabled="disabled"
					value="<%=fee%>" />
				<%
					}
				%>
				<p />

				<br />
				<p>
				<h2 class="accountX">Outstanding Movies:</h2>
				<input id="outstand" name="outstand" size="30" disabled="disabled"
					value="<%=outstand%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">User ID:</h2>
				<input id="userId" name="userId" size="30" disabled="disabled"
					value="<%=userId%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">
					Membership #:<em>*</em>
				</h2>
				<input id="ssn" name="ssn" size="30" class="required" minlength="9"
					maxlength="9" value="<%=ssn%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">Premium:</h2>
				<input class="checkbox" name=userType id="userType" type="checkbox"
					<%=userTypeStr%> value="<%=userType%>" />
				<p />
				<input type="hidden" name="FunctionCall" value="UpdateUser">
				<input type="hidden" name="accountId" value="<%=accountId%>">
				<input type="hidden" name="userId" value="<%=userId%>"> <br />
				<p>
					<input type="submit" name="submit" value="Update Account"
						class="bt_advert" />
				</p>



			</div>
			<div id="tabs-3">
				<br />
				<p>
				<h2 class="accountX">
					Street:<em>*</em>
				</h2>
				<input id="st" name="st" size="30" class="required" minlength="4"
					maxlength="30" value="<%=st%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">
					city:<em>*</em>
				</h2>
				<input id="city" name="city" size="30" class="required"
					minlength="4" maxlength="30" value="<%=city%>" />
				<p />

				<br />
				<p>
				<h2 class="accountX">
					State:<em>*</em>
				</h2>
				<select class="required" id="state" name="state">
					<option value="">Please Select</option>
					<option value="xx">NOT LISTED</option>
					<%
						for (String key : states.keySet()) {
							String selectedState = "";
							if (key.equals(state)) {
								selectedState = "selected=\"selected\"";
							}
							out.println("<option " + selectedState + " value=\"" + key
									+ "\">" + states.get(key) + "</option>");
						}
					%>
				</select>
				<p />

				<br />
				<p>
				<h2 class="accountX">
					Country:<em>*</em>
				</h2>
				<select class="required" id="country" name="country">
					<option value="">Please Select</option>
					<%
						for (String key : countries.keySet()) {
							String selected = "";
							if (key.equals(country)) {
								selected = "selected=\"selected\"";
							}
							out.println("<option " + selected + " value=\"" + key + "\">"
									+ countries.get(key) + "</option>");
						}
					%>
				</select>
				<p />


				<br />
				<p>
				<h2 class="accountX">
					Zip:<em>*</em>
				</h2>
				<input id="zip" name="zip" size="30" class="required" minlength="5"
					maxlength="10" value="<%=zip%>" />
				<p />
				<input type="hidden" name="FunctionCall" value="UpdateUser">
				<input type="hidden" name="accountId" value="<%=accountId%>">
				<input type="hidden" name="userId" value="<%=userId%>"> <br />
				<p>
					<input type="submit" name="submit" value="Update Account"
						class="bt_advert" />
				</p>


			</div>
			<div id="tabs-4">
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
					name="FunctionCall" value="Logon">
				<p />

			</div>
			<div id="tabs-5"></div>
			<div id="tabs-6">
				<form id="adminForm" action="admin" method="post">
					<input id='btnP' type="hidden" name="buttonPressed" value="" /> <input
						type="hidden" name="FunctionCall" value="rentMovie" />

					<table cellpadding="0" cellspacing="0" border="0" class="display"
						id="example">
						<thead>
							<tr>
								<th>Movie ID</th>
								<th>Name</th>
								<th>Banner</th>
								<th>Release Date</th>
								<th>Rent Amount</th>
								<th>Available Number</th>
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

										long id = p.getId();
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
										out.println("	<td class=mycolor>" + releaseDate_Calendar.get(Calendar.YEAR) + "</td>");
										out.println("	<td class=mycolor>" + movieRentAmount + "</td>");
										out.println("	<td class=mycolor>" + nb_Aailable + "</td>");
										out.println("	<td class=\"center\">");
										// Ok, onclikc means when you click on the button, then it calls the javascript function 
										// to change the hidden value ( the person id), then the servlet knows which person to delete!!
										out.println("		<input type=\"submit\" name=\"submit\" value=\" Rent \" onclick=\"changeHiddenValue('"
												+ id + "');\"  class=\"bt_advert\" />");
										out.println("	</td>");
										out.println("</tr>");
										//toggle					
										isOdd = !isOdd;
									}
								}
							%>

						</tbody>
						<tfoot>
							<tr>
								<th>Movie ID</th>
								<th>Name</th>
								<th>Banner</th>
								<th>Release Date</th>
								<th>Rent Amount</th>
								<th>Available Number</th>
								<th>Option</th>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>

			<br />
	</form>
</div>
