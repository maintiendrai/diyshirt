<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>����Ա��½</title>
<head>
<script>
function log(){
  if(document.loginform.adminaccount.value==""){
    alert("�������û��ʺ�");
    document.loginform.adminaccount.focus();
    return false;
  }
  if(document.loginform.password.value==""){
    alert("����������");
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
<p align="center"><b>����Ա��½</b></p>
<table width="300" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#0066FF" bgcolor="#33CCFF">
<tr>
  <td width="100" align="center">�����ʺ�</td>
  <td><input type=text name="adminaccount" style="width:150px"></td>
</tr>
<tr>
  <td align="center">��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��</td>
  <td><input type=password name="password" style="width:150px"></td>
</tr> 
<tr>
  <td colspan=4 align=center>
  <input type=button  value="��¼" onclick="log()">
  <input type=reset value="���">
  <input type=button  value="��ҳ" onclick="javascript:window.location='/diyshirt/index.jsp'">
  </td>
</tr>
</table>
</form>
</body>
</html>