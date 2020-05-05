package book;
package cart;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import com.mysql.jdbc.Driver;

import book.Books;
import user.User;


public class bookDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    public ArrayList<Books> goodsList = null;
    public bookDAO(){
        try{
            String dbURL = "jdbc:mysql://localhost:3306/BBS1";
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

    public String findInfo(String bookID, String info) {
    	String SQL ="select * from books WHERE bookID =?";
    	try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bookID);
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
    //Find books by isbn
    public String[] findInfo(String info, int method) {
    	
        String SQL = "";
        //Find by bookID
        if(method == 1){
            SQL ="SELECT * from books WHERE bookID = ?";
        }
        //Find by ISBN
        else if(method == 2){
            SQL ="SELECT * from books WHERE ISBN = ?";
        }
        //Find by Category
        else if(method == 3){
            SQL ="SELECT * from books WHERE category = ?";
        }
        //Find by Author
        else if(method == 4){
            SQL ="SELECT * from books WHERE Author = ?";
        }
        //Find by Title
        else if(method == 5){
            SQL ="SELECT * from books WHERE title = ?";
        }
        //Find by Publisher
        else if(method == 6){
            SQL ="SELECT * from books WHERE publisher = ?";
        }
        //Find by year published
        else if(method == 7){
            SQL ="SELECT * from books WHERE yearPublished = ?";
        }else {
            SQL ="SELECT * from books";
        }
        try{
        	pstmt = conn.prepareStatement(SQL);
        	
        	pstmt.setString(1,info);
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()) {
        		String[] result = {"","","","","","","","","","","",""};
        		
        		System.out.println(result[0] = rs.getString(1)); //bookID);
        		System.out.println(result[1] = rs.getString(2)); //title);
        		System.out.println(result[2] = rs.getString(3)); //isbn
        		System.out.println(result[3] = rs.getString(4)); //category);
        		System.out.println(result[4] = rs.getString(5)); //author);
        		System.out.println(result[5] = rs.getString(6)); //publisher);
        		System.out.println(result[7] = rs.getString(8)); //edition);
        		System.out.println(result[8] = rs.getString(9)); //quantity);
        		System.out.println(result[9] = rs.getString(10)); //price);
        		System.out.println(result[10] = rs.getString(11)); //price);
        		System.out.println(result[11] = rs.getString(12)); //price);


        		return result;
				
        	}
		}catch(Exception e){
	        e.printStackTrace();
	    }
        return null;
    }//findInfo

    
    public int addBook(Books books){
    	int bookID = getRandomNumberInRange(100,9999);
    	int imageNum =getRandomNumberInRange(1,24);
    	String imagePath = "img/"+imageNum+".jpg";
    	System.out.println(imagePath);
    	String SQL ="INSERT INTO books VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
        try{
            pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1,bookID);
            pstmt.setString(2,books.getIsbn());
            pstmt.setString(3,books.getCategory());
            pstmt.setString(4,books.getAuthor());
            pstmt.setString(5,books.getTitle());
            pstmt.setString(6, imagePath);
            pstmt.setString(7,books.getPublisher());
            pstmt.setString(8,books.getYearPublished());
            pstmt.setInt(9,books.getEdition());
            pstmt.setString(10,books.getDescription());
            pstmt.setInt(11,books.getQuantity());
            pstmt.setInt(12, books.getPrice());

            return pstmt.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//db error
    }
    
    public int updateBook(Books books, String bookID) {
    	String SQL = "UPDATE books SET ISBN=?, category=?, author=?, title=?, publisher=?,yearPublished=?, edition=?,quantity=?,sellingPrice=? WHERE bookID=?";
        try {
            pstmt = conn.prepareStatement(SQL);
        	pstmt.setString(1, books.getIsbn());
        	pstmt.setString(2, books.getCategory());
            pstmt.setString(3, books.getAuthor());
            pstmt.setString(4,books.getTitle());
            pstmt.setString(5,books.getPublisher());
            pstmt.setString(6,books.getYearPublished());
            pstmt.setInt(7, books.getEdition());
            pstmt.setInt(8, books.getQuantity());
            pstmt.setInt(9, books.getPrice());
            pstmt.setString(10, bookID);
            
            return pstmt.executeUpdate();
          
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return -1; //db error
    }
    
    public int deleteBook(String bookID) {
    	String SQL = "DELETE FROM books WHERE bookID =?";
    	try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bookID);
            return pstmt.executeUpdate();
    	}catch (Exception e){
            e.printStackTrace();
        }
    	return -1;//db error
    }
    
    public ArrayList<Books> getBookList(String bookID){
		goodsList = new ArrayList<>();
		String SQL ="SELECT * from books WHERE bookID = ?";
		try{
        	pstmt = conn.prepareStatement(SQL);
        	
        	pstmt.setString(1,bookID);
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()) {
        		goodsList.add(
        				new Books(
        				rs.getString(1), //bookID);
                		rs.getString(2), //title);
                		rs.getString(3),
                		rs.getString(4),
                		rs.getString(5),
                		rs.getString(7),
                		rs.getString(8),
                		rs.getInt(9),
                		rs.getString(10),
                		rs.getInt(11),
                		rs.getInt(12)//price
        						)
        				);
				
        	}
		}catch(Exception e){
	        e.printStackTrace();
	    }
		return goodsList;

    }

    public ArrayList<Books> getBookList(){
		goodsList = new ArrayList<>();
		String SQL ="SELECT * from books";
		try{
        	pstmt = conn.prepareStatement(SQL);        	
        	rs = pstmt.executeQuery();
        	
        	while(rs.next()) {
        		goodsList.add(
        				new Books(
        				rs.getString(1), //bookID);
                		rs.getString(2), //title);
                		rs.getString(3),
                		rs.getString(4),
                		rs.getString(5),
                		rs.getString(7),
                		rs.getString(8),
                		rs.getInt(9),
                		rs.getString(10),
                		rs.getInt(11),
                		rs.getInt(12)//price
        						)
        				);
				
        	}
		}catch(Exception e){
	        e.printStackTrace();
	    }
		return goodsList;

    }
	private int getRandomNumberInRange(int min, int max) {

		if (min >= max) {
			throw new IllegalArgumentException("max must be greater than min");
		}

		Random r = new Random();
		return r.nextInt((max - min) + 1) + min;
	}//getRandomNumberInRange
	
}

/*
public String findInfo(String bookID, String info) {
	String SQL ="select * from books WHERE bookID =?";
	try{
        pstmt = conn.prepareStatement(SQL);
        pstmt.setString(1, bookID);
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
*/
