<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-10
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Login</title>
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
            <h3>Login</h3>
            <br>
                <form method ="post" action = "loginAction.jsp">
                    <div class ="form-group">
                        <input type="text" class = "form-control"
                               placeholder = "Enter username" name ="userID">
                    </div>
                    <div class ="form-group">
                        <input type="password" class = "form-control"
                               placeholder = "Password" name = "userPassword">
                    </div>
                    <div class = "checkbox">
                        <label>
                            <input type = "checkbox">
                            Remember Me
                        </label>
                    </div>
                    <input type ="submit" class ="btn btn-primary form-control" value ="Login">
                </form>

                <!--button type="submit" onclick ="window.location.href ='index.html'" class="btn btn-primary form-control" style ="background-color: #E67A33">
                    Login
                </button!-->
                <h7>Do you forget your password?</h7><a href='forget.jsp'> Click Here</a>
                <br>
                <h7>Do you want to verify your account?</h7><a href='verify.jsp'> Click Here</a>
                
                <br>
                <h7>Do you want to sign up?</h7><a href='signup.jsp'> sign up</a>

        </div>
    </div>


</div>

<!-- /.container -->


<!-- Footer -->
<footer class="py-5 bg-1">
    <div class="container" >
        <p class="m-0 text-center text-white">Copyright &copy; CSCI 4050 Group 2 2019</p>
    </div>
</footer>

<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>