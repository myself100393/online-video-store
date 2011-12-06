package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import video.dto.Account;
import video.dto.Address;
import video.dto.Movie;
import video.dto.MovieInfo;
import video.dto.Person;
import video.dto.PersonInfo;


import video.connection.ServiceProxy;

/**
 * Servlet implementation class SignUp
 */
public class AdminLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ServiceProxy proxy=new ServiceProxy();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String loggedInUser = (String)session.getAttribute("loggedInUser");	
		
		if(loggedInUser!=null){		
						
			proxy.setEndpoint("http://localhost:8080/OnlineVideoStore_273/services/Service");
			
			//String user = request.getParameter("user");
		 	
		 	
			Person person = proxy.getPerson(loggedInUser);			 
			Movie[] movieList = proxy.listMovies();
			Person[] personList_SimpleM = proxy.listSimpleMember();
			Person[] personList_PremiumM = proxy.listPremiumMember();
			Person[] personList_All_Person = proxy.listAllPersons();

			MovieInfo[] movieInfo = new MovieInfo[movieList.length];
			for(int i=0;i<movieList.length;i++){
				movieInfo[i] = proxy.displayMovie(movieList[i].getId());
			}
			
			PersonInfo[] personInfo_SimpleM = new PersonInfo[personList_SimpleM.length];
			for(int i=0;i<personList_SimpleM.length;i++){
				personInfo_SimpleM[i] = proxy.displayPerson(personList_SimpleM[i].getId());
			}
			
			PersonInfo[] personInfo_PreM = new PersonInfo[personList_PremiumM.length];
			for(int i=0;i<personList_SimpleM.length;i++){
				personInfo_PreM[i] = proxy.displayPerson(personList_PremiumM[i].getId());
			}

			PersonInfo[] personInfo_AllM = new PersonInfo[personList_All_Person.length];
			for(int i=0;i<personList_All_Person.length;i++){
				personInfo_AllM[i] = proxy.displayPerson(personList_All_Person[i].getId());
			}


			if(person!=null){				
				Account account = proxy.getAccount(person.getId());
				Address address = proxy.getAddress(person.getId());
				
				System.out.println("address is null?"+address==null);
				
				  				
				session.setAttribute("userSession", session);
				session.setAttribute("loggedInUser", loggedInUser);
				request.setAttribute("person", person);				
				request.setAttribute("account", account);
				request.setAttribute("address", address);
				
				request.setAttribute("movieList", movieList);
				request.setAttribute("personList_SimpleM", personList_SimpleM);
				request.setAttribute("personList_PremiumM", personList_PremiumM);
				request.setAttribute("personList_All_Person", personList_All_Person);
				
				request.setAttribute("movieInfo", movieInfo);
				request.setAttribute("personInfo_SimpleM", personInfo_SimpleM);
				request.setAttribute("personInfo_PreM", personInfo_PreM);
				request.setAttribute("personInfo_AllM", personInfo_AllM);
				//request.setAttribute("rentedMovieList", rentedMovieList);

				
				
			//	String[] countryCodes = Locale.getISOCountries();
		
			}else{	
				 
				request.setAttribute("errorInfo", "Can't not find the user, pls login again!");				
			}
		
		}else{//end if isLoggedIn
	 		request.setAttribute("errorInfo", "Please login before using the site!!");	
	 	}	
		
		request.setAttribute("ActivePage", "ADMIN");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/View/admin.jsp");
		dispatcher.forward(request, response);
		
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 	
		String function =  request.getParameter("FunctionCall"); //export?				
		response.setContentType("text/html");
		String qdone="";		 
		
		try{ 
			proxy.setEndpoint("http://localhost:8080/OnlineVideoStore_273/services/Service");
		 	HttpSession session = request.getSession();
			 	
		 	String loggedInUser = (String)session.getAttribute("loggedInUser");
			 	
			 	
		 	if(loggedInUser==null){				 	
		 		request.setAttribute("errorInfo", "Please login before using the site!!");
		 		doGet(request, response);
		 		return;
			}
		 		
		 	if(function==null){ //Shouldn't happen, unless the jsp is hacked
				request.setAttribute("errorInfo", "Incorrect function, pls reload the page!!");
		 		doGet(request, response);
		 		return;
		 	}
			 	
			 	
			//UpdateUser
		 	if(function.equals("UpdateUser")){
					 		
		 		Person person = proxy.getPerson(loggedInUser);
		 		if(person==null){
					request.setAttribute("errorInfo", "Incorrect user, pls login again!!");
			 		doGet(request, response);
			 		return;
		 		}
		 		
		 		Account account = proxy.getAccount(person.getId());	
		 		Address address = proxy.getAddress(person.getId());	
		 		
		 		//Person
		 		String username = request.getParameter("name");
		 		String fname = request.getParameter("fname");
		 		String lname = request.getParameter("lname");
		 		String pwd = request.getParameter("pwd");
		 		//Account
		 		String ssn  = request.getParameter("ssn");
		 		String userTypeStr = request.getParameter("userType");
		 		//Address
		 		String street = request.getParameter("st");
		 		String city = request.getParameter("city");
		 		String state = request.getParameter("state");
		 		String country = request.getParameter("country");
		 		String zip = request.getParameter("zip");
		 		
		 		 
		 		
					 		 
		 		//the result of the checkbox's uncheck=null
		 		//if it is checked then will return 1/2, if its 1->2, if its 2->2
		 		// as 2=premium
		 		int userType = (userTypeStr==null)? 1 : 2;		
		 		
		 		boolean isUsernameChanged = isUsernameChanged(person.getUsername(), username);					
			    
		 		if(isUsernameChanged){//check is the user name is taken?
		 			boolean isUsernameExisted = proxy.isUsernameExisted(username);
		 			if(isUsernameExisted){
						request.setAttribute("errorInfo", "User Name ("+username+") is already taken, no update is performed!!");
						doGet(request, response);
						return;
		 			}				       
		 		}
		 		
				 			
				boolean isSamePersonInfo = compareTo(person, fname, lname, username, pwd);				 	
				boolean isSameAccountInfo = compareTo(account, ssn, userType);
				boolean isSameAddressInfo = compareTo(address, street,city,state,country,zip );
				
				System.out.println("Same person info:"+isSamePersonInfo);
				System.out.println("Same Accont info:"+isSameAccountInfo);
				System.out.println("Same Address info:"+isSameAddressInfo);
							 	
				//Comparing the data, if all the same then no need to update.			 	
				if(isSamePersonInfo && isSameAccountInfo && isSameAddressInfo){							 		
					request.setAttribute("errorInfo", "Same user info, no update is performed!!");
					doGet(request, response);
					return;					
				}

				//else, update the data.
				qdone = proxy.updatePersonAccount(person, account, address);
					 
	 
				if(qdone.substring(0,4).equals("true")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", "User account info is updated!");	
														
				}else{	
					
					System.out.println("result: "+qdone);
					
					request.setAttribute("errorInfo", qdone.replace("false:", ""));				
				}
					 		
			}//end if(function.equals("UpdateUser")
			
		 	//List Movie
		 	if(function.equals("ListMovie")){
			    Movie[] movieList = proxy.listMovies();	
			    request.setAttribute("movieList", movieList);
		 	}
		 	
		 	//Update Movie
		 	if(function.equals("UpdateMovie")){
			    //Movie[] movieList = proxy.listMovies();				 		
		 	}//end if(function.equals("UpdateMovie")
		 	
		 	//Create Movie
		 	if(function.equals("CreateMovie")){
		 		String name = request.getParameter("name");
		 		String banner = request.getParameter("banner");
		 		String releaseDate = request.getParameter("releaseDate");
		 		String rentAmount = request.getParameter("rentAmount");
		 		String nbAvailable = request.getParameter("nbAvailable");
		 		
		 		
		 		
		 		double rentAmt = Double.parseDouble(rentAmount);
		 		int nbAvail = Integer.parseInt(nbAvailable);
		 		String releaseD_Full_Format = releaseDate + "-00-00";
		 		DateFormat formater = new SimpleDateFormat("yyyy-mm-dd");
		 		Date releaseD =  (Date) formater.parse(releaseD_Full_Format);
		 		System.out.println("result: "+releaseD);
		 		//Date releaseD = Date.parse(releaseDate);
		 		
		 		java.util.Calendar calendar = java.util.Calendar.getInstance();
		 		calendar.setTime(releaseD); 
		 		Movie movie = new Movie();
		 		movie.setBanner(banner);
		 		movie.setName(name);
		 		movie.setReleaseDate(calendar);
		 		movie.setRentAmount(rentAmt);
		 		movie.setNbAvailable(nbAvail);
		 		
		 		

		 		
		 		//else, create the movie
				qdone = proxy.addMovie(movie);
					 
	 
				if(qdone.substring(0,5).equals("SUCCE")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", "Movie is successfully created!");	
														
				}else{	
					
					System.out.println("result: "+qdone);
					
					request.setAttribute("errorInfo", qdone.replace("false:", ""));				
				}		
				
   	 	    }//end if(function.equals("CreateMovie")
		 	
		 	//Delete Movies
		 	if(function.equals("deleteMovie")){
		 		String movieId_Str = request.getParameter("buttonPressed_Delete_Movie");
		 		System.out.println(movieId_Str);
				String result = proxy.deleteMovie(movieId_Str);
				System.out.println("result...."+result);
				if(result.substring(0,5).equals("SUCCE")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", result);	
														
				}else{	
					
					System.out.println("result: "+result);
					
					request.setAttribute("errorInfo", result);				
				}
		 	}
		 	
		 	//Delete Simple Customers
		 	if(function.equals("deleteSimpleMember")){
		 		String personId_Str = request.getParameter("buttonPressed_Delete_SimpleM");
		 		System.out.println(personId_Str);
		 		int personId = Integer.parseInt(personId_Str);
				String result = proxy.deletePerson(personId);
				System.out.println("result...."+result);
				if(result.substring(0,4).equals("true")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", result);	
														
				}else{	
					
					System.out.println("result: "+result);
					
					request.setAttribute("errorInfo", result);				
				}
		 	}
		 	
		 	//Delete Premium Customers
		 	if(function.equals("deletePreMember")){
		 		String personId_Str = request.getParameter("buttonPressed_Delete_PreM");
		 		System.out.println(personId_Str);
		 		int personId = Integer.parseInt(personId_Str);
				String result = proxy.deletePerson(personId);
				System.out.println("result...."+result);
				if(result.substring(0,4).equals("true")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", result);	
														
				}else{	
					
					System.out.println("result: "+result);
					
					request.setAttribute("errorInfo", result);				
				}
		 	}
		 	
		 	//Delete All Customers
		 	if(function.equals("deleteInAllMember")){
		 		String personId_Str = request.getParameter("buttonPressed_Delete_AllM");
		 		System.out.println(personId_Str);
		 		int personId = Integer.parseInt(personId_Str);
				String result = proxy.deletePerson(personId);
				System.out.println("result...."+result);
				if(result.substring(0,4).equals("true")){
					session.setAttribute("userSession", session);
					session.setAttribute("loggedInUser", loggedInUser);
					request.setAttribute("success", result);	
														
				}else{	
					
					System.out.println("result: "+result);
					
					request.setAttribute("errorInfo", result);				
				}
		 	}

		 	//Generate Bill
		 	if(function.equals("GenerateBill")){
		 		Person person = proxy.getPerson(loggedInUser);
		 		int personId = person.getId();
		 		Calendar currentDate = Calendar.getInstance();
		 		int month = currentDate.get(Calendar.MONTH)+1;
		 		int year = currentDate.get(Calendar.YEAR);
			    proxy.generateBill(personId, month, year);
		 	}
		 	
		 	doGet(request, response);
		 }
		 catch (Exception e){			 
	            e.printStackTrace();
	     }	 
	}
	


	private boolean isUsernameChanged(String orig_uname, String username){			 
		
		boolean isUsernameChanged = false;					
        if (username == null && (orig_uname != null) ){
        	isUsernameChanged = true;
        } else if (!username.equals(orig_uname)){
        	isUsernameChanged = true;			        	 		 
        }
		
		return isUsernameChanged;
		
	}
	/*
	 *This method compare the Person obj and the number of NEW values, if they are different
	 *then the new values will be assigned to the Person obj. 
	 */
    private boolean compareTo(Person p, String fname,String lname, String uname,String pwd) {
    	
    	boolean isSame =true;
    	
    	String firstName = p.getFirstName();
    	String lastName = p.getLastName();
    	String username = p.getUsername();
    	String password = p.getPassword();
    	
    	
    	
    	fname = fname.trim();
    	lname = lname.trim();
    	uname = uname.trim();
    	pwd = pwd.trim();
 
        if (firstName == null) {
                  if (fname != null){
                         isSame=false;                         
                         p.setFirstName(fname);                         
                  }
        } else if (!firstName.equals(fname)) {        	
        		  isSame=false;
        		  p.setFirstName(fname);                  
        }
        
        if (lastName == null) {
                  if (lname != null){
                	  isSame=false;                         
                      p.setLastName(lname);  
                  }
        } else if (!lastName.equals(lname)) {
		        	isSame=false;
		  		  	p.setLastName(lname); 
        }
        
        if (username == null) {
                  if (uname != null){
                      isSame=false;
               		  p.setUsername(uname); 
                  }
        } else if (!username.equals(uname)) {
        	 		isSame=false;
        	 		p.setUsername(uname); 
        }
        
        if ( password == null) {
                  if (pwd != null){
                	  isSame=false;
               		  p.setPassword(pwd); 
                  }
        } else if (! password.equals(pwd)) {
        		isSame=false;
        		p.setPassword(pwd);
        }
        
 

        return isSame;
    }//end compareTo
    
    
	/*
	 *This method compare the Account obj and the number of NEW values, if they are different
	 *then the new values will be assigned to the Account obj. 
	 */
    public boolean compareTo(Account account, String ssn,int userType) {
    	boolean isSame =true;
    	
    	String orig_ssn = account.getSsn();
    	int orig_userType = account.getUserType();

    	if (orig_ssn == null) {
                  if (ssn != null){
                	  isSame = false;
                	  account.setSsn(ssn);
                  }
        } else if (!orig_ssn.equals(ssn)) {
        	  isSame = false;
        	  account.setSsn(ssn);
        }
        
        if (userType != orig_userType) {
        	  isSame = false;
        	  account.setUserType(userType);
        }

        return isSame;
     }
    
	/*
	 *This method compare the Account obj and the number of NEW values, if they are different
	 *then the new values will be assigned to the Account obj. 
	 */

	private boolean compareTo(Address address, String street, String city,
								String state, String country, String zip) {
    	boolean isSame =true;
    	
    	String o_St = address.getStreet();
    	String o_City = address.getCity();
    	String o_State = address.getState();
    	String o_Country = address.getCountry();
    	String o_Zip = address.getZip();
    	
    	System.out.println("Street:"+ street);
    	System.out.println("City:"+ city);
    	System.out.println("State:"+ state);
    	System.out.println("Country:"+ country);
    	System.out.println("Zip:"+ zip);
    	
    	
    	
        if ( o_St == null) {
            if (street != null){
          	  isSame=false;
          	  address.setStreet(street); 
            }
        } else if (! o_St.equals(street)) {
        	isSame=false;
        	address.setStreet(street);
        }
        
        
        if ( o_City == null) {
            if (city != null){
          	  isSame=false;
          	  address.setCity(city); 
            }
        } else if (! o_City.equals(city)) {
        	isSame=false;
        	address.setCity(city);
        }
        
        if ( o_State == null) {
            if (state != null){
          	  isSame=false;
          	  address.setState(state); 
            }
        } else if (! o_St.equals(state)) {
        	  isSame=false;
        	  address.setState(state); 
        }
        
        
        if ( o_Country == null) {
            if (country != null){
          	  isSame=false;
          	  address.setCountry(country); 
            }
        } else if (! o_Country.equals(country)) {
        	  isSame=false;
        	  address.setCountry(country); 
        }
        
        
        if ( o_Zip == null) {
            if (zip != null){
          	  isSame=false;
          	  address.setZip(zip); 
            }
        } else if (! o_Zip.equals(zip)) {
        	  isSame=false;
        	  address.setZip(zip); 
        }
        
 
        return isSame;
	}

}
