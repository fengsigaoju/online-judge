function isValid2(form)
{
	if (form.before_password.value=="")
	{
	alert("֮ǰ���벻��Ϊ��");
	return false;
	}
	if (form.new_password.value=="")
    {
	alert("�������벻��Ϊ��!");
	return false;
	}
	if (form.re_password.value=="")
    {
	alert("�������벻��Ϊ��!");
	return false;
	}
	if (form.re_password.value!=form.new_password.value)
	{
	alert("������������벻һ��");
	return false;
	}
    return true;
}