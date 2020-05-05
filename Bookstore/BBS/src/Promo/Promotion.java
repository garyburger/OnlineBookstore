package Promo;

public class Promotion {

	private int promoID;
	private String code;
	private double percentage;
	private String startDate;
	private String expDate;
	
	public Promotion() {
		
	}

	public Promotion(int promoID, String code, double percentage, String startDate, String expDate) {
		super();
		this.promoID = promoID;
		this.code = code;
		this.percentage = percentage;
		this.startDate = startDate;
		this.expDate = expDate;
	}

	public int getPromoID() {
		return promoID;
	}

	public void setPromoID(int promoID) {
		this.promoID = promoID;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public double getPercentage() {
		return percentage;
	}

	public void setPercentage(double percentage) {
		this.percentage = percentage;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	
		
	
	
}
