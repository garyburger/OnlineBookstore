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

</head>
<body>
	<%
	
        String userID = null;
		bookDAO bookDAO = new bookDAO();
		ShoppingCartDAO shoppingList = new ShoppingCartDAO();
		userDAO userDAO = new userDAO();
    	
    	int role = 0;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
            String getRole = userDAO.findInfo(userID, "roles");
			role = Integer.parseInt(getRole);	
        }
		request.setCharacterEncoding("UTF-8");
		//int cartID = 0;
		
		String bookID = (String)session.getAttribute("bookID");
		session.setAttribute("bookID", bookID);
        String bookTitle = (String)session.getAttribute("title");
        String bookPrice = (String)session.getAttribute("price");
        String bookAuthor = (String)session.getAttribute("author");
        //int result = shoppingList.addItem(userID,bookID,bookPrice,0,1);
		//shoppingList.getBookList(bookID);	

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
	

	<!-- Container -->
	<div class="container" style ="margin-top: 50px">
		<h1>SHOPPING CART</h1>

		<!-- Mainbar-Starts-Here -->
			<div class="main-bar">
				<div class="product">
					<h3>Book Title</h3>
				</div>
				<div class="quantity">
					<h3>Quantity</h3>
				</div>
				<div class="price">
					<h3>Price</h3>
				</div>
				<div class="clear"></div>
			</div>
			<!-- //Mainbar-Ends-Here -->
		
	    <div class="col-lg-12 order-lg-2 mb-4">
	      <h4 class="d-flex justify-content-between align-items-center mb-3">
			
	      </h4>
	      <%
			shoppingList.getShoppingList(userDAO.findInfo(userID, "userID"));
	      	System.out.println("AL size: "+ shoppingList.cartList.size());
			int totalPrice = 0;
			try{
				if(shoppingList.cartList.size() > 0) {

					for(int i = 0 ; i < shoppingList.cartList.size(); i++){
						ShoppingCart eachCart = shoppingList.cartList.get(i);
						Books shoppingBook = shoppingList.getBookList(eachCart.getBookID()).get(0);
						//Books shoppingBook = shoppingList.goodsList.get(i);
						totalPrice += shoppingBook.getPrice();
			%>
	      <ul class="list-group mb-3">
	        <li class="list-group-item d-flex justify-content-between lh-condensed">
	          <div>
	            <h7 class="my-0"><% out.println(shoppingBook.getTitle()); %></h7>
	            <small class="text-muted">By <% out.println(shoppingBook.getAuthor()); %></small>
	          </div>
	            <form action="action_page.php">
					<input type="number" name="quantity" min="1" max="10" value="1">
	            </form>
	          <span class="text-muted">$ <% out.println(shoppingBook.getPrice()); %> </span>
	          <!--  button type="submit" class="btn btn-secondary" onclick=<% //shoppingList.deleteItem(eachCart.getCartID()); %>>Empty Cart</button-->
	          
	        </li>
		<% 
					}
				}else{
					out.println("Cart is Empty");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		%>
	
	        <li class="list-group-item d-flex justify-content-between bg-light">
	          <div class="text-success">
	            <h6 class="my-0">Promo code</h6>
	            <small>EXAMPLECODE</small>
	          </div>
	          <span class="text-success"></span>
	        </li>
	        <li class="list-group-item d-flex justify-content-between">
	          <span>Total (USD)</span>
	          <strong>$ <%out.println(totalPrice); %> </strong>
	        </li>
	      </ul>
	
	      <form class="card p-5" action ="checkout.jsp">
	        <div class="input-group">
	          <input type="text" class="form-control" placeholder="Promo code">
	          <div class="input-group-append">
	            <button type="submit" class="btn btn-secondary">Redeem</button>
	          </div>
	        </div>
	          <br>
			  <input type ="submit" class ="btn btn-primary form-control" value ="Checkout">
	          
	      </form>
	    </div>
	</div>

</body>
</html>