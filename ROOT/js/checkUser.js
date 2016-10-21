function checkUser(username)
{   
   if (username.value=="")
		{
		alert("用户名不能为空");
		}
	else
	createRequest('checkUser.jsp?user='+username.value);
}