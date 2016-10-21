function isValid2(form)
{
	if (form.before_password.value=="")
	{
	alert("之前密码不能为空");
	return false;
	}
	if (form.new_password.value=="")
    {
	alert("现在密码不能为空!");
	return false;
	}
	if (form.re_password.value=="")
    {
	alert("现在密码不能为空!");
	return false;
	}
	if (form.re_password.value!=form.new_password.value)
	{
	alert("两次输入的密码不一致");
	return false;
	}
    return true;
}