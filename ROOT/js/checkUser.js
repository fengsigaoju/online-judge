function checkUser(username)
{   
   if (username.value=="")
		{
		alert("�û�������Ϊ��");
		}
	else
	createRequest('checkUser.jsp?user='+username.value);
}