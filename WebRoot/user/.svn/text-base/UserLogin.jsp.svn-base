<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<html>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<head>

		<title>会员登录</title>
<script> 
function jscheckform(checkform){

   if(checkform.UserID.value==""){
		alert("请输入会员ID!");checkform.UserID.focus();return false;
	}
	if(checkform.Password.value==""){
		alert("请输入密码");checkform.Password.focus();return false;
	}
 document.checkform.Password.value=hex_md5(document.checkform.Password.value)
  
}

 </script>
	</head>


	<body>
		<form name="checkform" method="post" action="userlogin.do?operation=userlogin" onSubmit="return jscheckform(checkform)">
					<table width="250" height="91" border="0" align="center">
						<tr>
							<td width="30%" align="right">会员ID：</td>
							<td width="70%" align="left"><input type="text" name="UserID" size="15"/></td>
						</tr>
						<tr>
							<td width="30%" align="right">密  码：</td>
							<td width="70%" align="left"><input type="password" name="Password" size="15"/></td>
						</tr>
						<tr>
							<td align="right"><input type=submit value="登  录" /></td>
							<td align="left"><input type=button value="注册新会员" onClick="javascript:window.location='/diyshirt/user/UserRegedit.jsp'"/></td>
						</tr>
					</table>
		</form>
	</body>
</html>