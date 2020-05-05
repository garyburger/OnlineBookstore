<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="java.util.ArrayList" %>

<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="book.Books" %>

<%@ page import ="Cart.Order" %>
<%@ page import ="Cart.ShoppingCartDAO" %>

<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order History</title>
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

</head>
<body>
	<%
	
        String userID = null;
		String userDB = null;
		bookDAO bookDAO = new bookDAO();
		ShoppingCartDAO shoppingList = new ShoppingCartDAO();
		userDAO userDAO = new userDAO();
    	
    	int role = 0;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
            System.out.println("userID : "+userID);
            userDB = userDAO.findInfo(userID, "userID");
            String getRole = userDAO.findInfo(userID, "roles");
			role = Integer.parseInt(getRole);	
        }
		request.setCharacterEncoding("UTF-8");
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
                    
                    <a href = '#' class = "dropdown-toggle"
                       data-toggle="dropdown" role = "button" aria-haspopup="true"
                       aria-expanded="false">Hello Customer <span class="caret"></span></a>
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
	<div class="container" style ="margin-top: 50px">
	
	<!-- Content-Starts-Here -->
	<div class="container" style ="margin-top: 50px">
        
    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">User Page</h1>
        <div class="list-group">
          <a href="editProfile.jsp" class="list-group-item bg-1 list">Information</a>
          <a href="#" class="list-group-item bg-1 list">Order History</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->
    <div class="col-lg-8" style ="margin-top: 50px">
        
    <h1>Order History</h1>
        

    <div class="col-lg-12 order-lg-2 mb-4">
    
          <ul class="list-group mb-3">
                <h5 class="d-flex justify-content-between align-items-center mb-3 bg-light">
                      <h7 class="price">Order ID</h7>
                      <h7 class="price">Date</h7>
                      <h7 class="price">Status</h7>
                       <h7 class="price">Total Price</h7>                      
              </h5>            
              <% 
					try{
						
						if(shoppingList.getOrderList(userDB) != null) {	
					      	System.out.println("AL size: "+ shoppingList.orderList.size());

							for(int i = 0 ; i < shoppingList.orderList.size(); i++){
							Order orderHist = shoppingList.orderList.get(i);
							
              %> 
            <div class = "histlist">
              <li class="list-group-item d-flex justify-content-between lh-condensed"> 
                
                <h7 class="price"> <% out.println(orderHist.getTransactionID()); %></h7>
                <h7 class="price"> <% out.println(orderHist.getOrderDate()); %></h7>
                <h7 class="price">Pending</h7>
                  <strong class="price">$  <% out.println(orderHist.getTotalPrice()); %></strong>
              </li>
                      
                <small class="text-muted">Ordered Details: </small>
                <br>
                <small class="text-muted">payment method: credit card</small>
                <br>
                <small class="text-muted">Shipping Address : <% out.println(userDAO.findInfo(userID, "shippingAddress"));%> ,GA,30609</small>
                <br>
                <small class="text-muted">Billing address: : <% out.println(userDAO.findInfo(userID, "shippingAddress"));%> ,GA,30609</small>

                <hr class="mb-4">
                <% 
							}
						}else{
							out.println("No Previous Order");
					}
				}catch(Exception e){
					e.printStackTrace();
				}
				%>
            </div>            
              
             
          </ul>

        </div>
        <!-- /.row -->
    
     </div>
       
        

	
    </div>
	</div>

</body>
</html>