package video.dto;

import java.util.Date;

public class CreditCard {
	
	private int cardNumber;
	private String issuer;
	private String type;
	private Date expirationDate;

	public CreditCard() {}
	
	public CreditCard(int cardNumber, String issuer, String type, Date expirationDate) {
		this.cardNumber = cardNumber;
		this.issuer = issuer;
		this.type = type;
		this.expirationDate = expirationDate;
	}

	public int getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(int cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getIssuer() {
		return issuer;
	}

	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	
}
