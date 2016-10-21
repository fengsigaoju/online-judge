<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");
String temp=(String)session.getAttribute("number2");
String s=(String)session.getAttribute("username") ;
if (s==null)
response.sendRedirect("login.jsp");
int pid=1;
try
     {
     pid=Integer.parseInt(temp);//转化为数字
     }
     catch(Exception e)
     {
     pid=1;
     };
session.setAttribute("pid",String.valueOf(pid)); 
%>


</style>
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
      background-color:  #CCEEFF;
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
     textarea.form-control {
   width:800px;
   height:400px;
   margin: auto;
  
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
<li><a href="problemlist.jsp">题目</strong></a></li>
<li><a href="problemshow.jsp?pid=<%= pid %>"><%= pid %></a></li>
<li><strong>代码提交</strong></li>
</ol>
<form action="store.jsp" method="post">
<div style="text-align:center;">
<h2 style="font-size:30px;color:#317EAC;"> 代码提交</h2>
<textarea name="code" class="form-control" ></textarea>
</div>
<div style="text-align:center;padding-top:20px;padding-bottom:40px;"> 
 <button type="submit" class="btn btn-primary btn-lg">提交</button>

</div>
</form>
 </body>
</html>
