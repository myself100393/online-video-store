package team6.entity;

import java.util.Date;

public class LineItem {
	
	private int quantity;
	private Date dueDate;
	private double price;
	
	public LineItem() {}
	
	public LineItem(int quantity, Date dueDate, double price) {
		this.quantity = quantity;
		this.dueDate = dueDate;
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}
}
