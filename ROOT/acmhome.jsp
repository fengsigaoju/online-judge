<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
request.setCharacterEncoding("utf-8");
if (session.getAttribute("username")==null)//第一次登陆
session.setAttribute("username",(String)request.getParameter("username"));
%>
<!DOCTYPE html>
 <html lang="zh-CN">
  <head>
    <meta charset="utf-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <title>fitting</title>
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









<div class="container">
 <div id='content' class='row-fluid'>
  <div class='col-md-8'>
    <h2><strong>欢迎来到南京邮电大学oj</strong></h2>
    <p style="padding-top: 20px">如果页面显示有问题，下载试试<a href="http://acm.njupt.edu.cn/acmhome/download/GoogleChrome_36.0.1985.143_PortableSoft.zip">Chrome浏览器绿色版。</a></p>
     <br>
     
     <p >
更多的南邮ACM新闻，请<a href="http://solab.njupt.edu.cn/">点击。</a></p>
<br>
<p>

在ACM-ICPC中获得很好成绩的人，现在都在干什么？请<a href="http://www.zhihu.com/question/26828533">点击。</a></p>
<br>
<p>

如果你是南邮学生，想提高编程水平、有编程问题寻求帮助，或希望加入南邮ACM竞赛队，可申请加入南邮ACM程序设计交流群（QQ群号为225811372，请提供你的学号+姓名实名认证）。
</p>
</div>
<div class='col-md-2 col-md-offset-2'>
    <h2><strong>友情链接</strong></h2>
  <ul class="nav nav-pills nav-stacked">
  <li ><a href='http://acm.hdu.edu.cn/'>杭电oj</a></li>
  <li ><a href='http://acm.hust.edu.cn/'>华中科技大学oj</a></li>
  <li ><a href='http://poj.org/'>北大oj</a></li>
</ul> 
  </div>
</div>  
</div>
<div class="container">
<footer style="text-align:center; border-bottom: 0px" >
<address><!--地址-->
  <strong>南京邮电大学</strong><br>
   南京亚东新城区文苑路9号(仙林校区)  &nbsp南京新模范马路66号(三牌楼校区)&nbsp
  <abbr title="Phone">联系电话</abbr> (025) 15851815892
</address>
</footer>
</div>

</body>
</html>	
