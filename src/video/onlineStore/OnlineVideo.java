package video.onlineStore;

 

import java.util.List;

import video.connection.DatabaseConnection;
import video.dao.AccountDao;
import video.dao.PersonDao;
import video.dto.Account;
import video.dto.Person;


public class OnlineVideo {
	DatabaseConnection db=new DatabaseConnection();
 
	//private static final LineItemProduct[][] LineItemProduct = null;
	
	public String signUp(Person person, int accountType) {
		
		try {		
			
			PersonDao dao = new PersonDao();			
			
			//Check is user name existed
			boolean isUserExist = dao.isUserExist(db.con, person.getUsername());
			if(isUserExist){//user already exist				
				return "false:User name already registered";
			}			
			
			boolean isCreate = dao.create(db.con, person);
			
			int personId = person.getId();
			
			AccountDao a_dao = new AccountDao();
			Account account = a_dao.createValueObject();
			account.setPersonId(personId);
			account.setUserType(accountType);			
			a_dao.create(db.con,account );
 
			
			return (isCreate)?"true" : "false:No obj return";
		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:Exception";
		}
	 
	}
	
	
	public String logon(String username, String pwd) {
		
		try {
			
			PersonDao dao = new PersonDao();			
			
			//Check is user name existed
			List<Person> result = dao.searchUser(db.con, username);
								
			if(result!=null && result.size()==1){
				
				Person person = result.get(0);
				//check password				
				String pass = person.getPassword();
				
				
				/*
				 * Need to encrypt the password
				 */
				
				if(pwd.equals(pass)){
					//[[update last login time]]					 
					//Date date = new Date(new java.util.Date().getTime());
					person.setLast_login(new java.util.Date().getTime()+"");
					dao.save(db.con, person);					
					
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
		 
	public String logout(int userId) {
		
		return "true: logout sucessful ";
	 
	}
	 
	public void search() {
	 
	}


	public Person getPerson(String username) {
		try {
			
			PersonDao dao = new PersonDao();			
			List<Person> result = dao.searchUser(db.con, username);
								
			if(result!=null && result.size()==1){				
				return result.get(0);			  
			}else{
				return null;
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return null;
		}
	}
	
	public Account getAccount(int userId) {
		try {
			
			AccountDao dao = new AccountDao();			
			List<Account> result = dao.searchByUserId(db.con, userId);
								
			if(result!=null && result.size()==1){				
				return result.get(0);			  
			}else{
				return null;
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return null;
		}
	}


	public String updatePersonAccount(Person person, Account account) {
		try {		
			
			PersonDao p_dao = new PersonDao();			
			boolean isPersonUpdated  = p_dao.save(db.con, person);
			

			AccountDao a_dao = new AccountDao();			
		    boolean isAccountUpdated = a_dao.save(db.con, account);

				
			if(isPersonUpdated && isAccountUpdated){
				return "true:User account is updated";				
			}else{						 
				return "false:Cann't update user account!";				
			}		
		}
		catch (Exception _e) {
			_e.printStackTrace();
			return "false:Exception";
		}
	}
	
	 
	
	 
}
 
