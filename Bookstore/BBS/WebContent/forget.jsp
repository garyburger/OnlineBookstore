<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-12
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope = "page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userFirstName"></jsp:setProperty>
<jsp:setProperty name="user" property="userLastName"></jsp:setProperty>

<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>

<html>
<head>
    <title>Confirmation</title>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-homepage.css" rel="stylesheet">
    <!-- WEB FONTS -->
    <link href="http://fonts.googleapis.com/css?family=Roboto:100,300,100italic,400,300italic" rel="stylesheet" type="css/">

</head>
<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href='index.jsp'>Group2 Bookstore</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

    </div>
</nav>

<div class = "container"style ="margin-top: 150px; align-items: center; text-align: center;">
    <div class ="col-lg-10"></div>
    <div class ="col-lg-10">
        <div class="jumbotron" style ="align-items: center;">
            <h3>Find your password</h3>
            <br>
                <form method ="post" action = "forgetAction.jsp">
                    <div class ="form-group">
                        <input type="text" class = "form-control"
                               placeholder = "Enter username" name ="userID">
                    </div>
                    <div class ="row">
                    	<div class="col-md-6 mb-3">
                         <label for="firstName">First name</label>
                         <input type="text" class="form-control" name="userFirstName" placeholder="" value="" required>
                         <div class="invalid-feedback">
                             Valid first name is required.
                         </div>
	                     </div>
	                     <div class="col-md-6 mb-3">
	                         <label for="lastName">Last name</label>
	                         <input type="text" class="form-control" name="userLastName" placeholder="" value="" required>
	                         <div class="invalid-feedback">
	                             Valid last name is required.
	                         </div>
	                     </div>
                    </div>
                    <div class ="form-group">
                        <input type="email" class = "form-control"
                               placeholder = "Enter your e-mail" name = "userEmail">
                    </div>
                    
                    <input type ="submit" class ="btn btn-primary form-control" value ="Find">
                </form>

        </div>
    </div>

</body>
</html>
