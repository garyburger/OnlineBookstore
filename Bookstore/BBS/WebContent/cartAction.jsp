<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="java.util.ArrayList" %>

<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="book.Books" %>

<%@ page import ="Cart.ShoppingCart" %>
<%@ page import ="Cart.ShoppingCartDAO" %>

<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <!-- WEB FONTS -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,300,100italic,400,300italic" rel="stylesheet" type="css/">
<!-- % request.setCharacterEncoding("UTF-8");%-->
<jsp:useBean id="book" class="book.Books" scope = "page"></jsp:useBean>
<jsp:setProperty name="book" property="bookID"></jsp:setProperty>
<jsp:setProperty name="book" property="isbn"></jsp:setProperty>
<jsp:setProperty name="book" property="category"></jsp:setProperty>
<jsp:setProperty name="book" property="author"></jsp:setProperty>
<jsp:setProperty name="book" property="title"></jsp:setProperty>
<jsp:setProperty name="book" property="publisher"></jsp:setProperty>
<jsp:setProperty name="book" property="yearPublished"></jsp:setProperty>
<jsp:setProperty name="book" property="edition"></jsp:setProperty>
<jsp:setProperty name="book" property="quantity"></jsp:setProperty>
<jsp:setProperty name="book" property="price"></jsp:setProperty>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Checkout Processing</title>
</head>
<body>
<%
	userDAO userDAO = new userDAO();
    String userID = (String) session.getAttribute("userID");
    System.out.println("userName : "+userID);
    String userEmail =(String) session.getAttribute("userEmail");
    //PrintWriter script = response.getWriter();
	
	ShoppingCartDAO shoppingList = new ShoppingCartDAO();
	String bookID = (String)session.getAttribute("bookID");
    String bookTitle = (String)session.getAttribute("title");
    String bookPrice = (String)session.getAttribute("price");
    String bookAuthor = (String)session.getAttribute("author");
    String userDB = userDAO.findInfo(userID, "userID");
    System.out.println("userID: "+ userDB);
    int result = shoppingList.addItem(userDB,bookID,bookPrice,2);
    if(result == -1){
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('Please, Login')");
        script.println("history.back()"); //go back to login page
        script.println("</script>");
    }else{
        //session.setAttribute("userID", user.getUserID());
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('Book added to Cart')");
        script.println("location.href = 'cart.jsp'"); //go back to login page
        script.println("</script>");
    }

%>


</body>
</html>
