<% 
	String loggedInUser = (String)session.getAttribute("loggedInUser");
	String activePage = (String)request.getAttribute("ActivePage"); 
	String HOME = "";
	String ACCOUNT = "";
	String ADMIN = "";
	
	if(activePage!=null){
		
		if(activePage.equals("HOME")){
			HOME = "class=\"active\"";
		}
		
		if(activePage.equals("ACCOUNT")){
			ACCOUNT = "class=\"active\"";
		}
		
		if(activePage.equals("ADMIN")){
			ADMIN = "class=\"active\"";
		}
		
	}
%>

<!-- Header -->
	<div id="header">
		<h1 id="logo"><a href="#">Online Movie Hunter</a></h1>
		<div class="social">
			<span>FOLLOW US ON:</span>
			<ul>
			    <li><a class="twitter" href="#">twitter</a></li>
			    <li><a class="facebook" href="#">facebook</a></li>
			    <li><a class="vimeo" href="#">vimeo</a></li>
			    <li><a class="rss" href="#">rss</a></li>
			</ul>
		</div>
		
		<!-- Navigation -->
		<div id="navigation">
			<ul>
			    <li><a <%=HOME%> href="Index">HOME</a></li>
			    <li><a href="#">NEWS</a></li>
			    <li><a href="#">IN THEATERS</a></li>
			    <li><a href="#">COMING SOON</a></li>
			    <li><a href="#">CONTACT</a></li>
			    <li><a href="#">ADVERTISE</a></li>
			</ul>
		</div>
		<!-- end Navigation -->
		
		<!-- Sub-menu -->
		<% 
		String onClick = "";
		 if(loggedInUser!=null){
			onClick = "#";
		  }else{
		   onClick = "\"show_alert();return false\"";
		  }
		%>
		<div id="sub-navigation">
			<ul>
			    <li><a href="#">SHOW ALL</a></li>
			    <li><a href="#">LATEST TRAILERS</a></li>
			    <li><a href="#">TOP RATED</a></li>
			    <li><a href="#">MOST COMMENTED</a></li>
			    
				<% if(loggedInUser!=null){	%>	
					
						<% if(loggedInUser.equals("admin")){	%>			
							<li><a <%=ADMIN%> href="Admin" onClick=<%out.print(onClick); %> class="aw">ADMIN</a></li>
 						<% }%>
 					
						<li><a <%=ACCOUNT%> href="Account" onClick=<%out.print(onClick); %> class="aw">ACCOUNT</a></li>
 
				  	   	<form name="myform" action='Index' method='post'>				  	   		  
				  	   		<li><a href="javascript: submitform()">LOGOUT</a></li>
				  	   		<input type="hidden" name="FunctionCall" value="Logout">
				  	   	</form>
				<% }%>
			</ul>
			<div id="search">
				<form action="home_submit" method="get" accept-charset="utf-8">
					<label for="search-field">SEARCH</label>					
					<input type="text" name="search field" value="Enter search here" id="search-field" title="Enter search here" class="blink search-field"  />
					<input type="submit" value="GO!" class="search-button" />
				</form>
			</div>
		</div>
		<!-- end Sub-Menu -->
		
	</div>
	<!-- end Header -->