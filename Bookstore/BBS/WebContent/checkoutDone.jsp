<%--
  Created by IntelliJ IDEA.
  User: garyb
  Date: 7/24/2019
  Time: 12:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>
<html>
<head>
    <title>Checkout Complete</title>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <!-- WEB FONTS -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,300,100italic,400,300italic" rel="stylesheet" type="css/">
</head>
<body>

    <%
        String userID = null;
        
    	userDAO userDAO = new userDAO();
    	int role = 0;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
            String getRole = userDAO.findInfo(userID, "roles");
			role = Integer.parseInt(getRole);	
        }
		
    %>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href='index.jsp'>Group2 Bookstore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <%
                if(userID ==null){

            %>
            <ul class = "nav navbar-nav navbar-right">
                <li class = "dropdown">
                    <li class = "dropdown">
                        <a href = "#" class = "dropdown-toggle"
                           data-toggle="dropdown" role = "button" aria-haspopup="true"
                           aria-expanded="false">Sign In<span class="caret"></span></a>
                        <ul class ="dropdown-menu">
                            <li><a href="login.jsp">Login</a></li>
                            <li><a href="signup.jsp">Register</a></li>
                            <li><a href="cart.jsp">Shopping Cart</a></li>
                            
                        </ul>
                    </li>
                </li>
            </ul>
            <%
                } else{
            %>
            <ul class = "nav navbar-nav navbar-right">
                <li class = "dropdown">
                <li class = "dropdown">
                    
                    <a href = "#" class = "dropdown-toggle"
                       data-toggle="dropdown" role = "button" aria-haspopup="true"
                       aria-expanded="false">Hello Customer <span class="caret"></span>></a>
                    	  <ul class ="dropdown-menu">
                    <%
                    	if(role == 2){	
                    %>
                    	<li><a href="admin.jsp">Administration Page</a> </li>
                    	<li><a href="editProfile.jsp">Edit Profile</a> </li>
                        <li><a href="logoutAction.jsp">LogOut</a></li>
                    <% 		
                    	}else{
                    %>
                        <li><a href="cart.jsp">Shopping Cart</a></li>
                        <li><a href="editProfile.jsp">Edit Profile</a> </li>
                        <li><a href="logoutAction.jsp">LogOut</a></li>
                    <%
                			}
            		%>    
                        
                    </ul>
                </li>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>


<div class = "container"style ="margin-top: 150px; align-items: center; text-align: center;">

    <h2>Checkout</h2>
    <h4>Hey! <%out.println(userID); %></h4>
    <h4>Thank you purchase.</h4>
    <h4>You will receive an email confirming your purchase</h4>
    <h4>Please, Check your email.</h4>
</div>

</body>
</html>
