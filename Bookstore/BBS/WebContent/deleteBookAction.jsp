<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="book.bookDAO" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
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
	<title>Insert title here</title>
</head>
<body>

	<%
       
			String bookID = book.getBookID();
           // String bookID = (String)session.getAttribute("bookID");
            System.out.println("Book ID: "+ bookID);
        
            bookDAO bookDAO = new bookDAO();
            int result = bookDAO.deleteBook(bookID);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Fill the all the information to update Book')");
                script.println("history.back()"); //go back to login page
                script.println("</script>");
            }else{
                //session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Book is deleted')");
                script.println("location.href = 'admin.jsp'"); //go back to login page
                script.println("</script>");
            }
        


    %>
	

</body>
</html>