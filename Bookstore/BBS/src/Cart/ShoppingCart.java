package Cart;



public class ShoppingCart {

	private int cartID;  
	private String userID;
	private String bookID;
	private String cartTotal;
	private int promoId;
	
	public ShoppingCart() {
		
	}
	
	public ShoppingCart(int cartID, String userID,  String bookID, String cartTotal, 
			 int promoId) {
		super();
		this.cartID = cartID;
		this.userID = userID;
		this.cartTotal = cartTotal;
		this.bookID = bookID;
		this.promoId = promoId;
	}
	
	public int getCartID() {
		return cartID;
	}
	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getCartTotal() {
		return cartTotal;
	}
	public void setCartTotal(String cartTotal) {
		this.cartTotal = cartTotal;
	}
	
	public String getBookID() {
		return bookID;
	}
	public void setBookID(String bookID) {
		this.bookID = bookID;
	} 
	public int getPromoId() {
		return promoId;
	}
	public void setPromoId(int promoId) {
		this.promoId = promoId;
	}



	
}