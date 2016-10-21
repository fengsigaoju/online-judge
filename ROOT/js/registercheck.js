function isValid(form)
{
	if (form.username.value=="")
	{
	alert("用户名不能为空");
	return false;
	}
	var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!myreg.test(form.email.value))
	{
		alert("邮箱不符合规范");
		return false;
	}
	if (form.password.value=="")
    {
	alert("密码不能为空!");
	return false;
	}
	if (form.password.value!=form.repassword.value)
	{
	alert("两次输入的密码不一致");
	return false;
	}
    return true;
}