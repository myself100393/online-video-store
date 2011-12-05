package video.dao;

import java.sql.*;
import java.text.DateFormat;
import java.util.*;

import video.dto.Address;
import video.dto.Person;
import video.exceptions.NotFoundException;


 /**
  * Person DAO contains all DB handling that is needed to store and retrieve instances. 
  */
 

public class PersonDao {

    // Cache contents:
    private boolean cacheOk;
    private List cacheData;

    /**
     * Constructor for Dao. This constructor will only reset cache.
     * If extended Dao classes are generated, it is important to
     * make sure resetCache() will be called in constructor.
     */
    public PersonDao() {
        resetCache();
    }

    /**
     * resetCache-method. This is important method when caching is used
     * to keep data in Dao instance. This method must be called whenever
     * the data in table has been changed. This method will mark current
     * cache to be outdated and next time when cacheable data will be
     * retrieved from database, the cache will be rebuilt. Please note
     * that using Dao-cache can have remarkable performace boost or it may
     * not help at all. It all depends on the amount of data and the rate
     * that data is being changed.
     */
    public void resetCache() {
        cacheOk = false;
        cacheData = null;
    }



    /**
     * createValueObject-method. This method is used when the Dao class needs
     * to create new value object instance. The reason why this method exists
     * is that sometimes the programmer may want to extend also the valueObject
     * and then this method can be overrided to return extended valueObject.
     * NOTE: If you extend the valueObject class, make sure to override the
     * clone() method in it!
     */
    public Person createValueObject() {
          return new Person();
    }


    /**
     * getObject-method. This will create and load valueObject contents from database 
     * using given Primary-Key as identifier. This method is just a convenience method 
     * for the real load-method which accepts the valueObject as a parameter. Returned
     * valueObject will be created using the createValueObject() method.
     */
    public Person getObject(Connection conn, int id) throws NotFoundException, SQLException {

          Person valueObject = createValueObject();
          valueObject.setId(id);
          load(conn, valueObject);
          return valueObject;
    }


    /**
     * load-method. This will load valueObject contents from database using
     * Primary-Key as identifier. Upper layer should use this so that valueObject
     * instance is created and only primary-key should be specified. Then call
     * this method to complete other persistent information. This method will
     * overwrite all other fields except primary-key and possible runtime variables.
     * If load can not find matching row, NotFoundException will be thrown.
     *
     * @param conn         This method requires working database connection.
     * @param valueObject  This parameter contains the class instance to be loaded.
     *                     Primary-key field must be set for this to work properly.
     */
    public void load(Connection conn, Person valueObject) throws NotFoundException, SQLException {

          String sql = "SELECT * FROM Person WHERE (id = ? ) "; 
          PreparedStatement stmt = null;

          try {
               stmt = conn.prepareStatement(sql);
               stmt.setInt(1, valueObject.getId()); 

               singleQuery(conn, stmt, valueObject);

          } finally {
              if (stmt != null)
                  stmt.close();
          }
    }


    /**
     * LoadAll-method. This will read all contents from database table and
     * build a List containing valueObjects. Please note, that this method
     * will consume huge amounts of resources if table has lot's of rows. 
     * This should only be used when target tables have only small amounts
     * of data.
     *
     * @param conn         This method requires working database connection.
     */
    public List loadAll(Connection conn) throws SQLException {

          // Check the cache status and use Cache if possible.
          if (cacheOk) {
              return cacheData;
          }

          String sql = "SELECT * FROM Person ORDER BY id ASC ";
          List searchResults = listQuery(conn, conn.prepareStatement(sql));

          // Update cache and mark it ready.
          cacheData = searchResults;
          cacheOk = true;

          return searchResults;
    }



