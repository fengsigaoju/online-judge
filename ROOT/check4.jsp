<%@ page language="java" import="java.util.*" import="java.sql.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
request.setCharacterEncoding("utf-8");
String p=request.getParameter("new_password");
String username=(String)session.getAttribute("username");
%> 

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'check4.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <% 
     
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
     PreparedStatement sql=conn.prepareStatement("UPDATE student2 SET password=?WHERE name =?");  
     sql.setString(1,p);  
     sql.setString(2,username);  
     sql.executeUpdate(); 
     out.println("<script language='javascript'>alert('修改信息成功!');window.location.href='acmhome.jsp';</script>"); 
 %>
 
    This is my JSP page. <br>
  </body>
</html>
