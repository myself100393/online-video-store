package Connection;

import java.util.LinkedHashMap;
import java.util.Vector;

import javax.jws.WebService;

import market.dto.LineItemProduct;
import market.dto.Product;

import MarketPlace.OnlineMarketPlace;

@WebService
public class Service {	
	//DatabaseConnection db=new DatabaseConnection();
	
	OnlineMarketPlace omp = new OnlineMarketPlace();
	
	
	
	public String signUp(String username, String pwd, String firstN, String lastN, String email)
	{
		System.out.println("Inside Signup");
		String result;
		
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
		
		result = omp.signUp(username, firstN, lastN, pwd, email);
		
		//asdfasdfas
		return result;//this value is returned to the calling servlet
	}	
	
	public String logon(String username, String pwd){
		
		System.out.println("Inside login");
		String result;
		
		/**This space is left for validation and manipulation of 
		input values entered by the user as a part of the server side validation*/
			
		result = omp.logon(username, pwd);
		
		
		return result;//this value is returned to the calling servlet
	}
	
	public String addProduct(String name, String des, double price, int quantity, String userName, String info){
		System.out.println("Inside addProdcut");
		String result;
				
		result = omp.addProduct(name,des,price,quantity,userName,info);
			
		return result;		
	}
	
	public LineItemProduct[] listProduct(){
		System.out.println("Inside List Prodcut");		 
				
		return omp.listProduct();		 	
	}
	
	public String add2Cart(String userName, int qty, int itemId){
		
		System.out.println("Inside add2Cart");
		
		String result;
				
		result = omp.add2Cart(userName,qty, itemId);
			
		return result;		
	}
	
	public int getCartItemNum(String userName){
		
		
		return omp.getCartItemNum(userName);
	}
	
	
}
