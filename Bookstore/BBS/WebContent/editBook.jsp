<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
	<title>ADD BOOK</title>
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
	<!-- Navigation -->
    <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href='index.jsp'>Group2 Bookstore</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

			<ul class = "nav navbar-nav navbar-right">
				<li class ="dropdown">
					<li class = "dropdown">
	                   	<a href = "#" class = "dropdown-toggle"
                           data-toggle="dropdown" role = "button" aria-haspopup="true"
                           aria-expanded="false">Administration<span class="caret"></span></a>
	                  <ul class ="dropdown-menu">
						<li><a href='deleteBook.jsp'>Delete Book</a></li>
                  	  	<li><a href='#'>Update Book</a></li>
                     	<li><a href='#'>Set Membership</a></li>
                     	<li><a href='#'>Promotion Control</a></li>
	                  </ul>
	             	</li>  
				</li>     
            </ul>
        </div>
    </nav>
    
    
	<div class = "container"style ="margin-top: 150px; align-items: center; text-align: center;">
    <div class ="col-lg-10"></div>
    <div class ="col-lg-10">
        <div class="jumbotron" style ="align-items: center;">
            <h3>Edit Book</h3>
            <br>
                <form method ="post" action = "editBookAction.jsp">
                	<div class ="form-group">
	                       <input type="text" class="form-control" 
	                       placeholder = "Enter Book ID" name="bookID">
                    </div> 
	                <div class ="form-group">
	                    	<label for="title">Book Title</label>
	                       <input type="text" class="form-control" name="title">
	                </div>
   
                  	<hr class="mb-4">                  
	                <div class ="row">
		                <div class ="col-md-6 mb-3">
		                        <input type="text" class = "form-control"
		                               placeholder = "Enter Book ISBN" name ="isbn">
		                    </div>
		                    <div class ="col-md-6 mb-3">
		                        <input type="text" class = "form-control"
		                               placeholder = "Enter Book Category" name = "category">
		                    </div>
	                </div>
                    <div class ="form-group">
                        <input type="text" class = "form-control"
                               placeholder = "Enter Author" name ="author">
                    </div>
                 	<div class ="row">
	                <div class ="col-md-6 mb-3">
	                        <input type="text" class = "form-control"
	                               placeholder = "Enter Book Publisher" name ="publisher">
	                    </div>
	                    <div class ="col-md-6 mb-3">
	                        <input type="text" class = "form-control"
	                               placeholder = "Enter Year Book Pulished" name = "yearPublished">
	                    </div>
                	</div>
                	<hr class="mb-4">
                	<h5>Details</h5>
                	
                	<div class ="row">
	                	<div class ="col-md-6 mb-3">
	                        <input type="text" class = "form-control"
	                               placeholder = "Enter Book Edition" name ="edition">
	                    </div>
	                    <div class ="col-md-6 mb-3">
	                        <input type="text" class = "form-control"
	                               placeholder = "Enter Book Quantity" name ="quantity">
	                    </div>
                	</div>

	                    <div class ="form-group">
	                        <input type="text" class = "form-control"
	                               placeholder = "Enter Book Price" name = "price">
	                    </div>
                	   
                    <hr class="mb-4">
               		<input type ="submit" class ="btn btn-primary form-control" value ="Edit Book">
                </form>
        </div>
    </div>


</div>
  
</body>
</html>