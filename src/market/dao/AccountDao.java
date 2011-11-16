/*
 * This source file was generated by FireStorm/DAO.
 * 
 * If you purchase a full license for FireStorm/DAO you can customize this header file.
 * 
 * For more information please visit http://www.codefutures.com/products/firestorm
 */

package market.dao;

import java.util.Date;
import market.dto.*;
import market.exceptions.*;

public interface AccountDao
{
	/** 
	 * Inserts a new row in the Account table.
	 */
	public AccountPk insert(Account dto) throws AccountDaoException;

	/** 
	 * Updates a single row in the Account table.
	 */
	public void update(AccountPk pk, Account dto) throws AccountDaoException;

	/** 
	 * Deletes a single row in the Account table.
	 */
	public void delete(AccountPk pk) throws AccountDaoException;

	/** 
	 * Returns the rows from the Account table that matches the specified primary-key value.
	 */
	public Account findByPrimaryKey(AccountPk pk) throws AccountDaoException;

	/** 
	 * Returns all rows from the Account table that match the criteria 'id = :id'.
	 */
	public Account findByPrimaryKey(int id) throws AccountDaoException;

	/** 
	 * Returns all rows from the Account table that match the criteria ''.
	 */
	public Account[] findAll() throws AccountDaoException;

	/** 
	 * Sets the value of maxRows
	 */
	public void setMaxRows(int maxRows);

	/** 
	 * Gets the value of maxRows
	 */
	public int getMaxRows();

	/** 
	 * Returns all rows from the Account table that match the specified arbitrary SQL statement
	 */
	public Account[] findByDynamicSelect(String sql, Object[] sqlParams) throws AccountDaoException;

	/** 
	 * Returns all rows from the Account table that match the specified arbitrary SQL statement
	 */
	public Account[] findByDynamicWhere(String sql, Object[] sqlParams) throws AccountDaoException;

}
