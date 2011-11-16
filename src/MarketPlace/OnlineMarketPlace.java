package MarketPlace;

 

import java.sql.Date;
import java.util.LinkedHashMap;
import java.util.Vector;

import market.dao.AccountDao;
import market.dao.CartDao;
import market.dao.CustomerDao;
import market.dao.LineItemDao;
import market.dao.ProductDao;
import market.factory.AccountDaoFactory;
import market.factory.CartDaoFactory;
import market.factory.CustomerDaoFactory;
import market.factory.LineItemDaoFactory;
import market.factory.ProductDaoFactory;
import market.dto.Account;
import market.dto.AccountPk;
import market.dto.Cart;
import market.dto.CartPk;
import market.dto.Customer;
import market.dto.CustomerPk;
import market.dto.LineItem;
import market.dto.LineItemPk;
import market.dto.LineItemProduct;
import market.dto.Product;
import market.dto.ProductPk;
import market.exceptions.LineItemDaoException;
import market.exceptions.ProductDaoException;

public class OnlineMarketPlace {
 
	//private static final LineItemProduct[][] LineItemProduct = null;

	public String signUp(String userName, String firstName, String lastName, String password, String email) {
		
		try {
			CustomerDao dao = CustomerDaoFactory.create();
			
			//Check is user name existed
			Customer result = dao.findByUserName(userName);
			if(result!=null){//user already exist
				return "false:User name already registered";
			}
			
			
			//Create an account 
			AccountDao a_dao = AccountDaoFactory.create();
			Account a_dto = new Account();
			AccountPk apk = a_dao.insert(a_dto);
			if(apk==null){//able to open an account
				return "false:Unable to open an account!";
			}
			
			
			System.out.println("Account ID: "+apk.getId());
			
			
			
			Customer dto = new Customer();
			dto.setUserName(userName);
			dto.setFirstName(firstName);
			dto.setLastName(lastName);
			dto.setPassword(password);
			dto.setEmail(email);
			dto.setAccountId(apk.getId());
			
		
			CustomerPk cpk = dao.insert(dto);
			
			return (cpk!=null)?"true" : "false:No obj return";
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:Exception";
		}
	 
	}
	 
	public String logon(String username, String pwd) {
		
		try {
			CustomerDao dao = CustomerDaoFactory.create();		
			Customer result = dao.findByUserName(username);
						
			if(result!=null){
				//check password				
				String pass = result.getPassword();
				
				if(pwd.equals(pass)){
					//[[update last login time]]
					 
					Date date = new Date(new java.util.Date().getTime());
					result.setLastLogin(date);
					dao.update(result);
					
					
					return "true";
				}else{
					return "false:Wrong password";
				}
				
			}else{
				return "false:User name not found!";
			}
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:exception";
		}
		
	 
	}
	 
	public void logout() {
	 
	}
	 
	public void search() {
	 
	}
	
	/**/
	public String addProduct(String name, String des, double price, int quantity, String userName, String info){
		
		
		try {
			CustomerDao dao = CustomerDaoFactory.create();	
			Customer customer = dao.findByUserName(userName);
			if(customer==null){				
				return "false:Can't find the user";				
			}
			
			System.out.println("customer id: "+customer.getId());
			
			ProductDao p_dao = ProductDaoFactory.create();
			Product p_dto = new Product();			
			
			System.out.println("max:"+p_dao.getMaxRows());
			
			
			p_dto.setName(name);
			p_dto.setDescription(des);
			ProductPk p_pk = p_dao.insert(p_dto);
			
			
			
			System.out.println("Product id: "+p_pk.getId());
 
			if(p_pk==null){				
				return "false:Can't add product (Product)";				
			}
			
			
			LineItemDao l_dao = LineItemDaoFactory.create();
			LineItem l_dto = new LineItem();
			l_dto.setPrice(price);
			l_dto.setProductId(p_pk.getId());
			l_dto.setQuantity(quantity);
			l_dto.setSellerId(customer.getId());
			l_dto.setSellerInfo(info);
			LineItemPk l_pk = l_dao.insert(l_dto);
			
			System.out.println("are we here yet?");
			
			return (l_pk!=null)?"true" : "false: Can't add product (LineItem)";
		 
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:exception";
		}
	}

