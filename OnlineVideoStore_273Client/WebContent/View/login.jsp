<%  
	String loggedInUser = (String)session.getAttribute("loggedInUser");
 
%>
<!-- Panel -->
<div id="toppanel">
	<div id="panel">
		<div class="content clearfix">
		
			<div class="left">
				<!-- Login Form -->
				<form  id="form1" class="clearfix" action="Index" onsubmit="return loginvalidateForm()" method="post">
					<h1>Member Login</h1>
					<label class="grey" for="log"><h2>Username:</h2></label>
					<input class="field" type="text" name="user" id="user" value="" size="23" />
					<label class="grey" for="pwd"><h2>Password:</h2></label>
					<input class="field" type="password" name="pass" id="pass" size="23" />
	            	<label class="grey" for="remember"><h2>Remember me:</h2></label>
	            	<input class="checkbox" name="rememberme" id="rememberme" type="checkbox" checked="checked" value="forever" />
	            	        			
        			<div class="clear"></div>
					<input type="submit" name="submit" value="Login" class="bt_login" id="Logon" />
					<input type="hidden" name="FunctionCall" value="Logon">
					<a class="lost-pwd" href="#"><h2>Lost your password?</h2></a>
				</form>
			</div>
			<div class="left right">			
				<!-- Register Form -->
				<form id="validateForm" action="Index" onsubmit="return validateForm()" method="post">
					<h1>Not a member yet? Sign Up!</h1>				
					<label class="grey" for="signup"><h2>Username:</h2></label>
					<input class="field" type="text" name="user" id="user" value="" size="23" />
			 
					<label class="grey" for="lastN"><h2>Last Name:</h2></label>
					<input class="field" type="text" name="lastN" id="lastN" size="23" />
					
					<label class="grey" for="firstN"><h2>First Name:</h2></label>
					<input class="field" type="text" name="firstN" id="firstN" size="23" />
				
					<label class="grey" for="pass"><h2>Password:</h2></label>
					<input class="field" type="password" name="pass" id="pass" size="23" />
					
					
					<!-- (1 = simple member; 2 = premium member) -->
					<label class="grey" for="premium"><h2>Premium:</h2></label>
	            	<input class="checkbox" name=userType id="userType" type="checkbox" checked="checked" value="2" />
	            	
		
					<input type="hidden" name="FunctionCall" value="Signon">
					<input type="submit" name="submit" value="Register" class="bt_register" />
				</form>
			</div>
		</div>
	</div> <!-- /login -->	

	<!-- The tab on top -->	
	<div class="tab">
		<ul class="login">
			<li class="left">&nbsp;</li>
			<% 
				
				if(loggedInUser!=null){
					out.println("<li>Hello " + loggedInUser + "!</li>" );
				}else{
					out.println("<li>Hello Guest!</li>" );
				}
			%>			
			<li class="sep">|</li>
			<li id="toggle">
				<a id="open" class="open" href="#">Log In | Register</a>
				<a id="close" style="display: none;" class="close" href="#">Close Panel</a>			
			</li>
			<li class="right">&nbsp;</li>
		</ul> 
	</div> <!-- / top -->
	
</div> <!--panel -->