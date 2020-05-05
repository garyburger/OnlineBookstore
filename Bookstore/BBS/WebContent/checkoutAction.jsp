<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-10
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>   
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="java.util.ArrayList" %>     
<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="Email.EmailSender" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import = "java.time.LocalDate"%>
<%@ page import ="java.time.format.DateTimeFormatter"%>
<%@ page import = "java.time.format.FormatStyle" %>
<%@ page import ="Cart.ShoppingCart" %>
<%@ page import ="Cart.ShoppingCartDAO" %>
<%@ page import ="java.util.ArrayList" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope = "page"></jsp:useBean>
<jsp:useBean id="book" class="book.Books" scope = "page"></jsp:useBean>
<jsp:setProperty name="book" property="bookID"></jsp:setProperty>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<jsp:setProperty name="user" property="userFirstName"></jsp:setProperty>
<jsp:setProperty name="user" property="userLastName"></jsp:setProperty>
<jsp:setProperty name="user" property="userAddr"></jsp:setProperty>
<jsp:setProperty name="user" property="ccName"></jsp:setProperty>
<jsp:setProperty name="user" property="ccNum"></jsp:setProperty>
<jsp:setProperty name="user" property="ccExp"></jsp:setProperty>
<jsp:setProperty name="user" property="ccCvv"></jsp:setProperty>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Checkout Processing</title>
</head>
<body>
<%
	String userID = null;
	String userEmail = null;
	String userDB = null;
	String cardID = null;
	String bookTitle = null;
	String bookID = (String)session.getAttribute("bookID");
	bookDAO bookDAO = new bookDAO();
	userDAO userDAO = new userDAO();
	if(session.getAttribute("userID")!=null){
	    userID = (String) session.getAttribute("userID");
	    userEmail = userDAO.findInfo(userID, "userEmail");
	    userDB = userDAO.findInfo(userID, "userID");
	    cardID = userDAO.findCCinfo(userDB, "cardID");
	}
	bookTitle = bookDAO.findInfo(bookID,"title");
    LocalDate localDate = LocalDate.now();
    String formattedDate = localDate.format(DateTimeFormatter.ofLocalizedDate(FormatStyle.MEDIUM));	
	
   	ShoppingCartDAO ShoppingCartDAO = new ShoppingCartDAO();
   	
   	Object imObject = session.getAttribute("totalPrice");
   	Integer totalPrice = (Integer) imObject;
    System.out.println("Total Price is $"+totalPrice);

    //System.out.println("Total Price is $"+session.getAttribute("totalPrice"));
    System.out.println("userEmail : "+userEmail);
    System.out.println("Book ID : "+ bookID);
	System.out.println("Card ID : "+ cardID);
	
    
    
	int order = ShoppingCartDAO.placeOrder(userDB, "9497", formattedDate, cardID, totalPrice);
    if(order == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('DB Erro')");
        script.println("history.back()"); //go back to login page
        script.println("</script>");
    }else{
        //session.setAttribute("userID", user.getUserID());
        ShoppingCartDAO.emptyCart(userDB);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("location.href = 'checkoutDone.jsp'"); //go back to login page
        script.println("</script>");
    }
	    
    
    EmailSender emailSender = new EmailSender();
    emailSender.sendEmail(userEmail,"Purchase Confirmation","Thank you for purchase our book " + 
    		bookTitle +".\n Your order has been made in " + formattedDate +". \n"
    		+"The total price is $"+totalPrice+"."
    		);
    
    
%>


</body>
</html>
