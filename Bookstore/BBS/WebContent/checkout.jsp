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
<title>Checkout</title>
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
			shoppingList.getShoppingList(userDAO.findInfo(userID, "userID"));
        }
		request.setCharacterEncoding("UTF-8");
		int cartID = 0;
		
		String bookID = (String)session.getAttribute("bookID");
        String bookTitle = (String)session.getAttribute("title");
        String bookPrice = (String)session.getAttribute("price");
        String bookAuthor = (String)session.getAttribute("author");
        
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
  		<div class="row">
			<!-- Side Item Info -->
		    <div class="col-md-4 order-md-2 mb-4">
		      <h4 class="d-flex justify-content-between align-items-center mb-3">
		        <span class="text-muted">Your cart</span>
		      </h4>
		      <%
				int totalPrice = 0;
		      	try{
					if(shoppingList.cartList.size() > 0) {

						for(int i = 0 ; i < shoppingList.cartList.size(); i++){
							ShoppingCart eachCart = shoppingList.cartList.get(i);
							Books shoppingBook = shoppingList.getBookList(eachCart.getBookID()).get(0);
							//Books shoppingBook = shoppingList.goodsList.get(i);
							totalPrice += shoppingBook.getPrice();
							bookID = shoppingBook.getBookID();

				%>
		      <ul class="list-group mb-3">
		        <li class="list-group-item d-flex justify-content-between lh-condensed">
		          <div>
		            <h6 class="my-0"><% out.println(shoppingBook.getTitle()); %></h6>
		            <small class="text-muted">By <% out.println(shoppingBook.getAuthor()); %></small>
		          </div>
		          <span class="text-muted">$ <%out.println(shoppingBook.getPrice()); %></span>
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
		          <span class="text-success">-$ </span>
		        </li>
		        <li class="list-group-item d-flex justify-content-between">
		          <span>Total (USD)</span>
		          <strong>$ <%out.println(totalPrice); %> </strong>
		        </li>
		      </ul>
			
		      <form class="card p-2">
		        <div class="input-group">
		          <input type="text" class="form-control" placeholder="Promo code">
		          <div class="input-group-append">
		            <button type="submit" class="btn btn-secondary">Redeem</button>
		          </div>
		        </div>
		      </form>
		    </div>	
		    
          <form class = "col-md-8 order-md-1" method ="post" action = "checkoutAction.jsp">
			   <h4 class="mb-3">Payment Information</h4>
				
               <div class="mb-3">
                      <label for="address">Address</label>
                      <input type="text" class="form-control" name="userAddr" placeholder="1234 Main St" required>
                      <div class="invalid-feedback">
                          Please enter your shipping address.
                      </div>
                  </div>

                  <div class="row">
                      <div class="col-md-5 mb-3">
                          <label for="country">Country</label>
                          <select class="custom-select d-block w-100" name="country" required>
                              <option value="">Choose...</option>
                              <option>United States</option>
                          </select>
                          <div class="invalid-feedback">
                              Please select a valid country.
                          </div>
                      </div>
                      <div class="col-md-4 mb-3">
                          <label for="state">State</label>
                          <select class="custom-select d-block w-100" name="state" required>
                              <option value="">Choose...</option>
                              <option>Georgia</option>
                              <option>Others</option>
                          </select>
                          <div class="invalid-feedback">
                              Please provide a valid state.
                          </div>
                      </div>
                      <div class="col-md-3 mb-3">
                          <label for="zip">Zip</label>
                          <input type="text" class="form-control" name="zip" placeholder="30609" required>
                          <div class="invalid-feedback">
                              Zip code required.
                          </div>
                      </div>
                  </div>
                  <div class="custom-control custom-checkbox">
                      <input type="checkbox" class="custom-control-input" name="same-address">
                      <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                  </div>
              	<hr class ="mb-4">
              	<h4 class="mb-3">Payment Information</h4>
              	<div class="row">
                      <div class="col-md-6 mb-3">
                          <label for="cc-name">Name on card</label>
                          <input type="text" class="form-control" name="ccName" placeholder="" required>
                          <small class="text-muted">Full name as displayed on card</small>
                          <div class="invalid-feedback">
                              Name on card is required
                          </div>
                      </div>
                      <div class="col-md-6 mb-3">
                          <label for="cc-number">Credit card number</label>
                          <input type="text" class="form-control" name="ccNum" placeholder="" required>
                          <div class="invalid-feedback">
                              Credit card number is required
                          </div>
                      </div>
                  </div>
                  <div class="row">
                      <div class="col-md-3 mb-3">
                          <label for="cc-expiration">Expiration</label>
                          <input type="text" class="form-control" name="ccExp" placeholder="" required>
                          <div class="invalid-feedback">
                              Expiration date required
                          </div>
                      </div>
                      <div class="col-md-3 mb-3">
                          <label for="cc-cvv">CVV</label>
                          <input type="text" class="form-control" name="ccCvv" placeholder="" required>
                          <div class="invalid-feedback">
                              Security code required
                          </div>
                      </div>
                  </div>
                  <hr class="mb-4">
                  <%
					session.setAttribute("ccNum",userDAO.findInfo(userID, "ccNum")); 
					session.setAttribute("totalPrice",totalPrice); 
                    session.setAttribute("bookID", bookID);
                  %>
                <input type ="submit" class ="btn btn-primary form-control" value ="Order Items">
          </form>
		
               		    
  		</div>
  		

	    </div>
	

</body>
</html>