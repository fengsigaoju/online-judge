<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@  page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int pagesize=10;
int curpage=1;//默认当前是第一页
   String driver = "com.mysql.jdbc.Driver";  
   String url = "jdbc:mysql://127.0.0.1:3306/login"; 
   String user = "root"; 
   String password = "960404";  
     Class.forName(driver);  
     Connection conn = DriverManager.getConnection(url, user, password);     
     String sql="select * from problemsolvelist order by problem_number desc";
     PreparedStatement stat = conn.prepareStatement(sql,ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);    
     ResultSet rs = stat.executeQuery();    
     rs.last();  
     int size=rs.getRow();//获得最大页数
     int pagecount=(size%pagesize==0)?(size/pagesize):(size/pagesize+1) ; //获得最多分多少页
     String temp=request.getParameter("curpage");
     if (temp!=null)
     try 
     {
     curpage=Integer.parseInt(temp);//转化为数字
     }
     catch(Exception e)
     {
     curpage=1;
     };
     if (curpage<=0)
     curpage=1;
     if(curpage>=pagecount) curpage=pagecount;  
     rs.absolute((curpage-1)*pagesize+1);
     int count=0;
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
      caption.ranklist{
      text-align:center;
      font-size:30px;
      font-family:宋体;
      font-weight:bold;
      color:#00F;
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
<li><a href="rank.jsp">排行榜</a></li>
</ol>

<table class="table  table-hover">
  <caption class="ranklist"> 排行榜</caption>
  <thead>
   <tr>
   <th style="font-size:20px;padding-left:10px">名次</th>
   <th style="font-size:20px">用户名</th>
   <th style="font-size:20px">解决题目个数</th>
   </tr>
   </thead>
  <% 
  int ranklist;
  String username;
  int solve;
  do{
   if (count>=pagesize)break;
   ranklist=rs.getRow();
   username=rs.getString(1);
   solve=rs.getInt(3);
   count++;
 %>
  <tbody>
   <tr>
    <td style="font-size:16px;padding-left:20px"><%= ranklist %></td>
    <td style="font-size:16px"><%= username %></td>
    <td style="font-size:16px"><%= solve %></td>
    </tr>
  </tbody>
  <%}while(rs.next()) ; %>
</table>
<p  style="text-align:center;font-size:20px;padding-top:100px">
<a href = "rank.jsp?curpage=1" >首页</a>    
<a href = "rank.jsp?curpage=<%=curpage-1%>" >上一页</a>    
<a href = "rank.jsp?curpage=<%=curpage+1%>" >下一页</a>    
<a href = "rank.jsp?curpage=<%=pagecount%>" >尾页</a>    
第<%=curpage%>页/共<%=pagecount%>页   
</p> 
</body>
</html>