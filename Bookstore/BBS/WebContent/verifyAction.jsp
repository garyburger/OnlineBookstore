<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: chanjo
  Date: 2019-07-12
  Time: 14:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
    <title>Verify Processing</title>
</head>
<body>
    <%
    	userDAO userDAO = new userDAO();
    	String code = (String)request.getParameter("verifyCode");
		System.out.println("Your Verify Code : "+code);
    	int result = userDAO.verify(code);
    	if(result == 1){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You've succeeded to verify your account!')");
            script.println("location.href = 'index.jsp'"); //go back to login page 
            script.println("</script>");
        }else if(result == 0){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('Wrong Verify Code')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        }
    %>
       <script>
          location.href = 'main.jsp';
      </script>

</body>
</html>