function getResult(){
	if (http_request.readyState==4){
		
		  if(XMLHttpReq.status == 200){
	          document.getElementById("toolTip").innerHTML=http_request.responseText;
	          document.getElementById("toolTip").style.display="block";
	          
		  }else{
	           window.alert("你请求的页面有异常");
	       }
	    }
	}