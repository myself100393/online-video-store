package Servlets;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import video.dto.Person;

import video.connection.ServiceProxy;

/**
 * Servlet implementation class SignUp
 */
public class IndexLet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 ServiceProxy proxy=new ServiceProxy();  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IndexLet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Index: doGet");
		HttpSession session = request.getSession();
		String user = (String)session.getAttribute("loggedInUser");
		
		
		if(user!=null)
		try{			 
			proxy.setEndpoint("http://localhost:8080/OnlineVideoStore_273/services/Service");			
 
			session.setAttribute("loggedInUser", user); 
	 
		 }
		 catch (Exception e){
	            e.printStackTrace();
	     }
		
		request.setAttribute("ActivePage", "HOME");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/View/index.jsp");
		dispatcher.forward(request, response);
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("Index: doPost");
 
		String function =  request.getParameter("FunctionCall"); //export?
 
		response.setContentType("text/html");
		String qdone="";		 
		 try{			
 
			 	proxy.setEndpoint("http://localhost:8080/OnlineVideoStore_273/services/Service");
			 	HttpSession session = request.getSession();
			 	
			 	if(function!=null){
			 		
			 	
				 	if(function.equals("Logon")){
					 	String user = request.getParameter("user");
					 	String pass = request.getParameter("pass");
						qdone = proxy.logon(user, pass);
						 
 
						if(qdone.substring(0,4).equals("true")){
							session.setAttribute("userSession", session);
							session.setAttribute("loggedInUser", user);
													
						}else{						 
							request.setAttribute("errorInfo", "Incorrent User Name or Password!");				
						}
				 		
				 	}else if(function.equals("Signon")){
				 		
				 		String user = request.getParameter("user");
					 	String pass = request.getParameter("pass");
					 	String lastN = request.getParameter("lastN");
					 	String firstN = request.getParameter("firstN");					
					 	String userType = request.getParameter("userType");					 	
					 	//Null = Unchecked , 2 = Checked
					 	//(1 = simple member; 2 = premium member)
					 	int userT = (userType==null)? 1 : Integer.parseInt(userType);
					 	
					 	Person person = new Person();
					 	person.setFirstName(firstN);
					 	person.setLastName(lastN);
					 	person.setUsername(user);
					 	person.setPassword(pass);
					 	
					 	
					 	qdone = proxy.signUp(person,userT);
					 	
						if(qdone.substring(0,4).equals("true")){
							session.setAttribute("userSession", session);
							session.setAttribute("loggedInUser", user);
							//request.setAttribute("servletUser", request.getParameter("user"));
						}else{							 
							request.setAttribute("errorInfo", qdone.replace("false:", ""));	
						}				 	
					 	
				 	}else if(function.equals("Logout")){
				 		session.invalidate();
				 	}
				 		
 
			 	}else{
			 		System.out.println("function is null");
			 		request.setAttribute("cartItem", 0);
			 	}
				
			 	request.setAttribute("ActivePage", "HOME");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/View/index.jsp");
				dispatcher.forward(request, response);
		 }
		 catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	}
	

    
    

}
