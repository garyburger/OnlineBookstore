<!DOCTYPE html>

<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"%>
<%@ page import ="user.userDAO" %>
<%@ page import = "Email.EmailSender" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope = "page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>
<jsp:setProperty name="user" property="userEmail"></jsp:setProperty>
<jsp:setProperty name="user" property="userFirstName"></jsp:setProperty>
<jsp:setProperty name="user" property="userLastName"></jsp:setProperty>
<jsp:setProperty name="user" property="userAddr"></jsp:setProperty>
<jsp:setProperty name="user" property="ccName"></jsp:setProperty>
<jsp:setProperty name="user" property="ccNum"></jsp:setProperty>
<jsp:setProperty name="user" property="ccExp"></jsp:setProperty>
<jsp:setProperty name="user" property="ccCvv"></jsp:setProperty>


<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
<title>Editing</title>
</head>
<body>
	<%
        String userID = (String)session.getAttribute("userID");
		
		String userEmail =(String) session.getAttribute("userEmail");
		System.out.println("User :"+ userID);
        //System.out.println("User Emial:"+ userEmail);

        
        if(user.getUserFirstName()==null||user.getUserPassword()==null){
        	PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You should submit all the information to process registration.')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        } else{
            userDAO userDAO = new userDAO();
            int result = userDAO.updateUser(user, userID);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('DB Error')");
                script.println("history.back()"); //go back to login page
                script.println("</script>");
            }else{
                //session.setAttribute("userID", user.getUserID());
                PrintWriter script = response.getWriter();
                String email = userDAO.findInfo(userID, "userEmail");
                System.out.println("User Email: "+email);
 	            
                EmailSender emailSender = new EmailSender();
     	        emailSender.sendEmail(email,"","");
     	        
                script.println("<script>");
                script.println("alert('Information has been changed')");
                script.println("location.href = 'index.jsp'"); //go back to login page
                script.println("</script>");
            }
        }


    %>

</body>
</html>