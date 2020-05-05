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
<title>Insert title here</title>
	<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
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
        if(request.getParameter("userID")!=null){
            userID = (String) request.getParameter("userID");
            
            String getRole = userDAO.findInfo(userID, "roles");
			role = Integer.parseInt(getRole);	
        }
        bookDAO bookDAO = new bookDAO();
        String[] featureBooks = bookDAO.findInfo("", 1);
		System.out.println(featureBooks);
		
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
    
   <!-- Container -->
	<div class = "container"style ="margin-top: 150px; align-items: center; text-align: center;">
	    <div class ="col-lg-10"></div>
	    <div class ="col-lg-10">
	        <div class="jumbotron" style ="align-items: center;">
	            <h3>Verify Your Email</h3>
	            <br>
	                <form method ="post" action = "verifyAction.jsp">
		                <div class ="form-group">
		                    	<label for="title">Enter Verification Code You Received</label>
		                       <input type="text" class="form-control" name="verifyCode">
		                </div>
	                	   
	                    <hr class="mb-4">
	               		<input type ="submit" class ="btn btn-primary form-control" value ="Verify">
	                </form>
	        </div>
	    </div>
	</div>

</body>
</html>