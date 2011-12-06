
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title></title>
<meta name="description" content="">
<meta name="keywords" content="">



<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<link rel="stylesheet" href="css/slide.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="css/table.css" type="text/css"
	media="screen" />
<link type="text/css"
	href="css/ui-lightness/jquery-ui-1.8.16.custom.css" rel="stylesheet" />

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
<%@ page import="video.dto.MovieInfo"%>
<%@ page import="video.dto.PersonInfo"%>
<%@ page import="video.dto.Movie"%>
<%@ page import="video.dto.Person"%>

<%
MovieInfo[]     movieInfo =	(MovieInfo[])request.getAttribute("movieInfo");
PersonInfo[]	personInfo_SimpleM =(PersonInfo[])request.getAttribute("personInfo_SimpleM");
PersonInfo[]	personInfo_PreM=(PersonInfo[])request.getAttribute("personInfo_PreM" );
PersonInfo[]	personInfo_AllM=(PersonInfo[])request.getAttribute("personInfo_AllM" );


%>
<!-- "jQMovie_List" -->
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	/* Formating function for row details */
	function fnFormatDetails(oTable, nTr) {
		var aData = oTable.fnGetData(nTr);
		if(aData[1]==5)
			var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
				sOut += '<tr><td class = mycolor_1 ID: 6, Name: Chinh Ngh, UserName: chinh></td></tr>';
				sOut += '</table>';
		 if(aData[1]==6)
					    sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
						sOut += '<tr><td class = mycolor_1 ID: 7, Name: Chu Liu UserName: steven></td></tr>';
						sOut += '</table>';
		return sOut;
	} 
	$(document).ready(function() {
		/*
		 * Insert a 'details' column to the table
		 */
		var nCloneTh = document.createElement('th');
		var nCloneTd = document.createElement('td');
		nCloneTd.innerHTML = '<img src="images/details_open.png">';
		nCloneTd.className = "center";

		$('#jQMovie_List thead tr').each(function() {
			this.insertBefore(nCloneTh, this.childNodes[0]);
		});

		$('#jQMovie_List tbody tr').each(function() {
			this.insertBefore(nCloneTd.cloneNode(true), this.childNodes[0]);
		});

		/* Init DataTables */
		var oTable = $('#jQMovie_List').dataTable({
			"bJQueryUI" : true,
			//"sPaginationType": "full_numbers",
			"aoColumnDefs" : [ {
				"bSortable" : false,
				"aTargets" : [ 0 ]
			} ],
			"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
			"aLengthMenu" : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ]
		});
		/* Add event listener for opening and closing details
		 * Note that the indicator for showing which row is open is not controlled by DataTables,
		 * rather it is done here
		 */
		$('#jQMovie_List tbody td img').live('click', function() {
			var nTr = this.parentNode.parentNode;
			if (this.src.match('details_close')) {
				/* This row is already open - close it */
				this.src = "images/details_open.png";
				oTable.fnClose(nTr);
			} else {
				/* Open this row */
				this.src = "images/details_close.png";
				oTable.fnOpen(nTr, fnFormatDetails(oTable, nTr), 'details');
			}
		});
	});
</script>

