function getResult(){
	if (http_request.readyState==4){
		
		  if(XMLHttpReq.status == 200){
	          document.getElementById("toolTip").innerHTML=http_request.responseText;
	          document.getElementById("toolTip").style.display="block";
	          
		  }else{
	           window.alert("�������ҳ�����쳣");
	       }
	    }
	}