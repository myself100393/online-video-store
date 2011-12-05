
<%@ page import="video.dto.Person"%>
<%@ page import="video.dto.Movie"%>
<%@ page import="video.dto.Address"%>
<%@ page import="java.util.Locale"%>
<%@ page import="java.util.UUID"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="video.util.CountryHelper"%>
<%@ page import="video.util.StateHelper"%>
<%@ page import="video.util.MovieSearchHelper"%>
<%@ page import="video.dto.Account;"%>


<%
	String movie = "";
	int movieId = 0;
	String banner = "";
	String name = "";
	boolean availability = false;
	int rentAmount = 0;

	LinkedHashMap<String, String> movies = (LinkedHashMap<String, String>) MovieSearchHelper.states;
%>


<div class="rright">
	<!-- Register Form -->
	<form id="adminForm" action="Admin" method="post">
		<h1>Your Account Info</h1>



		<div id="tabs">
			<ul>
				<li><a href="#tabs-1">Create Movie</a></li>
				<li><a href="#tabs-2">Movie Searching</a></li>
				<li><a href="#tabs-3">Movie Listing</a></li>
				<li><a href="#tabs-4">Customer Searching</a></li>
				<li><a href="#tabs-5">Customer Listing</a></li>
				<li><a href="#tabs-6">Bill Generating</a></li>
			</ul>
			<div id="tabs-1">

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
				<input name="rentAmount" id="rentAmount" size="10" minlength="1"
					maxlength="10" value="<%=rentAmount%>" />
				<p />
				<br /> <br />
				<p>
				<h2 class="accountX">Number of Available Movie :</h2>
				<input name="availability" id="availability" size="10" minlength="1"
					maxlength="10" value="<%=""%>" /> <input type="submit"
					name="submit" value=" Submit " class="bt_login" id="CreateMovie" />
				<input type="hidden" name="FunctionCall" value="Logon">
				<p />


			</div>

			<div id="tabs-2">
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
			<div id="tabs-3">

				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="jQTable_Movie" style="width: 940px">
					<thead>
						<tr>
							<th>Movie ID</th>
							<th>Name</th>
							<th>Banner</th>
							<th>Release Date</th>
							<th>Rent Amount</th>
							<th>Availability</th>
							<th>Option</th>
						</tr>
					</thead>
					<tbody>
						<%
							/*			if (personList != null) {

											boolean isOdd = true;
											String evenOdd = "odd";

											int j = 1;   */

							// you should be loop all your data out here
							/*		for (Person p : personList) {

										long id = p.getId();
										String fname = p.getFirstName();
										String lname = p.getLastName();
										String uname = p.getUsername();   */
							// other attributes here...............		

							/*		out.println("<tr class=\"" + ((isOdd) ? "odd" : "even")
											+ " gradeA\">");
									out.println("	<td>" + fname + "</td>");
									out.println("	<td>" + lname + "</td>");
									out.println("	<td>" + uname + "</td>");
									out.println("	<td class=\"center\">");  */
							// Ok, onclikc means when you click on the button, then it calls the javascript function 
							// to change the hidden value ( the person id), then the servlet knows which person to delete!!
							/*		out.println("		<input type=\"submit\" name=\"submit\" value=\"Rent\" onclick=\"changeHiddenValue('"
											+ id + "');\"  class=\"bt_advert\" />");
									out.println("	</td>");
									out.println("</tr>");     */
							//toggle					
							//		isOdd = !isOdd;
							//		}
							//	}
						%>


						<tr class="yes">
							<td>01234</td>
							<td>Rise of the Planet of the Apes</td>
							<td>Monkey Story</td>
							<td>2011</td>
							<td>10</td>
							<td class="yes">Yes</td>

							<td><input id='btnP' type="hidden" name="buttonPressed"
								value="" /> <input type="hidden" name="FunctionCall"
								value="deletePerson" /> <input type="submit" name="submit"
								value="Delete" onclick="changeHiddenValue(id)" class="bt_advert" />
							</td>

						</tr>
						<tr class="yes">
							<td>45345</td>
							<td>Awake</td>
							<td>Holloween Movie</td>
							<td>2010</td>
							<td>10</td>
							<td class="yes">Yes</td>
							<td><input id='btnP' type="hidden" name="buttonPressed"
								value="" /> <input type="hidden" name="FunctionCall"
								value="deletePerson" /> <input type="submit" name="submit"
								value="Delete" onclick="changeHiddenValue(id)" class="bt_advert" />
							</td>

						</tr>
						<tr class="yes">
							<td>56456</td>
							<td>Smurf</td>
							<td>Animation</td>
							<td>2011</td>
							<td>10</td>
							<td class="yes">Yes</td>
							<td><input id='btnP' type="hidden" name="buttonPressed"
								value="" /> <input type="hidden" name="FunctionCall"
								value="deletePerson" /> <input type="submit" name="submit"
								value="Delete" onclick="changeHiddenValue(id)" class="bt_advert" />
							</td>

						</tr>
						<tr class="yes">
							<td>56576</td>
							<td>American Captain</td>
							<td>Marvel</td>
							<td>2011</td>
							<td>5</td>
							<td class="yes">Yes</td>
							<td><input id='btnP' type="hidden" name="buttonPressed"
								value="" /> <input type="hidden" name="FunctionCall"
								value="deletePerson" /> <input type="submit" name="submit"
								value="Delete" onclick="changeHiddenValue(id)" class="bt_advert" />
							</td>

						</tr>
						<tr class="no">
							<td>01234</td>
							<td>Resident Evil V</td>
							<td>Game,Action</td>
							<td>2013</td>
							<td>0</td>
							<td class="no">No</td>
							<td><input id='btnP' type="hidden" name="buttonPressed"
								value="" /> <input type="hidden" name="FunctionCall"
								value="deletePerson" /> <input type="submit" name="submit"
								value="Delete" onclick="changeHiddenValue(id)" class="bt_advert" />
							</td>

						</tr>

					</tbody>
				</table>

			</div>

			<div id="tabs-4">
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
			</div>

			<div id="tabs-5">
				<table cellpadding="0" cellspacing="0" border="0" class="display"
					id="example" style="width: 940px">
					<thead>
						<tr>
							<th>Customer ID</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>User Name</th>
							<th>Date of Registration</th>
							<!-- <th>Last Time Login</th>--->
						</tr>
					</thead>
					<tbody>
						<tr class="gradeX">
							<td>Trident</td>
							<td>Internet Explorer 4.0</td>
							<td>Win 95+</td>
							<td class="center">4</td>
							<td class="center">X</td>
						</tr>
						<tr class="gradeC">
							<td>Trident</td>
							<td>Internet Explorer 5.0</td>
							<td>Win 95+</td>
							<td class="center">5</td>
							<td class="center">C</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>Internet Explorer 5.5</td>
							<td>Win 95+</td>
							<td class="center">5.5</td>
							<td class="center">A</td>
						</tr>
						<tr class="gradeA">
							<td>Trident</td>
							<td>Internet Explorer 6</td>
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

					</tbody>
				</table>
			</div>
			<div id="tabs-6">
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