<!-- simpleMember_Table -->
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	/* Formating function for row details */
	function fnFormatDetails(oTable_Customer, nTr) {
		var aData = oTable_Customer.fnGetData(nTr);
		var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
		sOut += '<tr><td class = mycolor_1>Rendering engine:</td><td class = mycolor_1>' + aData[1] + ' '
				+ aData[4] + '</td></tr>';
		sOut += '<tr><td class = mycolor_1>Link to source:</td><td class = mycolor_1>Could provide a link here</td></tr>';
		sOut += '<tr><td class = mycolor_1>Extra info:</td><td class = mycolor_1>And any further details here (images etc)</td></tr>';
		sOut += '</table>';

		return sOut;
	}
	$(document).ready(
			function() {
				/*
				 * Insert a 'details' column to the table
				 */
				var nCloneTh = document.createElement('th');
				var nCloneTd = document.createElement('td');
				nCloneTd.innerHTML = '<img src="images/details_open.png">';
				nCloneTd.className = "center";

				$('#simpleMember_Table thead tr').each(function() {
					this.insertBefore(nCloneTh, this.childNodes[0]);
				});

				$('#simpleMember_Table tbody tr').each(
						function() {
							this.insertBefore(nCloneTd.cloneNode(true),
									this.childNodes[0]);
						});

				/* Init DataTables */
				var oTable_Customer = $('#simpleMember_Table').dataTable(
						{
							"bJQueryUI" : true,
							//"sPaginationType": "full_numbers",
							"aoColumnDefs" : [ {
								"bSortable" : false,
								"aTargets" : [ 0 ]
							} ],
							"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
							"aLengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "All" ] ]
						});
				/* Add event listener for opening and closing details
				 * Note that the indicator for showing which row is open is not controlled by DataTables,
				 * rather it is done here
				 */
				$('#simpleMember_Table tbody td img').live(
						'click',
						function() {
							var nTr = this.parentNode.parentNode;
							if (this.src.match('details_close')) {
								/* This row is already open - close it */
								this.src = "images/details_open.png";
								oTable_Customer.fnClose(nTr);
							} else {
								/* Open this row */
								this.src = "images/details_close.png";
								oTable_Customer.fnOpen(nTr, fnFormatDetails(
										oTable_Customer, nTr), 'details');
							}
						});
			});
</script>

<!-- premiumMember_Table -->
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	/* Formating function for row details */
	function fnFormatDetails(oTable_Customer, nTr) {
		var aData = oTable_Customer.fnGetData(nTr);
		var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
		sOut += '<tr><td class = mycolor_1>Rendering engine:</td><td class = mycolor_1>' + aData[1] + ' '
				+ aData[4] + '</td></tr>';
		sOut += '<tr><td class = mycolor_1>Link to source:</td><td class = mycolor_1>Could provide a link here</td></tr>';
		sOut += '<tr><td class = mycolor_1>Extra info:</td><td class = mycolor_1>And any further details here (images etc)</td></tr>';
		sOut += '</table>';

		return sOut;
	}
	$(document).ready(
			function() {
				/*
				 * Insert a 'details' column to the table
				 */
				var nCloneTh = document.createElement('th');
				var nCloneTd = document.createElement('td');
				nCloneTd.innerHTML = '<img src="images/details_open.png">';
				nCloneTd.className = "center";

				$('#premiumMember_Table thead tr').each(function() {
					this.insertBefore(nCloneTh, this.childNodes[0]);
				});

				$('#premiumMember_Table tbody tr').each(
						function() {
							this.insertBefore(nCloneTd.cloneNode(true),
									this.childNodes[0]);
						});

				/* Init DataTables */
				var oTable_Customer = $('#premiumMember_Table').dataTable(
						{
							"bJQueryUI" : true,
							//"sPaginationType": "full_numbers",
							"aoColumnDefs" : [ {
								"bSortable" : false,
								"aTargets" : [ 0 ]
							} ],
							"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ],
							"aLengthMenu" : [ [ 10, 25, 50, -1 ],
									[ 10, 25, 50, "All" ] ]
						});
				/* Add event listener for opening and closing details
				 * Note that the indicator for showing which row is open is not controlled by DataTables,
				 * rather it is done here
				 */
				$('#premiumMember_Table tbody td img').live(
						'click',
						function() {
							var nTr = this.parentNode.parentNode;
							if (this.src.match('details_close')) {
								/* This row is already open - close it */
								this.src = "images/details_open.png";
								oTable_Customer.fnClose(nTr);
							} else {
								/* Open this row */
								this.src = "images/details_close.png";
								oTable_Customer.fnOpen(nTr, fnFormatDetails(
										oTable_Customer, nTr), 'details');
							}
						});
			});
</script>

