<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title></title>
<meta name="description" content="">
<meta name="keywords" content="">
 
 
  
  	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />	
  	<link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" />
  	
  	<link href="css/messageBox.css" rel="stylesheet" type="text/css" />

    <!-- jQuery - the core -->
	<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-func.js"></script>	
	<!-- Sliding effect -->
	<script src="js/slide.js" type="text/javascript"></script>
	<!-- Validate -->
	<script src="js/validate.js" type="text/javascript"></script>
	
 
</head>

<body>
	<% String user = (String)session.getAttribute("loggedInUser"); %>
	<jsp:include page="/View/login.jsp" />
	<jsp:include page="/View/top.jsp" />
<!-- Shell -->
<div id="shell">
				<%
				
				String error = (String)request.getAttribute("errorInfo"); 
				if(error!=null){
					out.println("<div class=\"ser_error\">" + error +"</div>");
				}
				
				String success = (String)request.getAttribute("success");
				if(success!=null){
					out.println("<div class=\"ser_success\">" + success +"</div>");
				}				
				%>
	
	<!-- Main -->
	<div id="main">
		<!-- Content -->
		<div id="content">
  	 
  
  
  
  
			
		</div>
		<!-- end Content -->

		<jsp:include page="/View/news.jsp" />
		<jsp:include page="/View/coming.jsp" />
		
		
		<div class="cl">&nbsp;</div>
	</div>
	<!-- end Main -->

	<jsp:include page="/View/footer.jsp" />
</div>
<!-- end Shell -->
</body>
</html>