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
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="user" class="user.User" scope = "page"></jsp:useBean>
<jsp:setProperty name="user" property="userID"></jsp:setProperty>
<jsp:setProperty name="user" property="userPassword"></jsp:setProperty>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Login Processing</title>
</head>
<body>
    <%
        String userID = null;
        if(session.getAttribute("userID")!=null){
            userID = (String) session.getAttribute("userID");
        }
        if(userID != null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Already Logged in')");
            script.println("location.href = 'index.jsp'"); //go back to login page
            script.println("</script>");
        }
        userDAO userDAO = new userDAO();
        int result = userDAO.login(user.getUserID(),user.getUserPassword());
        if(result == 2){
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'admin.jsp'"); //go back to login page 
            script.println("</script>");
        }else if(result == 1){
            session.setAttribute("userID", user.getUserID());
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("location.href = 'index.jsp'"); //go back to login page 
            script.println("</script>");
        }else if(result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Wrong Password')");
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
        }else if(result == -3){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You need to verify your email')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        }

    %>


</body>
</html>