	public  LineItemProduct[] listProduct() {	
	
		
		ProductDao p_dao = ProductDaoFactory.create();
		
		LineItemDao l_dao = LineItemDaoFactory.create();
		LineItemProduct[] lips = new LineItemProduct[0];

		try {
			
			LineItem[] items = l_dao.findAll();
			
			if(items!=null){
				
				int itemSize = items.length;
				
				lips= new LineItemProduct[itemSize];
						
				
				int i=0;
				for(LineItem  item : items){
					
					 
					
					int pid = item.getProductId();
					
					System.out.println("PID: "+pid);
					
					Product product = p_dao.findByPrimaryKey(pid);
					
					String name = product.getName();					
					String des = product.getDescription();
					
					Double price = item.getPrice();
					int qty = item.getQuantity();					
					String info  = item.getSellerInfo();
					int sellerId = item.getSellerId();
					int itemId = item.getId();
					
					LineItemProduct lip = new LineItemProduct();
					lip.setName(name);
					lip.setDescription(des);
					lip.setPrice(price);
					lip.setQty(qty);
					lip.setSellerInfo(info);
					lip.setSellerId(sellerId);
					lip.setProductId(pid);
					lip.setItemId(itemId);
										
					lips[i++]=lip;
									
				}	
			}
			
			System.out.println("just about the return");
			return lips;
			
			
		} catch (ProductDaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 
		} catch (LineItemDaoException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}

	public String add2Cart(String userName, int qty, int itemId) {
		try {
			
			
			CustomerDao dao = CustomerDaoFactory.create();	
			Customer customer = dao.findByUserName(userName);
			if(customer==null){				
				return "false:Can't find the user";				
			}
			
			int cid = customer.getId();
			int aid = customer.getAccountId();
			
			System.out.println("customer id: "+cid);
			System.out.println("account id: "+ aid);
			
			
			//check is it the same item
			
			
			
			CartDao c_dao = CartDaoFactory.create();	
			Cart oldCart = c_dao.findByPrimaryKey(aid, itemId);
			
			if(oldCart!=null){//the item is already added before
				
				int currentQty = oldCart.getQty();
				
				oldCart.setQty(currentQty+qty);
				
				c_dao.update( oldCart);		
				
				return "true:Your cart has been updated";
				
			}else{ //need a new one
				Cart c_dto = new Cart();			
				c_dto.setLineItemId(itemId);
				c_dto.setQty(qty);
				c_dto.setAccountId(customer.getAccountId());
				CartPk c_pk = c_dao.insert(c_dto);
							
				return (c_pk!=null)?"true" : "false: Can't add to cart";				
			}
			
			
			

		 
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:exception";
		}
		 
	}

	public int getCartItemNum(String userName) {
 
		
		try {
				
			CustomerDao dao = CustomerDaoFactory.create();	
			Customer customer = dao.findByUserName(userName);
			if(customer==null){				
				return -1;				
			}
 
			
			
			
			int cid = customer.getId();
			int aid = customer.getAccountId();
			
			System.out.println("customer id: "+cid);
			System.out.println("account id: "+ aid);
	 
			
			
			CartDao c_dao = CartDaoFactory.create();	
			
			Cart[] myItems  = c_dao.findAll(aid);

			 
			int total = 0;
			if(myItems!=null){
				
				for(Cart cart: myItems){
					int qty = cart.getQty();
					total = total +qty;				
				}			
				
				 
				return total;
				
			}else{ //need a new one
				 	
				return 0;				
			}		 
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return -1;
		}
	}
	
	 
}
 
