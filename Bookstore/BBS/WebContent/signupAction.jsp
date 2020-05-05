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
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<jsp:setProperty name="user" property="userAddr"></jsp:setProperty>

<jsp:setProperty name="user" property="userFirstName"></jsp:setProperty>
<jsp:setProperty name="user" property="userLastName"></jsp:setProperty>


<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Login Processing</title>
</head>
<body>
    <%
    	//String userID =null;
//        String userID = (String)session.getAttribute("userID");
		String userID = (String)request.getParameter("userID");
		System.out.print("userID : "+ userID);
        /*
        if(request.getParameter("userID")!=null){
            userID = (String) session.getAttribute("userID");
            PrintWriter script = response.getWriter();
        	System.out.println("user ID: "+ userID);
        }*/
        /*
        if(userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Already Logged in')");
            script.println("location.href = 'index.jsp"); //go back to login page
            script.println("</script>");
        }
        */
        if(user.getUserID()==null||user.getUserPassword()==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You should submit all the information to process registration.')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        } else{
            userDAO userDAO = new userDAO();
            int result = userDAO.signUp(user);
            userDAO.creditAdd(user);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Existing ID')");
                script.println("history.back()"); //go back to login page
                script.println("</script>");
            }else{
            	
            	String userEmail = userDAO.findInfo(userID,"userEmail");
            	String veriCode = userDAO.findInfo(userID,"verifyCode");
    			System.out.println("User Email :" + userEmail);            
    			System.out.println("Verfiy Code :" + veriCode);            
				
                //session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                if(userEmail != null){
	                EmailSender emailSender = new EmailSender();
	                emailSender.sendEmail(userEmail,"Registration","You've successfully signed up for our"
	                		+"bookstore.\n Noew it's titme to activate your account so you can start reaching customer online.\n"
	                		+"You can copy the verification code :" + veriCode 
	                		+".\n here is the link to verify your code : \n http://localhost:8088/BBS/verify.jsp"
	                		+"\n\n See you online.\n Bookstore team.");
	                script.println("<script>");
	                script.println("location.href = 'confirm.jsp'"); //go back to login page
	                script.println("</script>");
                }else{
	                script.println("<script>");
	                script.println("alert('Failed to get email addr')");
	                script.println("history.back()"); //go back to login page
	                script.println("</script>");

                }
                
            }
        }


    %>


</body>
</html>
