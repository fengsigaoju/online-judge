<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%   
     request.setCharacterEncoding("utf-8");
     String temp=request.getParameter("pid");
     int pid=1;
     if (temp!=null)
     try
     {
     pid=Integer.parseInt(temp);//转化为数字
     }
     catch(Exception e)
     {
     pid=1;
     };
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
     PreparedStatement statement = conn.prepareStatement("select * from problemlist where problem_id=?");  
     statement.setInt(1,pid);
     ResultSet rs=statement.executeQuery();
     //如果题目不存在提示错误，否则直接记录下内容
     String problem_title=null;
     String problem_description=null;
     String problem_input=null;
     String problem_output=null;
     String problem_sampleinput=null;
     String problem_sampleoutput=null;
     String problem_author=null;
      if (rs.next())
     {
     problem_title=rs.getString("problem_title");
     problem_description=rs.getString("problem_description");
     problem_input=rs.getString("problem_input");
     problem_output=rs.getString("problem_output");
     problem_sampleinput=rs.getString("problem_sampleinput");
     problem_sampleoutput=rs.getString("problem_samploutput");
     problem_author=rs.getString("problem_author");
     }
    session.setAttribute("number2",String.valueOf(pid)); 
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
      p.pst{
      padding-top:20px;
      text-align:left;
      font-family:Arial,Helvetica,sans-serif;
      font-size:14pt;
      font-weight:bold;
      color:#00F;
      margin-bootom:0px;
      text-indent:10px;
      }
      div.textBG{
      background-color:#EAEBFF;
      padding:10px;
      border-style:dotted;
      border-width:2px;
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
          主页 </a></div>
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
<li><a href="problemlist.jsp">题目列表</a></li>
<li><strong><%= pid %></strong></li>
</ol>
 
<h2 style="text-align:center;color:BLUE"><strong><%=problem_title %></strong></h2>
<!-- 题目描述 -->
<p class="pst">输入描述</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_description%></p>
</div>
<!--题目描述 -->
<p class="pst">题目描述</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_description%></p>
</div>
<!-- 输入描述 -->
<p class="pst">输入描述</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_input%></p>
</div>
<!--输出描述  -->
<p class="pst">输出描述</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_output%></p>
</div>
<!-- 输入数据 -->
<p class="pst">输入样例</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_sampleinput%></p>
</div>
<!-- 输出数据 -->
<p class="pst">输出样例</p>
<div class="textBG">
<p style="text-align:left;font-size:20px"><%= problem_sampleoutput%></p>
</div>
<!-- 题目作者 -->
<p class="pst">题目来源</p>
<div class="textBG">
<p style="text-align:left;font-size:20px;text-indent:5px"><%= problem_author%></p>
</div>
<div style="text-align:center;padding-top:30px;padding-bottom:50px;">

<a href="tosubmit.jsp"><button type="button" class="btn btn-primary btn-lg">提交代码</button></a>
</div>
</body>
</html>
