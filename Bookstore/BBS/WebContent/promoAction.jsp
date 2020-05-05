<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import ="java.util.ArrayList" %>
<%@ page import ="user.userDAO" %>
<%@ page import ="Email.EmailSender" %>
<%@ page import ="Promo.PromoDAO" %>
<%@ page import ="Promo.Promotion" %>
<%@ page import ="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8");%>
<jsp:useBean id="promotion" class="Promo.Promotion" scope = "page"></jsp:useBean>
<jsp:setProperty name="promotion" property="code"></jsp:setProperty>
<jsp:setProperty name="promotion" property="percentage"></jsp:setProperty>
<jsp:setProperty name="promotion" property="startDate"></jsp:setProperty>
<jsp:setProperty name="promotion" property="expDate"></jsp:setProperty>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset = UTF-8>
	<title>Promotion Manage</title>
</head>
<body>

	<%
       	userDAO userDAO = new userDAO();
        if(promotion.getCode()==null||promotion.getStartDate()==null){
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('You should submit all the information to process registration.')");
            script.println("history.back()"); //go back to login page
            script.println("</script>");
        } else{
        	PromoDAO PromoDAO = new PromoDAO();
        	int result = PromoDAO.addCode(promotion);
            if(result == -1){
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('DB Error')");
                script.println("history.back()"); //go back to login page
                script.println("</script>");
            }else{
            	System.out.println(promotion.getCode());
                EmailSender emailSender = new EmailSender();
            	ArrayList<String>email = userDAO.getEmailList();
            	for(int i=0; i<2;i++){
            		emailSender.sendEmail(email.get(i),"Promotion","We have been sent the promotion code of our "
	                		+"bookstore.\n Noew it's titme to enjoy your shopping with promotion.\n"
	                		+"You can copy the Promotion code :" + promotion.getCode() 
	                		+"\n The discount percentage : %" +promotion.getPercentage()
	                		+".\n Promotion Start from"+promotion.getStartDate()+" thru "+promotion.getExpDate()
	                		+"\n\n See you online.\n Bookstore team.");
            	}
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('Promotion has been sended')");
                script.println("location.href = 'admin.jsp'"); //go back to login page
                script.println("</script>");
            }
        }


    %>
	

</body>
</html>