    /**
     * create-method. This will create new row in database according to supplied
     * valueObject contents. Make sure that values for all NOT NULL columns are
     * correctly specified. Also, if this table does not use automatic surrogate-keys
     * the primary-key must be specified. After INSERT command this method will 
     * read the generated primary-key back to valueObject if automatic surrogate-keys
     * were used. 
     *
     * @param conn         This method requires working database connection.
     * @param valueObject  This parameter contains the class instance to be created.
     *                     If automatic surrogate-keys are not used the Primary-key 
     *                     field must be set for this to work properly.
     */
    public synchronized boolean create(Connection conn, Person valueObject) throws SQLException {

          String sql = "";
          PreparedStatement stmt = null;
          ResultSet result = null;

          try {
               sql = "INSERT INTO Person ( first_name, last_name, username, "
               + "password, last_login) VALUES (?, ?, ?, ?, ?) ";
               stmt = conn.prepareStatement(sql);

               stmt.setString(1, valueObject.getFirstName()); 
               stmt.setString(2, valueObject.getLastName()); 
               stmt.setString(3, valueObject.getUsername()); 
               stmt.setString(4, valueObject.getPassword());              
           	  stmt.setDate(5, new java.sql.Date(System.currentTimeMillis()) );

               int rowcount = databaseUpdate(conn, stmt);
               if (rowcount != 1) {
                    //System.out.println("PrimaryKey Error when updating DB!");
                    throw new SQLException("PrimaryKey Error when updating DB!");
               }

          } finally {
              if (stmt != null)
                  stmt.close();
          }

         
          
          /**
          * The following query will read the automatically generated primary key
          * back to valueObject. This must be done to make things consistent for 
          * upper layer processing logic.
          */
          sql = "SELECT last_insert_id()";

          try {
              stmt = conn.prepareStatement(sql);
              result = stmt.executeQuery();

              if (result.next()) {

                   valueObject.setId((int)result.getLong(1));

              } else {
                   //System.out.println("Unable to find primary-key for created object!");
                   throw new SQLException("Unable to find primary-key for created object!");
                   
              }
          } finally {
              if (result != null)
                  result.close();
              if (stmt != null)
                  stmt.close();
          }
          
          return true;

    }


    /**
     * save-method. This method will save the current state of valueObject to database.
     * Save can not be used to create new instances in database, so upper layer must
     * make sure that the primary-key is correctly specified. Primary-key will indicate
     * which instance is going to be updated in database. If save can not find matching 
     * row, NotFoundException will be thrown.
     *
     * @param conn         This method requires working database connection.
     * @param valueObject  This parameter contains the class instance to be saved.
     *                     Primary-key field must be set for this to work properly.
     */
    public boolean save(Connection conn, Person valueObject) 
          throws NotFoundException, SQLException {

          String sql = "UPDATE Person SET first_name = ?, last_name = ?, username = ?, "
               + "password = ?, last_login = ? WHERE (id = ? ) ";
          PreparedStatement stmt = null;

          try {
              stmt = conn.prepareStatement(sql);
              stmt.setString(1, valueObject.getFirstName()); 
              stmt.setString(2, valueObject.getLastName()); 
              stmt.setString(3, valueObject.getUsername()); 
              stmt.setString(4, valueObject.getPassword());            
          	  stmt.setDate(5,  new java.sql.Date(System.currentTimeMillis()) ); 
          	  stmt.setInt(6,  valueObject.getId() );
          	  
          	  
              int rowcount = databaseUpdate(conn, stmt);
              if (rowcount == 0) {
            	  
            	  return false;
                   //System.out.println("Object could not be saved! (PrimaryKey not found)");
                  // throw new NotFoundException("Object could not be saved! (PrimaryKey not found)");
                   
              }
              if (rowcount > 1) {
            	  return false;
                   //System.out.println("PrimaryKey Error when updating DB! (Many objects were affected!)");
                  // throw new SQLException("PrimaryKey Error when updating DB! (Many objects were affected!)");
              }
          } finally {
              if (stmt != null)
                  stmt.close();
          }
          
          return true;          
    }


