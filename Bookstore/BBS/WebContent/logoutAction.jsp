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
    <title>Login Processing</title>
</head>
<body>
    <%
        session.invalidate();
    %>
       <script>
          location.href = 'main.jsp';
      </script>

</body>
</html>
