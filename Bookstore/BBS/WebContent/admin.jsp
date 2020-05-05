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
    <title>Administration Page</title>
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
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
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
                       aria-expanded="false">Hello Customer <span class="caret"></span></a>
                    <ul class ="dropdown-menu">
                        <li><a href="editProfile.jsp">Edit Profile</a> </li>
                        <li><a href="logoutAction.jsp">LogOut</a></li>
                    </ul>
                </li>
                </li>
            </ul>
            <%
                }
            %>
        </div>
    </nav>

  <!-- Page Content -->
<div class = "container"style ="margin-top: 150px; align-items: center; text-align: center;">


    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Administrator Page</h1>
        <div class="list-group">
          <a href='addBook.jsp' class="list-group-item bg-1 list">Add Book</a>
          <a href='deleteBook.jsp' class="list-group-item bg-1 list">Delete Book</a>
          <a href='editBook.jsp' class="list-group-item bg-1 list">Update Book</a>
          <a href='memberManage.jsp' class="list-group-item bg-1 list">Set Membership</a>
          <a href='promoManage.jsp' class="list-group-item bg-1 list">Promotion Control</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-7" style ="margin-top: 50px">

   <form class="card p-5">
        <div class="input-group">
          <input type="text" class="form-control" placeholder="ISBN">
          <input type="text" class="form-control" placeholder="Category">
          <input type="text" class="form-control" placeholder="Author">
            <input type="text" class="form-control" placeholder="Title">
            <input type="text" class="form-control" placeholder="publisher">
            <input type="text" class="form-control" placeholder="Quantity">
             <input type="text" class="form-control" placeholder="Price">
        </div>
       <br>
       <div class="input-group">
          <input type="text" class="form-control" placeholder="Cover Picture">
          <div class="input-group-append">
            <button type="submit" class="btn btn-secondary">ADD</button>
          </div>
        </div>
          <br>
          <div class="row-lg-5">            
 <button class="btn btn-primary btn-sm btn-block" type="submit">Add Book</button>
            
              <button class="btn btn-primary btn-sm btn-block" type="submit">Edit Book</button>
          </div>

      </form>
          <br>

        <div class="row-lg-9">
            <form class="card p-5">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Generate Code">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Send Promo Code</button>
                    </div>
                </div>
            </form>
            <br>
             <form class="card p-4">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Type ID">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Search</button>
                    </div>
                    <br>
                    
                    
                 </div>
                 <div class="d-block my-4" style ="margin-top: 20px">
                        <div class="custom-control custom-radio">
                            <input id="suspend" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                            <label class="custom-control-label" for="credit">Suspend</label>
                        </div>
                        <div class="custom-control custom-radio">
                            <input id="authorize" name="paymentMethod" type="radio" class="custom-control-input" required>
                            <label class="custom-control-label" for="debit">Authorize</label>
                        </div>
                          <button class="btn btn-primary btn-sm btn-block" type="submit">Setting</button>
                 </div>
            </form>

        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->
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