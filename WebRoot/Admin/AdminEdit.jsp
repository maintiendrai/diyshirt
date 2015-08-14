<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>个人管理</title>
</head>
<script>
function jscheckform(form){

  if(document.form.Password2.value==""){
    alert("请输入旧密码");
    document.form.Password2.focus();
    return false;
  }
  if(document.form.Password2.value!=document.form.Password3.value){
    alert("旧密码不正确");
    document.form.Password2.focus();
    return false;
  }
  if(document.form.Password.value==""){
    alert("请设置新密码！");
    document.form.Password.focus();
    return false;
  }
  if(document.form.Password.value!=document.form.Password1.value){
    alert("两次设置的新密码不一致！");
    document.form.Password.focus();
    return false;
  }   
  if(document.form.Password.value.length<6){
    alert("密码长度太小");
    document.form.Password.focus();
    return false;
  }
}

</script>
<body>
<%
AdministratorinfoTo Admin = (AdministratorinfoTo)session.getAttribute("Admin");
%>
<form id="form" name="form" method="post" action="FrontController.do?operation=adminedit" onSubmit="return jscheckform(form)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改密码</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">管理员帐户</td>
      <input type="hidden" name="AdminID" value="<%=Admin.getAdminID() %>"/>
      <td><%=Admin.getAdminAccount() %></td>
    </tr>
    <tr>
      <td>旧密码</td>
      <td><input type="password" name="Password2" value="" style="width:180px"/></td>
      <input type="hidden" name="Password3" value="<%=Admin.getPassword() %>"/>
    </tr>
    <tr>
      <td>新密码</td>
      <td><input type="password" name="Password" value="" style="width:180px"/>
      <span class="STYLE2"> 密码长度至少为6位</span></td>
    </tr>
        <tr>
      <td>再次输入新密码</td>
      <td><input type="password" name="Password1" value="" style="width:180px"/></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
