<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%@ page import="java.io.*" buffer="64kb"%>
<%@ page import="java.sql.*" %>
<%
String file="";
String s=(String)session.getAttribute("username");//获取用户名
String id=(String)session.getAttribute("pid");//获取题目id
if (s==null)
response.sendRedirect("login.jsp");
try
{
String url="/home/ubuntu/zhangke/"+s+"_"+id+".output";
BufferedReader in=new BufferedReader(new InputStreamReader(new FileInputStream(url),"UTF-8"));  
String temp="";
while((temp=in.readLine())!=null)
{
file+=temp;
}
in.close();
}
catch(Exception e)
{
e.printStackTrace();
}
%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
</ol>

  
  <body>
  <div style="padding-top:50px;text-align:center">
    <% 
     ResultSet  rs;
    if (file.trim().equals("true")) {
     boolean f=false;//判断是否需要+1
     String driver = "com.mysql.jdbc.Driver";      
     String url = "jdbc:mysql://127.0.0.1:3306/login";      
     String use = "root";       
     String password = "960404";      
     Class.forName(driver);     
     Connection conn= DriverManager.getConnection(url,use,password); 
     PreparedStatement sql=conn.prepareStatement("select * from problemsolvelist where username=?");
     sql.setString(1,s);
     rs =sql.executeQuery();  //获得解决题目集合
     rs.next();
     if (rs.getString("problem_solveid")==null||rs.getString("problem_solveid").equals("null"))//如果这个人第一次解决问题
     f=true;//需要+1
     else
     {
     f=true;
     String[]source=rs.getString("problem_solveid").split(",");
      for (int i=0;i<source.length;i++)
     {
      if (source[i].equals(id))
      {
        f=false;//不需要+1
        break;
      }
      }
      }
     if (f)
     {
     String temp2;
     if (rs.getString("problem_solveid")==null||rs.getString("problem_solveid").equals("null"))
     temp2=id;
else
     temp2=rs.getString("problem_solveid")+","+id;

     
     PreparedStatement sql3=conn.prepareStatement("UPDATE problemsolvelist SET problem_number=problem_number+1 WHERE username =?;");
     sql3.setString(1,s);
     sql3.executeUpdate(); //完成数据量加1
     //往数据库里插入这道题目编号
    PreparedStatement sql4=conn.prepareStatement("UPDATE problemsolvelist SET problem_solveid=? WHERE username =?;");  
    sql4.setString(1,temp2);//
    sql4.setString(2,s);
    sql4.executeUpdate();  
     }
     
%>
   <div class="alert alert-warning">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
     <strong>恭喜！</strong>您的程序已经通过全部测试用例!
</div>
<% } else if (file.trim().equals("false")){ %>
  <div class="alert alert-warning">
	<a href="#" class="close" data-dismiss="alert">
		&times;
	</a>
       
	<strong>警告！</strong>您的结果有错误请再次检查!
</div>
<% }else  {%>
<div style="text-align:left;font-size:20px;text-indent:30px;color: #FF0000">
<strong>编译错误:</strong>
<%  out.println(file); }%>
</div>
  </div>
 
</body>
</html>
