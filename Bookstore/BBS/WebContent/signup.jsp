<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-12
  Time: 13:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<html>
<head>
    <title>Sign Up</title>

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
            <h3>Sign Up</h3>
            <br>
                <form method ="post" action = "signupAction.jsp">
                    <div class ="form-group">
                        <input type="text" class = "form-control"
                               placeholder = "Enter username" name ="userID">
                    </div>
                    <div class ="form-group">
                        <input type="password" class = "form-control"
                               placeholder = "Password" name = "userPassword">
                    </div>
                    <hr class="mb-6">
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
                    	<label for="userEmail">Email <span class="text-muted">(Required)</span></label>
                       <input type="email" class="form-control" name="userEmail" placeholder="you@example.com">
                    </div>
                    <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="promo">
                            <label class="custom-control-label" for="promo">Register Promotion</label>
                        </div>
                    <hr class="mb-6">
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
                      <input type ="submit" class ="btn btn-primary form-control" value ="Sign Up">
                </form>
				
               
                <h7>Do you want to log in?</h7><a href='login.jsp'> Login</a>

        </div>
    </div>


</div>
  
    <!-- /.container -->


<!-- Bootstrap core JavaScript -->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>
