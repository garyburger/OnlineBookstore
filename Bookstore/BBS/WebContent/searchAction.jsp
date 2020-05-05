<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.io.PrintWriter" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="book.bookDAO" %>
<%@ page import ="Cart.ShoppingCartDAO" %>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="java.net.URLEncoder" %>
<!DOCTYPE html SYSTEM "about:legacy-compat">

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


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset = UTF-8>
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
	<!-- Data setting  -->
	<%
			String userID = null;
        
	    	userDAO userDAO = new userDAO();
	    	int role = 0;
	        if(session.getAttribute("userID")!=null){
	            userID = (String) session.getAttribute("userID");
	            String getRole = userDAO.findInfo(userID, "roles");
				role = Integer.parseInt(getRole);	
	        }
    		request.setCharacterEncoding("UTF-8");
			String search=request.getParameter("search"); 
			String divide = request.getParameter("divide");
            bookDAO bookDAO = new bookDAO();
            String[] result = bookDAO.findInfo(search,Integer.parseInt(divide));
            if(result == null){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Fail to Search, Try Again')");
                script.println("history.back()"); //go back to login page
                script.println("</script>");
            }
		
			session.setAttribute("show", result);		
            PrintWriter script = response.getWriter();
            
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
	<div class = "container" style ="margin-top: 100px" >
        <div class="col-lg-10 col-md-10 mb-10">
              <div class="card h-100">
                  <img class="card-img-top" src="<% out.println(result[5]);%>" alt="">
                  <div class="card-body" >
                      <h1>
                         <% out.println(result[4]); %>
                      </h1>
                      <h7>Price : $<% out.println(result[11]); %></h7>
                      <br>
                      <!--  p class="card-text" style ="text-algin : left;"</p-->
                      <h7>
                      	 Category :  <% out.println(result[2]); %>
                      </h7>
                         <br>
                       <h7>   
                         Author : <% out.println(result[3]);%>
                       </h7>
                         <br>
                       
                  </div>
                  <div class="footer">
                  		Quantity: <% out.println(result[9]); %>
                      <!--  small class="text-muted"></small-->
                      <div class="col-2 col-md-3">
                       </div>
                  </div>
                <form method ="post" action = "cartAction.jsp">
                <%
                System.out.println("bookID: " + result[0]);
                
                session.setAttribute("bookID",result[0]);
                session.setAttribute("isbn",result[1]);
                session.setAttribute("category",result[2]);
                session.setAttribute("author",result[3]);
                session.setAttribute("title",result[4]);
                session.setAttribute("imagePath",result[5]);
                session.setAttribute("publisher",result[6]);
                session.setAttribute("yearPublished",result[7]);
                session.setAttribute("edition",result[8]);
                session.setAttribute("description",result[9]);

                session.setAttribute("quantity",result[10]);
                session.setAttribute("price",result[11]);
                %>
                  <input type ="submit" class ="btn btn-primary form-control" value ="Add To Cart">
                </form>
              </div>
          </div>
	</div>		

	
    <!-- Footer -->
    <footer class="py-5 bg-1" style ="margin-top: 100px">
        <div class="container" >
            <p class="m-0 text-center text-white">Copyright &copy; CSCI 4050 Group 2 2019</p>
        </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
		
</body>
</html>