package Cart;

public class Order {

	private String transactionID;
	private String userID;
	private String bookID;
	private String orderDate;
	private String cardID;
	private String totalPrice;
	
	public Order() {
		
	}
	public Order(String transactionID, String isbn, String userID, String orderDate,
			String cardNumber, String totalPrice) {
		super();
		this.transactionID = transactionID;
		this.bookID = isbn;
		this.userID = userID;
		this.orderDate = orderDate;
		this.cardID = cardNumber;
		this.totalPrice = totalPrice;
	}
	public String getTransactionID() {
		return transactionID;
	}
	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getCardID() {
		return cardID;
	}
	public void setCardID(String cardID) {
		this.cardID = cardID;
	}
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
}
