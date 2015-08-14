<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>修改密码</title>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 10px}
.STYLE4 {color: #FF0000}
-->
    </style>
</head>
<script>
function act(){
	if(document.checkform.password.value==""){
		alert("请输入原始密码");
		document.checkform.password.focus();
		return false;
	}
	
	if(document.checkform.pwd1.value==""){
		alert("请输入新密码");
		document.checkform.pwd1.focus();
		return false;
	}
	
	if(document.checkform.pwd1.value.length<6){
		alert("密码长度太短,请重新输入");
		document.checkform.pwd1.focus();
		return false;
	}
	
	if(document.checkform.pwd1.value!=document.checkform.pwd2.value){
		alert("两次输入密码不同，请重新输入");
		document.checkform.pwd2.focus();
		return false;
	}
	document.checkform.pwd1.value=hex_md5(document.checkform.pwd1.value)
}
</script>
<% MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); %>
<body>
<div align="center">
<form name="checkform" method="post" action="changepwd.do" onSubmit="return act();">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td><br><br></td></tr>
	<%
		if(user!=null){
	%>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr>
					<td align="right">请输入原始密码：</td>
					<td><input type="text" name="password"></td>
				</tr>
				<tr>
					<td align="right">请输入新密码：</td>
					<td><input type="password" name="pwd1"><span class="STYLE4">*</span>
				    	<span class="STYLE2"> 密码长度至少为6位</span></td>
				</tr>
				<tr>
					<td align="right">请再次输入新密码:</td>
					<td><input type="password" name="pwd2"><input type="hidden" name="operation" value="changepwd"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="center">
			<input type="submit" name="sub" value="确认修改">
			<input type="button" name="btn" value="取消" onClick="javascript:window.location='UserControl.jsp'">
		</td>
	</tr>
	<%
		}
	%>
</table>
</form>
</div>
</body>
</html>