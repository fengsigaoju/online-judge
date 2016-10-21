<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
   <script type="text/javascript"charset="utf-8">
    var http_request;	
    function checkUser(username)
{   
   if (username.value=="")
		{
		alert("用户名不能为空");
		}
	else
	createRequest("checkUser.jsp?user="+username.value);
}
    function createRequest(url){
																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											
	if (window.XMLHttpRequest){
	http_request=new XMLHttpRequest();
    }
	else if(window.ActiveXObject){
	       try{
	    	   http_request = new ActiveXObject("MSXML2.XMLHTTP");
	       }catch(e){
	           try{
	        	   http_request = new ActiveXObject("Mircsoft.XMLHTTP");
	           }catch(e1){}
	       }
	    
	}
    http_request.onreadystatechange=getResult;
  
	http_request.open("GET",url,true);
    http_request.send(null);
}
    function getResult(){
	if (http_request.readyState==4){
		
		  if(http_request.status == 200){
	          document.getElementById("toolTip").innerHTML=http_request.responseText;
	          document.getElementById("toolTip").style.display="block";
	          
		  }else{
	           window.alert("你请求的页面有异常");
	       }
	    }
	}
   
    
    
    
    
    </script>
	<meta charset="UTF-8">
	<title>注册</title>
	<meta name="keywords" content="">
	<meta name="content" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <link type="text/css" rel="stylesheet" href="css/login.css">
    <script type="text/javascript" src="js/registercheck.js"></script>
    <script type="text/javascript" src="js/shuaxin.js"></script>
 </head>
<body class="login_bj" >
    <style type="text/css">
                <!--
                #toolTip{
                position:absolute;
                left:290px;
                right:20px;
                height:0px;
                padding-top:0px;
                padding-left:0px;
                padding-right:0px;
                z-index:1;
                display:none;
                color:red;
                
          }
          
          
           </style>
           
           
<div class="zhuce_body">
	 <div class="zhuce_kong">
    	<div class="zc">
        	<div class="bj_bai">
            <h3>欢迎注册</h3>
       	  	  <form action="check.jsp" method="post" name="form1" onSubmit="return isValid(this);">
       	  	   <div id="toolTip"></div>
                <input name="username" type="text" class="kuang_txt phone" placeholder="用户名" onblur="checkUser(form1.username);">
            
          
                <input name="email" type="text" class="kuang_txt email" placeholder="邮箱">
                <input name="password" type="text" class="kuang_txt possword" placeholder="密码">
                <input name="repassword" type="text" class="kuang_txt possword" placeholder="再次输入密码">
                <input name="verify" type="text" class="kuang_txt yanzm" placeholder="验证码">
               
                <div>
                	<div class="hui_kuang" ><img src="number.jsp" width="98" height="31"  id="picture" ></div>
                	<div class="shuaxin" ><img src="images/zc_25.jpg" width="13" height="14" id="picture2" onClick="change()"></div>
                    
                </div>
              
                <input name="注册" type="submit" class="btn_zhuce" value="注册">
                </form>
               
            </div>
        	<div class="bj_right">
            	<p>使用以下账号直接登录</p>
                <a href="#" class="zhuce_qq">QQ注册</a>
                <a href="#" class="zhuce_wb">微博注册</a>
                <a href="#" class="zhuce_wx">微信注册</a>
                <p>已有账号？<a href="login.jsp">立即登录</a></p>
               
            </div>
        </div>
       
    </div>

</div>
<div style="text-align:center;">
</div>
</body>
</html>