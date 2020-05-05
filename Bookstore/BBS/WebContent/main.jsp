<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-12
  Time: 14:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="book.Books" %>

<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>

<html>
<head>
    <title>Team 2 Book Store</title>
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
        bookDAO bookDAO = new bookDAO();

        //String[] featureBooks = bookDAO.findInfo("", 1);
		//System.out.println(featureBooks);
		
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
                       aria-expanded="false">Hello Customer <span class="caret"></span></a>
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
                        <li><a href="orderHistory.jsp">Order History</a> </li>
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
                        <a href="editProfile.jsp" class="list-group-item bg-1 list">Membership</a>
                        <a href='orderHistory.jsp' class="list-group-item bg-1 list">Order History</a>
                    </div>

                </div>
                <!-- /.col-lg-3 -->

                <div class="col-lg-9">


                        <form action = "searchAction.jsp" style ="margin-top: 50px">
                        
                           	
                            <div class="form-row">
	                            <select name ="divide" class="form-control col-3 col-md-3" >
	                           		<option value ="5">Title</option>
	                           		<option value ="4">Author</option>	
									<option value ="3">Category</option>
	
	                           	</select>
                                <div class="col-6 col-md-6 mb-2 mb-md-0">
                                    <input type="text" name="search" class="form-control form-control-lg" >
                                </div>
                                
                                <div class="col-2 col-md-3">
                                    <button type="submit" class="btn btn-block btn-lg bg-1 list">Search</button>
                                </div>
                            </div>
                           
                        </form>
						
						<h4>Featured Book</h4>
						 <div class="row">
					<% bookDAO.getBookList();
			      		System.out.println("Size size: "+ bookDAO.goodsList.size());
			      		try{
							if(bookDAO.goodsList.size() > 0) {

								for(int i = 0 ; i < bookDAO.goodsList.size(); i++){
									Books bookList = bookDAO.goodsList.get(i);
							        String result = bookDAO.findInfo(bookList.getBookID(),"ImagePath");

					%>
                        <div class="col-sm-3 col-sm-3 mb-3">
                            <div class="card h-30">
                                <a href="#"><img class="card-img-top" src="<%out.println(result); %>" alt=""></a>
                                <div class="card-body">
                                    <h4 class="card-title">
                                        <a href="#"><% out.println(bookList.getTitle()); %></a>
                                    </h4>
                                    <h7>$ <% out.println(bookList.getPrice()); %></h7>
                                    
                                    <p class="card-text">
                                    	<h7>Description: <% out.println(bookList.getDescription()); %></h7></p>
                                </div>
                                <div class="card-footer">
                                    <small class="text-muted">Published by <% out.println(bookList.getPublisher()); %></small>
                                </div>
                            </div>
                        </div>
					<% 
								}
							}else{
								out.println("Need to update Books");
						}
					}catch(Exception e){
						e.printStackTrace();
					}
				%>


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