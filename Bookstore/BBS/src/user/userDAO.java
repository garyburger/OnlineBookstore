package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import javax.crypto.spec.SecretKeySpec;

import com.mysql.jdbc.Driver;

import Services.AES;
import book.Books;

public class userDAO {
	/*Instance Variables*/
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs; 
    private AES aes; //Encryption
    private String key = "1234567890123456"; //description Key
    private ArrayList<String> EmailList;
    /*constructor*/
    public userDAO(){
        try{            
            String dbURL = "jdbc:mysql://localhost:3306/bbs1";
            String dbID = "root";
            String dbPassword = "bangkok19";
            
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
            System.out.println("Connected");
        }catch(Exception e){
        	System.out.println("No Connection");
            e.printStackTrace();
        }
    }
    /*
     * Login method to access the account
     * Each users have specific roles, logging into different UI.
     * 
     * @param String userID : user ID to login
     * @param String userPassword : password to login
     * @return each number has specific roles(administrator, registered user, unregistered user)
     * */
    public int login(String userID, String userPassword){
        String SQL = "SELECT password, roles From users WHERE userName = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                //if password matching with the database in mysql
                if(rs.getString(1).equals(userPassword)&& rs.getInt(2)==2){
                    return 2; //login success
                }else if (rs.getString(1).equals(userPassword)&&rs.getInt(2)==1 ){
                	return 1;
                }else if (rs.getString(1).equals(userPassword)&&rs.getInt(2)==0){
                	return -3;
                }else{
                    return 0; //wrong password
                }
            }
            return -1; //No User Info
        }catch(Exception e){
            e.printStackTrace();
        }
        return -2; //Data Base Error
    }

    /*
     * Method to search user information based on different SQL strings.
     * 
     * @param string userID : search keyword based on userID(userName).
     * @param string info : keyword to search specific column
     * @return result : the value after searching
     * */
    public String findInfo(String userID, String info) {
    	String SQL ="select * from users WHERE userName =?";
    	try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	String result =rs.getString(info);
            	return result;
            }
    	}catch(Exception e){
            e.printStackTrace();
        }
    	return null;
    }
    
    /*
     * Method to search credit card information based on different SQL strings.
     * 
     * @param string userID : search keyword based on userID(userName).
     * @param string info : keyword to search specific column
     * @return result : the value after searching
     * */
    public String findCCinfo(String userID, String info) {
    	String SQL ="select * from credit_card_info WHERE userID =?";
    	try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
            	String result =rs.getString(info);
            	System.out.println(result);
            	return result;
            }
    	}catch(Exception e){
            e.printStackTrace();
        }
    	return null;
    }
    /*
     * Method to find password based on userID, userNames, and Emial on SQL Database.
     * 
     * @param string userID : search keyword based on userID(userName).
     * @param string userFirstName : required search keyword based on First Name.
	 * @param string userLastName : required search keyword based on Last Name.
	 * @param string userEmail : required search keyword based on E-mail.
	 *
     * @return : the integer value to notice whether it's found or not
     * */    public int findPasswd(String userID, String userFirstName, String userLastName, String userEmail){
        String SQL = "SELECT firstName, lastName, userEmail From users WHERE userName = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                //if password matching with the database in mysql
                if(rs.getString(1).equals(userFirstName) && rs.getString(2).equals(userLastName) && rs.getString(3).equals(userEmail)){
                    return 1; //Find success
                }
                else{
                    return 0; //wrong Information
                }
            }
            return -1; //No User Info
        }catch(Exception e){
            e.printStackTrace();
        }
        return -2; //Data Base Error
    }
    public int signUp(User user){
    	int idGenerator = getRandomNumberInRange(1000,9999);
    	
        String SQL ="INSERT INTO users VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,idGenerator);
            pstmt.setString(2,user.getUserID());
            pstmt.setString(3,user.getUserPassword());
            //pstmt.setString(3,aes.encrypt(user.getUserPassword(), key));
            pstmt.setString(4,user.getUserFirstName());
            pstmt.setString(5,user.getUserLastName());
            pstmt.setString(6,user.getUserEmail());
            pstmt.setString(7,user.getUserAddr());
            pstmt.setInt(8,0);
            pstmt.setInt(9,0);
            pstmt.setString(10, randomString());
            
            //pstmt.setString(9,randomString());
            System.out.println(idGenerator);

            System.out.println("Signup user: "+user.getUserID());
            System.out.println(user.getUserPassword());

            return pstmt.executeUpdate();


        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//db error
    }

    public int creditAdd(User user){
    	String userID = findInfo(user.getUserID(),"userID");
    	System.out.println("useriD : " + userID);
    	int idGenerator = getRandomNumberInRange(1000,9999);
    	String SQL ="INSERT INTO credit_card_info VALUES(?, ?, ?, ?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,idGenerator);
            pstmt.setString(2,userID);
            pstmt.setInt(3,user.getCcNum());
            pstmt.setInt(4, user.getCcCvv());


            System.out.println("Card User: "+user.getUserID());
            System.out.println(user.getUserPassword());

            return pstmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//db error
    }
    
    public int updateUser(User user, String id) {
    	String SQL = "UPDATE users SET password=?, firstName=?, lastName=?, shippingAddress=? WHERE userName=?";
        try {
            pstmt = conn.prepareStatement(SQL);
        	pstmt.setString(1, user.getUserPassword());
        	pstmt.setString(2, user.getUserFirstName());
            pstmt.setString(3, user.getUserLastName());
            pstmt.setString(4,user.getUserAddr());        
            pstmt.setString(5, id);
            
            System.out.println("New Password: "+user.getUserPassword());
            
            return pstmt.executeUpdate();
          
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1; //db error
    }
    public int verify(String veriCode) {
    	String SQL = "UPDATE users SET roles=? WHERE verifyCode=?";
    	try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, 1);
            pstmt.setString(2, veriCode);
            return pstmt.executeUpdate();

        }catch(Exception e){
            e.printStackTrace();
        }

    	return -1;//db error
    }

    public ArrayList<String> getEmailList(){
    	EmailList = new ArrayList<>();
		String SQL ="SELECT userEmail from users";
		try{
        	pstmt = conn.prepareStatement(SQL);        	
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()) {
        		EmailList.add(
                		rs.getString(1)
        				);
        	}
		}catch(Exception e){
	        e.printStackTrace();
	    }
		return EmailList;

    }
    
    /*
    *THIS IS NOT OUR CODE. Credit to GeeksForGeeks for code used
    * https://www.geeksforgeeks.org/generate-random-string-of-given-size-in-java/
    * Accessed July 24, 2019
    *
    * Generates a string of random characters. Used in confirmation email
     */
    private String randomString(){
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(10);

        for (int i = 0; i < 10; i++) {

            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index
                    = (int)(AlphaNumericString.length()
                    * Math.random());

            // add Character one by one in end of sb
            sb.append(AlphaNumericString
                    .charAt(index));
        }
        System.out.println("Random Code : "+sb.toString());
        return sb.toString();
    }//randomString
    
    public int activate(String userID, String code){
        String SQL = "SELECT userCode, roles From USER WHERE userName = ?";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if(rs.next()){
                //if password matching with the database in mysql
                if(rs.getString(1).equals(code)&& rs.getInt(2)==0){
                    return 1; //activation success
                }
                else
                    return 0;
            }
            return -1;
        }catch(Exception e){
            e.printStackTrace();
        }
        return -2;
    }

    private int getRandomNumberInRange(int min, int max) {

		if (min >= max) {
			throw new IllegalArgumentException("max must be greater than min");
		}

		Random r = new Random();
		return r.nextInt((max - min) + 1) + min;
	}//getRandomNumberInRange
}
