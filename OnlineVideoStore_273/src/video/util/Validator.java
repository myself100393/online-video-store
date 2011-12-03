package video.util;
 
 

public class Validator {
	
	//public static final HashMap<String, String> states;
	
	public static String SSN(String ssn){
		 
		
		int size = ssn.length();

		if (size!=5 && ssn.length()!=9) {
			return "false:Please enter your 9 digit membership number.";			
		}
		/*
		for (int i=0; i < size; i++) {
			String temp = ssn.substring(i, i+1);
		
			
			//test is string is NOT a number
			if(!temp.matches("-?\\d+(.\\d+)?")){			
				return "false:Invalid characters in your memebership number.  Please try again.";
			}
	 
		}//end for
		*/
		
		if(!ssn.matches("-?\\d+(.\\d+)?")){			
			return "false:Invalid characters in your memebership number.  Please try again.";
		}
		
		return "true: zip code is ok!";  
		
	}
	
	public static String ValidateZip(String zip){
 
			int hyphencount = 0;
			
			int size = zip.length();

			if (size!=5 && zip.length()!=10) {
				return "false:Please enter your 5 digit or 5 digit+4 zip code.";			
			}
			
			for (int i=0; i < size; i++) {
				String temp = zip.substring(i, i+1);
			
				
				//test is string is NOT a number
				if(!temp.matches("-?\\d+(.\\d+)?")){
					if (temp.equals("-")){ //NOT number but is -
						hyphencount++;
					}else{ // NOT number and NOT -
						return "false:Invalid characters in your zip code.  Please try again.";
					}									
				}			
				
				if ((hyphencount > 1) || ((size==10) && !zip.startsWith("-", 5)) ) {
					return "false:The hyphen character should be used with a properly formatted 5 digit+four zip code, like '12345-6789'.   Please try again.";
				}
			
			
		 
			}//end for
			
			return "true: zip code is ok!";  
	}//end function

}