<!-- allMember_Table -->
<script src="js/jquery.dataTables.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
	/* Formating function for row details */
	function fnFormatDetails(oTable_Customer, nTr) {
		var aData = oTable_Customer.fnGetData(nTr);
		var sOut = '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">';
		sOut += '<tr><td class = mycolor_1>Rendering engine:</td><td class = mycolor_1>' + aData[1] + ' '
				+ aData[4] + '</td></tr>';
		sOut += '<tr><td class = mycolor_1>Link to source:</td><td class = mycolor_1>Could provide a link here</td></tr>';
		sOut += '<tr><td class = mycolor_1>Extra info:</td><td class = mycolor_1>And any further details here (images etc)</td></tr>';
		sOut += '</table>';

		return sOut;
	}
	$(document).ready(
			function() {
				/*
				 * Insert a 'details' column to the table
				 */
				var nCloneTh = document.createElement('th');
				var nCloneTd = document.createElement('td');
				nCloneTd.innerHTML = '<img src="images/details_open.png">';
				nCloneTd.className = "center";

				$('#allMember_Table thead tr').each(function() {
					this.insertBefore(nCloneTh, this.childNodes[0]);
				});

				$('#allMember_Table tbody tr').each(
						function() {
							this.insertBefore(nCloneTd.cloneNode(true),
									this.childNodes[0]);
						});

				/* Init DataTables */
				var oTable_Customer = $('#allMember_Table').dataTable(
						{
							"bJQueryUI" : true,
							"aoColumnDefs" : [ {"bSortable" : false,"aTargets" : [ 0 ]} ],
							"aaSorting" : [ [ 0, 'asc' ], [ 1, 'asc' ] ]
							//"aLengthMenu" : [ [ 10, 25, 50, -1 ],[ 10, 25, 50, "All" ] ]
						});
				/* Add event listener for opening and closing details
				 * Note that the indicator for showing which row is open is not controlled by DataTables,
				 * rather it is done here
				 */
				$('#allMember_Table tbody td img').live(
						'click',
						function() {
							var nTr = this.parentNode.parentNode;
							if (this.src.match('details_close')) {
								/* This row is already open - close it */
								this.src = "images/details_open.png";
								oTable_Customer.fnClose(nTr);
							} else {
								/* Open this row */
								this.src = "images/details_close.png";
								oTable_Customer.fnOpen(nTr, fnFormatDetails(
										oTable_Customer, nTr), 'details');
							}
						});
			});
</script>

</head>

<body>
	<%
		String user = (String) session.getAttribute("loggedInUser");
	%>
	<jsp:include page="/View/login.jsp" />
	<jsp:include page="/View/top.jsp" />
	<!-- Shell -->
	<div id="shell">
		<%
			String error = (String) request.getAttribute("errorInfo");
			if (error != null) {
				out.println("<div class=\"ser_error\">" + error + "</div>");
			}

			String success = (String) request.getAttribute("success");
			if (success != null) {
				out.println("<div class=\"ser_success\">" + success + "</div>");
			}
		%>
<script type="text/javascript">
	function changeHiddenValue_1(new_value) {
		//these all work in most browsers, however the third option doesnt work in ALL browsers, and it is also considered bad form
		document.getElementById("movieListingForm").buttonPressed_Delete_Movie.value = new_value;
		document.getElementById("movieListingForm").FunctionCall.value = "deleteMovie";

	}
</script>
<script type="text/javascript">
	function changeHiddenValue_2(new_value) {
		//these all work in most browsers, however the third option doesnt work in ALL browsers, and it is also considered bad form
		document.getElementById("movieListingForm").buttonPressed_Update.value = new_value;
		document.getElementById("movieListingForm").FunctionCall.value = "UpdateMovie";
	}
</script>
<script type="text/javascript">
	function changeHiddenValue_3(new_value) {
		//these all work in most browsers, however the third option doesnt work in ALL browsers, and it is also considered bad form
		document.getElementById("simpleMListingForm").buttonPressed_Delete_SimpleM.value = new_value;
	}
</script>
<script type="text/javascript">
	function changeHiddenValue_4(new_value) {
		//these all work in most browsers, however the third option doesnt work in ALL browsers, and it is also considered bad form
		document.getElementById("premiumMListingForm").buttonPressed_Delete_PreM.value = new_value;
	}
</script>
<script type="text/javascript">
	function changeHiddenValue_5(new_value) {
		//these all work in most browsers, however the third option doesnt work in ALL browsers, and it is also considered bad form
		document.getElementById("allMListingForm").buttonPressed_Delete_AllM.value = new_value;
	}
</script>
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