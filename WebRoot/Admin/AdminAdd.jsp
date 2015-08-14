<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>管理员管理</title>
</head>
<script>
function jscheckform(form){

  if(document.form.AdminAccount.value==""){
    alert("请输入管理员帐户");
    document.form.AdminAccount.focus();
    return false;
  }
  if(document.form.Password.value==""){
    alert("请设置密码！");
    document.form.Password.focus();
    return false;
  }
  if(document.form.Password.value!=document.form.Password1.value){
    alert("两次设置的密码不一致！");
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
<form id="form" name="form" method="post" action="FrontController.do?operation=adminadd&method=add" onSubmit="return jscheckform(form)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>新增管理员</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">管理员帐户</td>
      <td><input type="text" name="AdminAccount" value="" style="width:180px"/></td>
    </tr>
    <tr>
      <td>管理员密码</td>
      <td><input type="password" name="Password" value="" style="width:180px"/>
      <span class="STYLE2"> 密码长度至少为6位</span></td>
    </tr>
        <tr>
      <td>再次输入密码</td>
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
