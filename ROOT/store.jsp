<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" %>

<%

request.setCharacterEncoding("utf-8");
String s=(String)session.getAttribute("username") ;
String temp=(String)session.getAttribute("pid");//题号
String code=request.getParameter("code");//获得用户输入的代码
try
{
File f = new File("/home/ubuntu/zhangke/"+s+"_"+temp+".cpp");//username_id.cpp
OutputStreamWriter write = new OutputStreamWriter(new FileOutputStream(f),"gbk"); 
BufferedWriter writer=new BufferedWriter(write);         
writer.write(code);
writer.close();
}catch(Exception e)
{

e.printStackTrace();
}


%>
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    
    <title>My JSP 'store.jsp' starting page</title>
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
    $(function(){
        $('#myModal').modal({
        show:true,
        backdrop:'static',
        keyboard:false
        })
    });
</script>
  </head>
  <body>
 <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					您的程序已上交
				</h4>
			</div>
			<div class="modal-body">
				后台正在判断您的程序是否正确，请耐心等待
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">关闭
				</button>
				
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<%
try
{
Process process = Runtime.getRuntime().exec("sh /home/ubuntu/zhangke/compile.sh "+s+" "+temp);//依次传递用户名和id
}catch(Exception e){
e.printStackTrace();
}
%>
<% response.setHeader("refresh","3;url=result.jsp"); %>
  </body>
</html>
