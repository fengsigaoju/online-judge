<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
  
<%
request.setCharacterEncoding("UTF-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>检查页</title>
    
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
  
    boolean flag=true;
    String username=request.getParameter("user");
   %>
    <%@page import="com.po.Users"%><%
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
      PreparedStatement sql=conn.prepareStatement("select * from student1 where name=?");
     sql.setString(1,username);
     ResultSet rs=sql.executeQuery();
     if (rs.next()){
     flag=false;
     }
     rs.close();
     sql.close();
     conn.close();
  %>
  
<% 
if (flag==false){
    out.print("用户名已经被注册");
   
   }
  else{
   out.print("用户名尚未被注册");
  
   }
   
%>  
 
 
</body>  
</html>  
    