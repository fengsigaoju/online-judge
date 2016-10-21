var http_request;	
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
    console.log(url);
	http_request.open("GET",url,true);
    http_request.send(null);
}