    /**
     * delete-method. This method will remove the information from database as identified by
     * by primary-key in supplied valueObject. Once valueObject has been deleted it can not 
     * be restored by calling save. Restoring can only be done using create method but if 
     * database is using automatic surrogate-keys, the resulting object will have different 
     * primary-key than what it was in the deleted object. If delete can not find matching row,
     * NotFoundException will be thrown.
     *
     * @param conn         This method requires working database connection.
     * @param valueObject  This parameter contains the class instance to be deleted.
     *                     Primary-key field must be set for this to work properly.
     */
    public void delete(Connection conn, Person valueObject) 
          throws NotFoundException, SQLException {

          String sql = "DELETE FROM Person WHERE (id = ? ) ";
          PreparedStatement stmt = null;

          try {
              stmt = conn.prepareStatement(sql);
              stmt.setInt(1, valueObject.getId()); 

              int rowcount = databaseUpdate(conn, stmt);
              if (rowcount == 0) {
                   //System.out.println("Object could not be deleted (PrimaryKey not found)");
                   throw new NotFoundException("Object could not be deleted! (PrimaryKey not found)");
              }
              if (rowcount > 1) {
                   //System.out.println("PrimaryKey Error when updating DB! (Many objects were deleted!)");
                   throw new SQLException("PrimaryKey Error when updating DB! (Many objects were deleted!)");
              }
          } finally {
              if (stmt != null)
                  stmt.close();
          }
    }
    
    
    public void delete(Connection conn, int id) 
            throws NotFoundException, SQLException {

            String sql = "DELETE FROM Person WHERE (id = ? ) ";
            PreparedStatement stmt = null;

            try {
                stmt = conn.prepareStatement(sql);
                stmt.setInt(1, id); 

                int rowcount = databaseUpdate(conn, stmt);
                if (rowcount == 0) {
                     //System.out.println("Object could not be deleted (PrimaryKey not found)");
                     throw new NotFoundException("Object could not be deleted! (PrimaryKey not found)");
                }
                if (rowcount > 1) {
                     //System.out.println("PrimaryKey Error when updating DB! (Many objects were deleted!)");
                     throw new SQLException("PrimaryKey Error when updating DB! (Many objects were deleted!)");
                }
            } finally {
                if (stmt != null)
                    stmt.close();
            }
      }


    /**
     * deleteAll-method. This method will remove all information from the table that matches
     * this Dao and ValueObject couple. This should be the most efficient way to clear table.
     * Once deleteAll has been called, no valueObject that has been created before can be 
     * restored by calling save. Restoring can only be done using create method but if database 
     * is using automatic surrogate-keys, the resulting object will have different primary-key 
     * than what it was in the deleted object. (Note, the implementation of this method should
     * be different with different DB backends.)
     *
     * @param conn         This method requires working database connection.
     */
    public void deleteAll(Connection conn) throws SQLException {

          String sql = "DELETE FROM Person";
          PreparedStatement stmt = null;

          try {
              stmt = conn.prepareStatement(sql);
              int rowcount = databaseUpdate(conn, stmt);
          } finally {
              if (stmt != null)
                  stmt.close();
          }
    }


    /**
     * coutAll-method. This method will return the number of all rows from table that matches
     * this Dao. The implementation will simply execute "select count(primarykey) from table".
     * If table is empty, the return value is 0. This method should be used before calling
     * loadAll, to make sure table has not too many rows.
     *
     * @param conn         This method requires working database connection.
     */
    public int countAll(Connection conn) throws SQLException {

          // Check the cache status and use Cache if possible.
          if (cacheOk) {
              return cacheData.size();
          }


          String sql = "SELECT count(*) FROM Person";
          PreparedStatement stmt = null;
          ResultSet result = null;
          int allRows = 0;

          try {
              stmt = conn.prepareStatement(sql);
              result = stmt.executeQuery();

              if (result.next())
                  allRows = result.getInt(1);
          } finally {
              if (result != null)
                  result.close();
              if (stmt != null)
                  stmt.close();
          }
          return allRows;
    }


    /** 
     * searchMatching-Method. This method provides searching capability to 
     * get matching valueObjects from database. It works by searching all 
     * objects that match permanent instance variables of given object.
     * Upper layer should use this by setting some parameters in valueObject
     * and then  call searchMatching. The result will be 0-N objects in a List, 
     * all matching those criteria you specified. Those instance-variables that
     * have NULL values are excluded in search-criteria.
     *
     * @param conn         This method requires working database connection.
     * @param valueObject  This parameter contains the class instance where search will be based.
     *                     Primary-key field should not be set.
     */
    public List searchMatching(Connection conn, Person valueObject) throws SQLException {

          List searchResults;

          boolean first = true;
          StringBuffer sql = new StringBuffer("SELECT * FROM Person WHERE 1=1 ");

          if (valueObject.getId() != 0) {
              if (first) { first = false; }
              sql.append("AND id = ").append(valueObject.getId()).append(" ");
          }

          if (valueObject.getFirstName() != null) {
              if (first) { first = false; }
              sql.append("AND first_name LIKE '").append(valueObject.getFirstName()).append("%' ");
          }

          if (valueObject.getLastName() != null) {
              if (first) { first = false; }
              sql.append("AND last_name LIKE '").append(valueObject.getLastName()).append("%' ");
          }

          if (valueObject.getUsername() != null) {
              if (first) { first = false; }
              sql.append("AND username LIKE '").append(valueObject.getUsername()).append("%' ");
          }

          if (valueObject.getPassword() != null) {
              if (first) { first = false; }
              sql.append("AND password LIKE '").append(valueObject.getPassword()).append("%' ");
          }

          if (valueObject.getRegistration() != null) {
              if (first) { first = false; }
              sql.append("AND date_registration = '").append(valueObject.getRegistration()).append("' ");
          }

          if (valueObject.getLast_login() != null) {
              if (first) { first = false; }
              sql.append("AND last_login = '").append(valueObject.getLast_login()).append("' ");
          }


          sql.append("ORDER BY id ASC ");

          // Prevent accidential full table results.
          // Use loadAll if all rows must be returned.
          if (first)
               searchResults = new ArrayList();
          else
               searchResults = listQuery(conn, conn.prepareStatement(sql.toString()));

          return searchResults;
    }
    
