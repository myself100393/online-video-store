
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
	<!-- DataTable -->
    <script src="js/jquery.jeditable.mini.js" type="text/javascript"></script>
    <script src="js/jquery.dataTables.js" type="text/javascript"></script>
			<script type="text/javascript" charset="utf-8">
			/* Formating function for row details */
			function fnFormatDetails ( oTable, nTr )
			{
			    var aData = oTable.fnGetData( nTr );
			    var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
			    sOut += '<tr><td>Rendering engine:</td><td>'+aData[1]+' '+aData[4]+'</td></tr>';
			    sOut += '<tr><td>Link to source:</td><td>Could provide a link here</td></tr>';
			    sOut += '<tr><td>Extra info:</td><td>And any further details here (images etc)</td></tr>';
			    sOut += '</table>';
			     
			    return sOut;
			}
			$(document).ready( function() {
				/*
			     * Insert a 'details' column to the table
			     */
			    var nCloneTh = document.createElement( 'th' );
			    var nCloneTd = document.createElement( 'td' );
			    nCloneTd.innerHTML = '<img src="images/details_open.png">';
			    nCloneTd.className = "center";
			     
			    $('#jQTable_Movie thead tr').each( function () {
			        this.insertBefore( nCloneTh, this.childNodes[0] );
			    } );
			     
			    $('#jQTable_Movie tbody tr').each( function () {
			        this.insertBefore(  nCloneTd.cloneNode( true ), this.childNodes[0] );
			    } );
			     
			    /* Init DataTables */
				var oTable = $('#jQTable_Movie').dataTable( {
					"bJQueryUI": true,
					//"sPaginationType": "full_numbers",
					"aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0 ] }],
						"aaSorting": [ [0,'asc'], [1,'asc'] ],
						"aLengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				    "fnDrawCallback": function() {
		            alert( 'DataTables has redrawn the table' );
		        }
				} );
				/* Add event listener for opening and closing details
			     * Note that the indicator for showing which row is open is not controlled by DataTables,
			     * rather it is done here
			     */
			    $('#jQTable_Movie tbody td img').live('click', function () {
			        var nTr = this.parentNode.parentNode;
			        if ( this.src.match('details_close') )
			        {
			            /* This row is already open - close it */
			            this.src = "images/details_open.png";
			            oTable.fnClose( nTr );
			        }
			        else
			        {
			            /* Open this row */
			            this.src = "images/details_close.png";
			            oTable.fnOpen( nTr, fnFormatDetails(oTable, nTr), 'details' );
			        }
			    } );
			} );
				/* Apply the jEditable handlers to the table */
			    $('td', oTable.fnGetNodes()).editable( '../examples_support/editable_ajax.php', {
			        "callback": function( sValue, y ) {
			            var aPos = oTable.fnGetPosition( this );
			            oTable.fnUpdate( sValue, aPos[0], aPos[1] );
			        },
			        "submitdata": function ( value, settings ) {
			            return {
			                "row_id": this.parentNode.getAttribute('id'),
			                "column": oTable.fnGetPosition( this )[2]
			            };
			        },
			        "height": "14px"
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
  
 
  
  		<jsp:include page="/View/middle_admin.jsp" />
  
  
			
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