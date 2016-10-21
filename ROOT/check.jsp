<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%@ page import="com.po.Users" %>  
<%
request.setCharacterEncoding("utf-8");
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
      String yan=(String)session.getAttribute("rand");
      if(!yan.equals((String)request.getParameter("verify")))
      out.print("<script>alert('验证码错误!');location.href='register.jsp';</script>");
      else
      {
      boolean flag=false;
    %>
   
    <jsp:useBean id="user" class="com.po.Users"/><!-- 对javabeans进行修改需要过一段时间才能体现 -->
    <jsp:setProperty name="user" property="*"/>
    <%
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
     PreparedStatement sql=conn.prepareStatement("INSERT INTO  student1(name,email,password,sign)VALUES(?,?,?,?)");
     sql.setString(1,user.getUsername());
     sql.setString(2,user.getEmail());
     sql.setString(3,user.getPassword());
     sql.setInt(4,0);//初始化sign为0
     int rtn=sql.executeUpdate();    
     sql.close();    
     conn.close();  
  %>
 <jsp:forward page="sendmail.jsp"/>   
<%} %>
</body>  
</html>  
    
  