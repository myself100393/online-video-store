
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title></title>
<meta name="description" content="">
<meta name="keywords" content="">
 
 
  
  	<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />	
  	<link rel="stylesheet" href="css/slide.css" type="text/css" media="screen" />
  	<link rel="stylesheet" href="css/table.css" type="text/css" media="screen" />
  	<link rel="stylesheet" href="css/table.css" type="text/css" media="screen" />
  	<link type="text/css" href="css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />	
  	
  	<link href="css/messageBox.css" rel="stylesheet" type="text/css" />

    <!-- jQuery - the core -->
	<script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="js/jquery-func.js"></script>	
	
	<script src="js/jquery-ui.js" type="text/javascript"></script>

	<!-- Sliding effect -->
	<script src="js/slide.js" type="text/javascript"></script>
	<!-- Validate -->
	<script src="js/validate.js" type="text/javascript"></script>
	<!-- Validate -->
	<script src="js/jquery.validate.js" type="text/javascript"></script>
	<!-- DataTable1 -->
    <script src="js/jquery.dataTables.js" type="text/javascript"></script>
			<script type="text/javascript" charset="utf-8">
			/* Formating function for row details */
			$(document).ready( function() {
		     
			    /* Init DataTables */
				var oTable = $('#jQTable_Movie').dataTable( {
					"bJQueryUI": true,
					//"sPaginationType": "full_numbers",
					"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
						"aaSorting": [ [0,'asc'], [1,'asc'] ],
						"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
				} );
			} );
		
		</script>
	
	<!-- DataTable2 -->
    <script src="js/jquery.dataTables.js" type="text/javascript"></script>
			<script type="text/javascript" charset="utf-8">
			$(document).ready( function() {
			    /* Init DataTables */
				var oTable = $('#example').dataTable( {
					"bJQueryUI": true,
					//"sPaginationType": "full_numbers",
					//"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
						"aaSorting": [ [0,'asc'], [1,'asc'] ],
						"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
				} );
			} );
		</script>
 
</head>

<body>
	<% String user = (String)session.getAttribute("loggedInUser"); %>
	<jsp:include page="/View/login.jsp" />
	<jsp:include page="/View/top.jsp" />
<!-- Shell -->
<div id="shell">
	<%	 
		String error = (String)request.getAttribute("errorInfo"); 
		if(error!=null){out.println("<div class=\"ser_error\">" + error +"</div>");}
				
		String success = (String)request.getAttribute("success");
		if(success!=null){out.println("<div class=\"ser_success\">" + success +"</div>");}				
	%>
	
	<!-- Main -->
	<div id="main">
		<!-- Content -->
		<div id="content">
  
 
  
  		<jsp:include page="/View/middle_account.jsp" />
  
  
			
		</div>
		<!-- end Content -->
 
		
		
		<div class="cl">&nbsp;</div>
	</div>
	<!-- end Main -->

	<jsp:include page="/View/footer.jsp" />
</div>
<!-- end Shell -->
</body>
</html>