<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Information</title>
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
		String[] result = (String[])request.getAttribute("show");	
		
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
                        <a class = "dropdown-toggle"
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
                       aria-expanded="false">Hello Customer <span class="caret"></span>></a>
                    	  <ul class ="dropdown-menu">
                    <%
                    	if(role == 2){	
                    %>
                    	<li><a href="admin.jsp">Administration Page</a> </li>
                    <% 		
                    	}
                    %>
                  
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

    <div class = "container" style ="margin-top: 50px">

        <!-- Page Content -->
        <div class="container">

            <div class="row">

                <div class="col-lg-3">

                    <h3 class="my-4">BOOKSTORE</h3>
                    <div class="list-group">
                        <a href="#" class="list-group-item bg-1 list">New Books</a>
                        <a href="#" class="list-group-item bg-1 list">Bestsellers</a>
                        <a href="#" class="list-group-item bg-1 list">Sale</a>
                        <a href="#" class="list-group-item bg-1 list">Membership</a>
                        <a href='#' class="list-group-item bg-1 list">Help</a>
                    </div>

                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">
              
					 <div class="row">
	
	                        <div class="col-lg-3 col-md-3 mb-3">
	                            <div class="card h-100">
	                                <a href="#"><img class="card-img-top" src="img/9780062957726_p0_v2_s118x184.jpg" alt=""></a>
	                                <div class="card-body">
	                                    <h4 class="card-title">
	                                        <a href="#">Book</a>
	                                    </h4>
	                                    <h7>$2999.99</h7>
	                                    <p class="card-text"></p>
	                                </div>
	                                <div class="card-footer">
	                                    <!--small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small!-->
	                                </div>
	                            </div>
	                        </div>
	


                    </div>
                    <!-- /.row -->
				
                 </div>

                   
                </div>
                <!-- /.col-lg-9 -->

            </div>
            <!-- /.row -->

        </div>
        <!-- /.container -->
	<br>
	<br>


   

    <!-- /.container -->


</body>
</html>