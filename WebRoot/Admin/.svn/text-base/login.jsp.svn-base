<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员登陆</title>
<head>
<script>
function log(){
  if(document.loginform.adminaccount.value==""){
    alert("请输入用户帐号");
    document.loginform.adminaccount.focus();
    return false;
  }
  if(document.loginform.password.value==""){
    alert("请输入密码");
    document.loginform.password.focus();
    return false;
  }
  document.loginform.submit();
}
</script>
</head>

<body>
<table>
<br><br><br><br><br><br>
</table>
<form name="loginform" action="adminlogin.do?operation=adminlogin" method=post>
<p align="center"><b>管理员登陆</b></p>
<table width="300" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#0066FF" bgcolor="#33CCFF">
<tr>
  <td width="100" align="center">管理帐号</td>
  <td><input type=text name="adminaccount" style="width:150px"></td>
</tr>
<tr>
  <td align="center">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</td>
  <td><input type=password name="password" style="width:150px"></td>
</tr> 
<tr>
  <td colspan=4 align=center>
  <input type=button  value="登录" onclick="log()">
  <input type=reset value="清空">
  <input type=button  value="主页" onclick="javascript:window.location='/diyshirt/index.jsp'">
  </td>
</tr>
</table>
</form>
</body>
</html>