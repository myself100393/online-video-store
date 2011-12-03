package video.util;

import java.util.LinkedHashMap;

public class CustomerSearchHelper {
	 
		public static final LinkedHashMap<String, String> states;
		static{
			LinkedHashMap<String, String> map = new LinkedHashMap<String, String>();			
			map.put("Id","ID");
			map.put("FirstN","FirstName");
			map.put("LastN","LastName");
			map.put("UserN","UserName");
			map.put("Reg","Registration");
			states = map;
		}
}
