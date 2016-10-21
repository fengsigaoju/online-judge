<%@ page language="java" import="java.sql.*" contentType="text/html;charset=utf-8"%>  
<%@ page import="java.util.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%   
     
     int pagesize=10;//定义一页10道题目
     String temp=request.getParameter("page");//获得当前页数
     int pagecount=1;//默认是第一页
     if (temp!=null)
     try
     {
     pagecount=Integer.parseInt(temp);//转化为数字
     }
     catch(Exception e)
     {
     pagecount=1;
     };
     //如果是整除，那么直接是整数倍，否则是整数倍加+1
     if (pagecount<=0)
     pagecount=1;
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
     String sql="select * from problemlist;";
     PreparedStatement statement = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);  
     ResultSet rs=statement.executeQuery("select * from problemlist");
     int curpage;
   %>  
 <!DOCTYPE html>
<html lang="zh-CN">
  <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>通通</title>
     <script type="text/javascript" src="js/update.js"charset="gb2312" ></script>
     <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css">
     <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
     <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <style>
     p{
   font-size: 14px;
   font-family: 宋体;
     }
      .navbar {
      margin-bottom: 0;
       }
      body {
      background-image:-moz-linear-gradient(center bottom , #CBFAE1 20%, #FFF 80%);
      }
      .carousel{

        height:200px;
        background-color:#000;
      }
      .carousel .item{
        height:200px;
        background-color:#000;
      }
      .carousel img{
       width:100%;
      }
      footer{
        padding:80px 0px;
      }
      </style>
  </head>
  <body>

<!--轮播代码-->
<div id="myCarousel" class="carousel slide">
  <!-- 轮播（Carousel）指标 -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>   
  <!-- 轮播（Carousel）项目 -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/1.jpg" alt="First slide">
    </div>
    <div class="item">
      <img src="images/2.jpg" alt="Second slide">
    </div>
    <div class="item">
      <img src="images/3.jpg" alt="Third slide">
    </div>
  </div>
  <!-- 轮播（Carousel）导航 -->
  <a class="carousel-control left" href="#myCarousel" 
     data-slide="prev">&lsaquo;</a>
  <a class="carousel-control right" href="#myCarousel" 
     data-slide="next">&rsaquo;</a>
</div> 


<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid"> <div class="navbar-header"> <a class="navbar-brand" href="acmhome.jsp"> 
     主页
    </a></div>
    <div>
       <ul class="nav navbar-nav">
      <li><a href="problemlist.jsp">题目</a></li>
      <li><a href="update.jsp">个人信息修改</a></li>
      <li><a href="rank.jsp">排行榜</a></li>
      <li><a href="logout.jsp">登出</a></li>
      </ul>
    </div>
  </div>
</nav>
<ol class="breadcrumb">
<li><a href="acmhome.jsp">主页</a></li>
<li><strong >题目</strong></li>
</ol>
<% 
if (!rs.next())
{
%>
<div align="center" ><span class="glyphicon glyphicon-user"></span>没有题目</div>
<% 
}
else
{
     rs.last();
     int size=rs.getRow();//获得总行数
     curpage=(size%pagesize==0)?(size/pagesize):(size/pagesize+1);//分多少页
     if (pagecount>curpage) pagecount=curpage;//如果传过来的url超过最大页数默认是最后一页
     rs.absolute((pagecount-1)*pagesize+1);
     int count=0;
    
%>

<table class="table  table-hover table-bordered">
<thead>
<tr>
<th><p style="text-indent:20px;font-size:20px;">题目编号</p></th>
<th><p style="text-indent:20px;font-size:20px;">题目标题</p></th>
</tr>
</thead>
<tbody>
<% 
   do
   {
   count++;
%>
<tr>
  <td width="30%"><p style="text-indent:30px;font-size:20px;"><%= rs.getInt("problem_id") %></p></td>
     <td><p style="text-indent:20px;font-size:20px;"><a href="problemshow.jsp?pid=<%=rs.getInt("problem_id")%>"><%=rs.getString("problem_title") %></p></a></td>
</tr>
<%
} 
while(count<pagesize&&rs.next());
%>
</tbody>
</table>
<div style="padding-top:100px;padding-bottom:20px;font-size:20px">
<center>
<a href = "problemlist.jsp?page=1"  >首页</a>
<a href = "problemlist.jsp?page=<%=pagecount-1%>"  >上一页</a>
<a href = "problemlist.jsp?page=<%=pagecount+1%>">下一页</a>
<a href = "problemlist.jsp?page=<%=curpage%>">尾页</a>
第<%=pagecount%>页/共<%=curpage%>页  
</center>
</div>
<% 

}
%>
</body>
</html>