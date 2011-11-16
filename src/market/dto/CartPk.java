/*
 * This source file was generated by FireStorm/DAO.
 * 
 * If you purchase a full license for FireStorm/DAO you can customize this header file.
 * 
 * For more information please visit http://www.codefutures.com/products/firestorm
 */

package market.dto;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/** 
 * This class represents the primary key of the Cart table.
 */
public class CartPk implements Serializable
{
	protected int accountId;

	protected int lineItemId;

	/** 
	 * This attribute represents whether the primitive attribute accountId is null.
	 */
	protected boolean accountIdNull;

	/** 
	 * This attribute represents whether the primitive attribute lineItemId is null.
	 */
	protected boolean lineItemIdNull;

	/** 
	 * Sets the value of accountId
	 */
	public void setAccountId(int accountId)
	{
		this.accountId = accountId;
	}

	/** 
	 * Gets the value of accountId
	 */
	public int getAccountId()
	{
		return accountId;
	}

	/** 
	 * Sets the value of lineItemId
	 */
	public void setLineItemId(int lineItemId)
	{
		this.lineItemId = lineItemId;
	}

	/** 
	 * Gets the value of lineItemId
	 */
	public int getLineItemId()
	{
		return lineItemId;
	}

	/**
	 * Method 'CartPk'
	 * 
	 */
	public CartPk()
	{
	}

	/**
	 * Method 'CartPk'
	 * 
	 * @param accountId
	 * @param lineItemId
	 */
	public CartPk(final int accountId, final int lineItemId)
	{
		this.accountId = accountId;
		this.lineItemId = lineItemId;
	}

	/** 
	 * Sets the value of accountIdNull
	 */
	public void setAccountIdNull(boolean accountIdNull)
	{
		this.accountIdNull = accountIdNull;
	}

	/** 
	 * Gets the value of accountIdNull
	 */
	public boolean isAccountIdNull()
	{
		return accountIdNull;
	}

	/** 
	 * Sets the value of lineItemIdNull
	 */
	public void setLineItemIdNull(boolean lineItemIdNull)
	{
		this.lineItemIdNull = lineItemIdNull;
	}

	/** 
	 * Gets the value of lineItemIdNull
	 */
	public boolean isLineItemIdNull()
	{
		return lineItemIdNull;
	}

	/**
	 * Method 'equals'
	 * 
	 * @param _other
	 * @return boolean
	 */
	public boolean equals(Object _other)
	{
		if (_other == null) {
			return false;
		}
		
		if (_other == this) {
			return true;
		}
		
		if (!(_other instanceof CartPk)) {
			return false;
		}
		
		final CartPk _cast = (CartPk) _other;
		if (accountId != _cast.accountId) {
			return false;
		}
		
		if (lineItemId != _cast.lineItemId) {
			return false;
		}
		
		if (accountIdNull != _cast.accountIdNull) {
			return false;
		}
		
		if (lineItemIdNull != _cast.lineItemIdNull) {
			return false;
		}
		
		return true;
	}

	/**
	 * Method 'hashCode'
	 * 
	 * @return int
	 */
	public int hashCode()
	{
		int _hashCode = 0;
		_hashCode = 29 * _hashCode + accountId;
		_hashCode = 29 * _hashCode + lineItemId;
		_hashCode = 29 * _hashCode + (accountIdNull ? 1 : 0);
		_hashCode = 29 * _hashCode + (lineItemIdNull ? 1 : 0);
		return _hashCode;
	}

	/**
	 * Method 'toString'
	 * 
	 * @return String
	 */
	public String toString()
	{
		StringBuffer ret = new StringBuffer();
		ret.append( "market.dto.CartPk: " );
		ret.append( "accountId=" + accountId );
		ret.append( ", lineItemId=" + lineItemId );
		return ret.toString();
	}

}
