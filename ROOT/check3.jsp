<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<% 
request.setCharacterEncoding("utf-8");
String username=request.getParameter("username");

Boolean flag=false;%>
<!-- 检查用户名是否在表student1如果在添加到student2中并跳转login.jsp否则弹窗不存在并跳转regiter.jsp -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'check3.jsp' starting page</title>
    
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
     String url = "jdbc:mysql://127.0.0.1:3306/login?useUnicode=true&characterEncoding=UTF-8";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
 %>
 <% 
     PreparedStatement sql=conn.prepareStatement("select * from student1 where name=?");
     sql.setString(1,username);
     ResultSet rs=sql.executeQuery();
     if (rs.next()){
     flag=true;
     }
%>
 <%  
 if ((flag)&&(rs.getInt("sign")==0))//如果数据库并且是第一次插入
 {   
     sql=conn.prepareStatement("UPDATE student1 SET sign=? WHERE sign =? and name=?");  
     sql.setInt(1,1);
     sql.setInt(2,0);  
     sql.setString(3,username);
     sql.executeUpdate();  
     PreparedStatement sql2=conn.prepareStatement("INSERT INTO  student2(name,email,password)VALUES(?,?,?)");
     sql2.setString(1,username);
     sql2.setString(2,rs.getString("email"));
     sql2.setString(3,rs.getString("password"));
     sql2.executeUpdate();  
      //往用户账号里面插题目
      sql=conn.prepareStatement("INSERT INTO problemsolvelist(username,problem_number)VALUES(?,?)");  
      sql.setString(1,username);//1和2代表是第几个问号(这里设置?是为了方便)  
      sql.setInt(2,0); //初始做了0题 
      sql.executeUpdate();  
      rs.close();
     sql.close();
     sql2.close();
     conn.close();
     out.println("<script language='javascript'>alert('您已经注册成功');window.location.href='login.jsp';</script>");
 }
 else  
 if (flag)
 out.println("<script language='javascript'>alert('请不要重复注册');window.location.href='login.jsp';</script>");
 else
 out.println("<script language='javascript'>alert('该链接不正确');window.location.href='register.jsp';</script>");
%>
 
  </body>
</html>