    public boolean isUserExist(Connection conn, String username) throws SQLException {

        List<Person> searchResults;
 
 
        if (username != null){
        	 StringBuffer sql = new StringBuffer("SELECT * FROM Person WHERE username LIKE '" + username + "'");       
        	 searchResults = listQuery(conn, conn.prepareStatement(sql.toString()));        	 
        }    
        else return false;             

        return (searchResults.size()>0)? true: false;
  }
    
    public List<Person> searchUser(Connection conn, String username) throws SQLException {

        ArrayList<Person> searchResults = new ArrayList<Person>();
 
        if (username != null){
        	 StringBuffer sql = new StringBuffer("SELECT * FROM Person WHERE username LIKE '" + username + "'");       
        	 searchResults = (ArrayList<Person>) listQuery(conn, conn.prepareStatement(sql.toString()));        	 
        }                       

        return searchResults;
    }
    
    /*
    
    public List<Person> searchById(Connection conn, int userId) throws SQLException {

        ArrayList<Person> searchResults = new ArrayList<Person>();
 
        if (userId >0){
        	 StringBuffer sql = new StringBuffer("SELECT * FROM Person WHERE id = " + userId );       
        	 searchResults = (ArrayList<Person>) listQuery(conn, conn.prepareStatement(sql.toString()));        	 
        }                       

        return searchResults;
    }
    
    */


    
 

    /**
     * databaseUpdate-method. This method is a helper method for internal use. It will execute
     * all database handling that will change the information in tables. SELECT queries will
     * not be executed here however. The return value indicates how many rows were affected.
     * This method will also make sure that if cache is used, it will reset when data changes.
     *
     * @param conn         This method requires working database connection.
     * @param stmt         This parameter contains the SQL statement to be excuted.
     */
    protected int databaseUpdate(Connection conn, PreparedStatement stmt) throws SQLException {

          int result = stmt.executeUpdate();

          resetCache();

          return result;
    }



    /**
     * databaseQuery-method. This method is a helper method for internal use. It will execute
     * all database queries that will return only one row. The resultset will be converted
     * to valueObject. If no rows were found, NotFoundException will be thrown.
     *
     * @param conn         This method requires working database connection.
     * @param stmt         This parameter contains the SQL statement to be excuted.
     * @param valueObject  Class-instance where resulting data will be stored.
     */
    protected void singleQuery(Connection conn, PreparedStatement stmt, Person valueObject) 
          throws NotFoundException, SQLException {

          ResultSet result = null;

          try {
              result = stmt.executeQuery();

              if (result.next()) {

                   valueObject.setId(result.getInt("id")); 
                   valueObject.setFirstName(result.getString("first_name")); 
                   valueObject.setLastName(result.getString("last_name")); 
                   valueObject.setUsername(result.getString("username")); 
                   valueObject.setPassword(result.getString("password")); 
                   valueObject.setRegistration(result.getDate("date_registration")); 
                   valueObject.setLast_login(result.getDate("last_login")); 

              } else {
                    //System.out.println("Person Object Not Found!");
                    throw new NotFoundException("Person Object Not Found!");
              }
          } finally {
              if (result != null)
                  result.close();
              if (stmt != null)
                  stmt.close();
          }
    }


