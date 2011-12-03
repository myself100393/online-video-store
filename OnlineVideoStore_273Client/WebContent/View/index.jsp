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

			<!-- Box -->
			<div class="box">
				<div class="head">
					<h2>LATEST TRAILERS</h2>
					<p class="text-right"><a href="#">See all</a></p>
				</div>

				<!-- Movie -->
				<div class="movie">
					
					<div class="movie-image">
						<span class="play"><span class="name">X-MAN</span></span>
						<a href="#"><img src="css/images/movie1.jpg" alt="movie" /></a>
					</div>
						
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">SPIDER MAN 2</span></span>
						<a href="#"><img src="css/images/movie2.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">SPIDER MAN 3</span></span>
						<a href="#"><img src="css/images/movie3.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">VALKYRIE</span></span>
						<a href="#"><img src="css/images/movie4.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">GLADIATOR</span></span>
						<a href="#"><img src="css/images/movie5.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie last">
					<div class="movie-image">
						<span class="play"><span class="name">ICE AGE</span></span>
						<a href="#"><img src="css/images/movie6.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->
			
			<!-- Box -->
			<div class="box">
				<div class="head">
					<h2>TOP RATED</h2>
					<p class="text-right"><a href="#">See all</a></p>
				</div>

				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">TRANSFORMERS</span></span>
						<a href="#"><img src="css/images/movie7.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">MAGNETO</span></span>
						<a href="#"><img src="css/images/movie8.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">KUNG FU PANDA</span></span>
						<a href="#"><img src="css/images/movie9.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">EAGLE EYE</span></span>
						<a href="#"><img src="css/images/movie10.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">NARNIA</span></span>
						<a href="#"><img src="css/images/movie11.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie last">
					<div class="movie-image">
						<span class="play"><span class="name">ANGELS & DEMONS</span></span>
						<a href="#"><img src="css/images/movie12.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->
			
			<!-- Box -->
			<div class="box">
				<div class="head">
					<h2>MOST COMMENTED</h2>
					<p class="text-right"><a href="#">See all</a></p>
				</div>

				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">HOUSE</span></span>
						<a href="#"><img src="css/images/movie13.jpg" alt="movie" /></a>
					</div>
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">VACANCY</span></span>
						<a href="#"><img src="css/images/movie14.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">MIRRORS</span></span>
						<a href="#"><img src="css/images/movie15.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">THE KINGDOM</span></span>
						<a href="#"><img src="css/images/movie16.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
				<div class="movie">
					<div class="movie-image">
						<span class="play"><span class="name">MOTIVES</span></span>
						<a href="#"><img src="css/images/movie17.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				
				<!-- Movie -->
 				<div class="movie last">
 					<div class="movie-image">
						<span class="play"><span class="name">THE PRESTIGE</span></span>
						<a href="#"><img src="css/images/movie18.jpg" alt="movie" /></a>
					</div>	
					<div class="rating">
						<p>RATING</p>
						<div class="stars">
							<div class="stars-in">
								
							</div>
						</div>
						<span class="comments">12</span>
					</div>
				</div>
				<!-- end Movie -->
				<div class="cl">&nbsp;</div>
			</div>
			<!-- end Box -->
			
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