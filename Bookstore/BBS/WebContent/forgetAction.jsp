<%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-10
  Time: 19:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="Email.EmailSender" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope = "page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userFirstName"></jsp:setProperty>
<jsp:setProperty name="user" property="userLastName"></jsp:setProperty>

<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Login Processing</title>
</head>
<body>
    <%
        String userID =(String)request.getParameter("userID");
    	String userFirstName =(String) request.getParameter("userFirstName");
    	String userLastName = (String) request.getParameter("userLastName");

    	String userEmail = (String)request.getParameter("userEmail");
    	//String userEmail = user.getUserEmail();
		
        userDAO userDAO = new userDAO();
        System.out.println(userID +" "+ userFirstName+""+userLastName);
        int result = userDAO.findPasswd(userID, userFirstName, userLastName, userEmail);
        if(result == 1){
        	System.out.println("Success");
        	String passwd = userDAO.findInfo(userID, "password");
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Password has been found')");
            script.println("location.href = 'login.jsp'"); //go back to login page 
            script.println("</script>");
            System.out.println("Your Password is "+passwd);
            EmailSender emailSender = new EmailSender();
            emailSender.sendEmail(userEmail,"Your Password","You've successfully found your palssword."
            		+"\n The password is "+ passwd +".\n"
            		+"You can login right now!"  
            		+".\n here is the link to our bookstore : \n http://localhost:8088/BBS/login.jsp"
            		+"\n\n See you online.\n Bookstore team.");
        }else if(result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Wrong information')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        }else if(result == -1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('No ID can be found')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        }else if(result == -2){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('DB error has been occurred')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        }

    %>


</body>
</html>