    /**
     * databaseQuery-method. This method is a helper method for internal use. It will execute
     * all database queries that will return multiple rows. The resultset will be converted
     * to the List of valueObjects. If no rows were found, an empty List will be returned.
     *
     * @param conn         This method requires working database connection.
     * @param stmt         This parameter contains the SQL statement to be excuted.
     */
    protected List<Person> listQuery(Connection conn, PreparedStatement stmt) throws SQLException {

          ArrayList<Person> searchResults = new ArrayList<Person>();
          ResultSet result = null;

          try {
              result = stmt.executeQuery();

              while (result.next()) {
                   Person temp = createValueObject();

                   temp.setId(result.getInt("id")); 
                   temp.setFirstName(result.getString("first_name")); 
                   temp.setLastName(result.getString("last_name")); 
                   temp.setUsername(result.getString("username")); 
                   temp.setPassword(result.getString("password")); 
                   temp.setRegistration(result.getDate("date_registration")); 
                   temp.setLast_login(result.getDate("last_login")); 

                   searchResults.add(temp);
              }

          } finally {
              if (result != null)
                  result.close();
              if (stmt != null)
                  stmt.close();
          }

          return  (List<Person>)searchResults;
    }

	
	
    /*
     * example of the sql 
     * 
		SELECT  *
			FROM (SELECT p.* FROM 
		                (SELECT p.* FROM person as p INNER JOIN account as a ON p.id = a.person_id WHERE a.type = 1) as p 
		                INNER JOIN rental as r ON p.id = r.person_id WHERE r.movie_id = 1 ) as pr 
		    LEFT JOIN address a	ON pr.id = a.person_id
		WHERE pr.first_name LIKE '%j%' 
		AND   pr.last_name LIKE '%y%' 
		AND   a.street LIKE '%y%'
		AND   a.city LIKE '%y%' 
		AND   a.state LIKE '%y%' 
		AND   a.country LIKE '%y%' 
		AND   a.zip LIKE '%y%'
		;
     */
	
	  public List<Person> searchMatching(Connection conn, String firstName,
				String lastName, Address address, int type, int issuedMovie) throws SQLException {

          List<Person> searchResults;


          boolean isFirst = true;
          StringBuffer sql = new StringBuffer("SELECT * ");
          
          String subSql ="";
          
          //if the member type doesn't need to be searched, then no need to join the account,
          //so just use person 
          if (type!=0){       	  
        	  subSql ="(SELECT p.* FROM person as p INNER JOIN account as a ON p.id = a.person_id WHERE a.type = "+type+")";        	  
          }else{
        	  subSql ="person";
          }
          
          //if no movie need to be searched, then no need to join the rental table
          if (issuedMovie != 0) {
              sql.append("(SELECT p.* FROM ").append(subSql).append(" as p INNER JOIN rental as r ON p.id = r.person_id WHERE r.movie_id = ").append(issuedMovie).append(") as pr ");
          }else{
        	  sql.append("person as pr ");
          }
          
          if(address!=null){
	          String street = address.getStreet();
	          String city = address.getCity();
	          String state = address.getState();
	          String country =address.getCountry();
	          String zip = address.getZip();
	          
	          //at least one attribute need to be searched otherwise no need to join the address table
	          if(street!=null || city!=null || state!=null || country!=null || zip!=null){
	        	  sql.append("LEFT JOIN address as a ON pr.id = a.person_id ");
	        	  
		          isFirst = sqlBuilder(street, "a.street",isFirst, sql);
		          isFirst = sqlBuilder(city, "a.city",isFirst, sql);
		          isFirst = sqlBuilder(state, "a.state",isFirst, sql);
		          isFirst = sqlBuilder(country, "a.country",isFirst, sql);
		          isFirst = sqlBuilder(zip, "a.zip",isFirst, sql);
		          
	          }//end if
	         
          }//end if(address)

          isFirst = sqlBuilder(firstName, "pr.first_name",isFirst, sql);
          isFirst = sqlBuilder(lastName, "pr.last_name",isFirst, sql);


          // Prevent accidential full table results.
          // Use loadAll if all rows must be returned.
          if (isFirst)
               searchResults = new ArrayList();
          else
               searchResults = listQuery(conn, conn.prepareStatement(sql.toString()));

          return searchResults;
    }

	// this method is designed for the use within the searchMatching method
	// helps to build the sql statement based on the value, to create a dynamic sql
	private boolean sqlBuilder(String value, String sqlColName, boolean isFirst, StringBuffer sql) {
		
		
        if (value!= null) {
            if (isFirst) { 
          	  isFirst = false; 
          	  sql.append("WHERE ");
            }else{
          	  sql.append("AND ");
            }
            sql.append(sqlColName).append(" LIKE '").append(value).append("%' ");
        }//end if
		
        
        return isFirst;
	}
    


}