<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%@ page import="com.po.Users" %>  
<%
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
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
     <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
     <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script>
     function send()
     {
     location.href = "login.jsp"; 
     }
     </script>
  </head>
  
  <body>
    <%
    request.setCharacterEncoding("utf-8");
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
     PreparedStatement sql=conn.prepareStatement("select * from student2 where name=? and password=? ");
     sql.setString(1,user.getUsername());
     sql.setString(2,user.getPassword());
     ResultSet rs=sql.executeQuery();
     if (rs.next()){
     flag=true;
     }
     rs.close();
     sql.close();
     conn.close();
     
     
  %>
 <% if (flag==true){ %>  
<jsp:forward page="acmhome.jsp"/>  
<%}   
else  
{  
%>  
 <script>
    $(function(){
        $('#myModal').modal({
        show:true,
        backdrop:'static',
        keyboard:false
        })
    });
</script>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true" onclick="send()">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					登陆失败
				</h4>
			</div>
			<div class="modal-body">
				用户名和密码不匹配
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="send()">关闭
				</button>
				</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div> 
<%} %>  
</body>  
</html>  
    
  