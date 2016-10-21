<%@ page import="javax.mail.internet.InternetAddress"%>
<%@ page language="java"  contentType="text/html;charset=utf-8"%>  
<%@ page import="javax.activation.*,java.util.*"%>
<%@ page import="javax.mail.internet.*,javax.mail.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
try
{
request.setCharacterEncoding("utf-8");
String username=request.getParameter("username");
String to=request.getParameter("email");
String subject="您已经注册成功!";
String message="http://115.159.122.108/check3.jsp?username="+request.getParameter("username");
StringBuilder emailContent = new StringBuilder()  
        .append("您已经注册成功：<span style=\"color: #F3750F;font-weight: bold;font-size: larger;font-family: cursive;\">") 
        .append("<a href=\"")
        .append(message)
        .append("\">") 
        .append("点击此链接跳转")
        .append("</a>")
        .append("</span><br/>")  
        .append("此链接只能使用一次，验证成功自动失效；<br/>")  
        .append("<div style=\"font-size: small;color: gray;\">")  
        .append("(请在10分钟内完成验证，10分钟后验证码失效，您需要重新进行验证。感谢您的支持。)<br/>")  
        .append("如果您错误的收到了本电子邮件，请您忽略上述内容<br/>").append("</div>");  

Properties pros=new Properties();
Transport transport;
pros.put("mail.smtp.host", "smtp.163.com"); 
pros.put("mail.smtp.auth","true");
Session sendmailsession=Session.getInstance(pros);
sendmailsession.setDebug(true);
Message newMessage=new MimeMessage(sendmailsession);
newMessage.setFrom(new InternetAddress("15851815892@163.com"));
newMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
newMessage.setSubject(MimeUtility.encodeText(subject,MimeUtility.mimeCharset("gb2312"), null));  
newMessage.setSentDate(new Date());
newMessage.setContent(emailContent.toString(),"text/html;charset=UTF-8");
transport=sendmailsession.getTransport("smtp");
transport.connect("smtp.163.com","15851815892@163.com","sjk19650916");//这里比较麻烦，第一个是发送邮件的代理主机，第二个是发送邮箱的地址，第三个是发送邮箱的授权密码（而不是登录密码)
transport.sendMessage(newMessage, newMessage.getAllRecipients());
transport.close();
out.println("<script language='javascript'>alert('您已经注册请前往邮箱验证!');window.location.href='register.jsp';</script>");
}catch(MessagingException m){
out.println(m.toString());
}
%>

