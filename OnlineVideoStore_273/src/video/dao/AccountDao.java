package video.dao;

import java.sql.*;
import java.util.*;

import video.dto.Account;
import video.dto.Person;
import video.exceptions.NotFoundException;



 /**
  * Account Data Access Object (DAO).
  * This class contains all database handling that is needed to 
  * permanently store and retrieve Account object instances. 
  */




public class AccountDao {



    /**
     * createValueObject-method. This method is used when the Dao class needs
     * to create new value object instance. The reason why this method exists
     * is that sometimes the programmer may want to extend also the valueObject
     * and then this method can be overrided to return extended valueObject.
     * NOTE: If you extend the valueObject class, make sure to override the
     * clone() method in it!
     */
    public Account createValueObject() {
          return new Account();
    }


    /**
     * getObject-method. This will create and load valueObject contents from database 
     * using given Primary-Key as identifier. This method is just a convenience method 
     * for the real load-method which accepts the valueObject as a parameter. Returned
     * valueObject will be created using the createValueObject() method.
     */
    public Account getObject(Connection conn, int id) throws NotFoundException, SQLException {

          Account valueObject = createValueObject();
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
    public void load(Connection conn, Account valueObject) throws NotFoundException, SQLException {

          String sql = "SELECT * FROM account WHERE (id = ? ) "; 
          PreparedStatement stmt = null;

          try {
               stmt = conn.prepareStatement(sql);
               stmt.setLong(1, valueObject.getId()); 

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

          String sql = "SELECT * FROM account ORDER BY id ASC ";
          List searchResults = listQuery(conn, conn.prepareStatement(sql));

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
    public synchronized void create(Connection conn, Account valueObject) throws SQLException {

          String sql = "";
          PreparedStatement stmt = null;
          ResultSet result = null;

          try {
               sql = "INSERT INTO account ( person_id, ssn, type, "
               + "balance, monthly_fee, outstanding_movies) VALUES (?, ?, ?, ?, ?, ?) ";
               stmt = conn.prepareStatement(sql);
               
               stmt.setLong(1, valueObject.getPersonId()); 
               stmt.setString(2, valueObject.getSsn()); 
               stmt.setInt(3, valueObject.getUserType()); 
               stmt.setDouble(4, valueObject.getBalance()); 
               stmt.setDouble(5, valueObject.getMonthlyFee()); 
               stmt.setInt(6, valueObject.getOutstandingMovies()); 

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
    public boolean save(Connection conn, Account valueObject) 
          throws NotFoundException, SQLException {

          String sql = "UPDATE account SET person_id = ?, ssn = ?, type = ?, "
               + "balance = ?, monthly_fee = ?, outstanding_movies = ? WHERE (id = ? ) ";
          PreparedStatement stmt = null;

          try {
              stmt = conn.prepareStatement(sql);
              stmt.setLong(1, valueObject.getPersonId()); 
              stmt.setString(2, valueObject.getSsn()); 
              stmt.setInt(3, valueObject.getUserType()); 
              stmt.setDouble(4, valueObject.getBalance()); 
              stmt.setDouble(5, valueObject.getMonthlyFee()); 
              stmt.setInt(6, valueObject.getOutstandingMovies()); 

              stmt.setLong(7, valueObject.getId()); 

              int rowcount = databaseUpdate(conn, stmt);
              if (rowcount == 0) {
            	  
            	  return false;
                   //System.out.println("Object could not be saved! (PrimaryKey not found)");
                   //throw new NotFoundException("Object could not be saved! (PrimaryKey not found)");
              }
              if (rowcount > 1) {
            	  return false;
                   //System.out.println("PrimaryKey Error when updating DB! (Many objects were affected!)");
                   //throw new SQLException("PrimaryKey Error when updating DB! (Many objects were affected!)");
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
    public void delete(Connection conn, Account valueObject) 
          throws NotFoundException, SQLException {

          String sql = "DELETE FROM account WHERE (id = ? ) ";
          PreparedStatement stmt = null;

          try {
              stmt = conn.prepareStatement(sql);
              stmt.setLong(1, valueObject.getId()); 

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

          String sql = "DELETE FROM account";
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

          String sql = "SELECT count(*) FROM account";
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
    public List searchMatching(Connection conn, Account valueObject) throws SQLException {

          List searchResults;

          boolean first = true;
          StringBuffer sql = new StringBuffer("SELECT * FROM account WHERE 1=1 ");

          if (valueObject.getId() != 0) {
              if (first) { first = false; }
              sql.append("AND id = ").append(valueObject.getId()).append(" ");
          }

          if (valueObject.getPersonId() != 0) {
              if (first) { first = false; }
              sql.append("AND person_id = ").append(valueObject.getPersonId()).append(" ");
          }

          if (valueObject.getSsn() != null) {
              if (first) { first = false; }
              sql.append("AND ssn LIKE '").append(valueObject.getSsn()).append("%' ");
          }

          if (valueObject.getUserType() != 0) {
              if (first) { first = false; }
              sql.append("AND type = ").append(valueObject.getUserType()).append(" ");
          }

          if (valueObject.getBalance() != 0) {
              if (first) { first = false; }
              sql.append("AND balance = ").append(valueObject.getBalance()).append(" ");
          }

          if (valueObject.getMonthlyFee() != 0) {
              if (first) { first = false; }
              sql.append("AND monthly_fee = ").append(valueObject.getMonthlyFee()).append(" ");
          }

          if (valueObject.getOutstandingMovies() != 0) {
              if (first) { first = false; }
              sql.append("AND outstanding_movies = ").append(valueObject.getOutstandingMovies()).append(" ");
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
    protected void singleQuery(Connection conn, PreparedStatement stmt, Account valueObject) 
          throws NotFoundException, SQLException {

          ResultSet result = null;

          try {
              result = stmt.executeQuery();

              if (result.next()) {

                   valueObject.setId(result.getInt("id")); 
                   valueObject.setPersonId(result.getInt("person_id")); 
                   valueObject.setSsn(result.getString("ssn")); 
                   valueObject.setUserType(result.getInt("type")); 
                   valueObject.setBalance(result.getDouble("balance")); 
                   //valueObject.setMonthlyFee(result.getDouble("monthly_fee")); 
                   valueObject.setOutstandingMovies(result.getInt("outstanding_movies")); 

              } else {
                    //System.out.println("Account Object Not Found!");
                    throw new NotFoundException("Account Object Not Found!");
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
    protected List listQuery(Connection conn, PreparedStatement stmt) throws SQLException {

          ArrayList searchResults = new ArrayList();
          ResultSet result = null;

          try {
              result = stmt.executeQuery();

              while (result.next()) {
                   Account temp = createValueObject();

                   temp.setId(result.getInt("id")); 
                   temp.setPersonId(result.getInt("person_id")); 
                   temp.setSsn(result.getString("ssn")); 
                   temp.setUserType(result.getInt("type")); 
                   temp.setBalance(result.getDouble("balance")); 
                  // temp.setMonthlyFee(result.getDouble("monthly_fee")); 
                   temp.setOutstandingMovies(result.getInt("outstanding_movies")); 

                   searchResults.add(temp);
              }

          } finally {
              if (result != null)
                  result.close();
              if (stmt != null)
                  stmt.close();
          }

          return (List)searchResults;
    }


	public List<Account> searchByUserId(Connection conn, int userId) {
        ArrayList<Account> searchResults = new ArrayList<Account>();
        
        if (userId >0){
        	 StringBuffer sql = new StringBuffer("SELECT * FROM Account WHERE person_id = " + userId );       
        	 try {
				searchResults = (ArrayList<Account>) listQuery(conn, conn.prepareStatement(sql.toString()));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}        	 
        }                       

        return searchResults;
	}
	
 


}