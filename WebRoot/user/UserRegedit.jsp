<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>

<html>
	<head>


		<title>用户注册</title>

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
function jscheckform(){

  if(document.checkform.UserID.value==""){
    alert("请输入用户帐号");
    document.checkform.UserID.focus();
    return false;
  }
  
    if(!isEmail(document.checkform.UserID.value)){
    alert("用户帐号不合法");
    document.checkform.UserID.focus();
    return false;
  }
	if(document.checkform.Password.value.length<6){
    alert("密码长度太小");
    document.checkform.password.focus();
    return false;
  }
  
  if(document.checkform.Password.value==""){
    alert("请设置密码！");
    document.checkform.Password.focus();
    return false;
  }
  if(document.checkform.Password.value!=document.checkform.Password2.value){
    alert("两次设置的密码不一致！");
    document.checkform.Password.focus();
    return false;
  } 
  if(document.checkform.NickName.value==""){
    alert("请输入昵称！");
    document.checkform.Password.focus();
    return false;
  }
   if(!isNum(document.checkform.Age.value)||document.checkform.Age.value<0||document.checkform.Age.value>100){
    alert("请输入正确年龄");
    document.checkform.Age.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.Telephone.value)){
    alert("固定电话不合法");
    document.checkform.Telephone.focus();
    return false;
  }
  if(!isTelnum(document.checkform.Mobilephone.value)){
    alert("移动电话不合法");
    document.checkform.Mobilephone.focus();
    return false;
  }
  if(!isNum(document.checkform.Post.value)){
    alert("邮编不合法");
    document.checkform.Post.focus();
    return false;
  }
  if(!isNum(document.checkform.QQ.value)){
    alert("QQ不合法");
    document.checkform.QQ.focus();
    return false;
  }
  

  if(confirm('您确定要注册么？')){
 	 document.checkform.Password.value=hex_md5(document.checkform.Password.value);
 	 document.checkform.submit();
  }
}

</script>
	<body>
		<form  name="checkform" method="post" action="userregedit.do">
			<h1 align="center">用户注册</h1>
			<table width="596" height="175" border="0" align="center">
				<tr>
					<td width="50%" align="center">用户帐号</td>
					<td width="50%" align="left"><input type="text" name="UserID" >
						<span class="STYLE4">*</span>
						<span class="STYLE2">请以Email作为帐号</span>
					</td>
				</tr>
				<tr>
					<td width="50%" align="center">密  码</td>
					<td width="50%"><input type="password" name="Password"><span class="STYLE4">*</span>
				    	<span class="STYLE2"> 密码长度至少为6位</span>
				    </td>
				</tr>
				<tr>
					<td width="50%" align="center">确认密码</td>
					<td width="50%"><input type="password" name="Password2"><span class="STYLE4">*</span></td>
				</tr>
				<tr>
					<td width="50%" align="center">用户昵称</td>
					<td width="50%"><input type="text" name="NickName"><span class="STYLE4">*</span></td>
				</tr>
				<tr>
					<td width="50%" align="center">性  别</td>
					<td width="50%"><label><input type="radio" name="Sex" value="0" checked>男</label>
						<label><input type="radio" name="Sex" value="1">女</label>
					</td>
				</tr>
				<tr>
					<td width="50%" align="center">年  龄</td>
					<td width="50%"><input type="text" name="Age"></td>
				</tr>
				<tr>
					<td width="50%" align="center">固定电话</td>
					<td width="50%"><input type="text" name="Telephone"></td>
				</tr>
				<tr>
					<td width="50%" align="center">移动电话</td>
					<td width="50%"><input type="text" name="Mobilephone"></td>
				</tr>
				<tr>
					<td width="50%" align="center">联系地址</td>
					<td width="50%"><input type="text" name="Address"></td>
				</tr>
				<tr>
					<td width="50%" align="center">邮  编</td>
					<td width="50%"><input type="text" name="Post"></td>
				</tr>
				<tr>
					<td width="50%" align="center">QQ</td>
					<td width="50%"><input type="text" name="QQ"><input type="hidden" name="operation" value="userregedit"></td>
				</tr>
				<tr>
					<td colspan="2">
					  <div align="center">
					    <input type="button" name="Submit" value="注册" onClick="jscheckform();">
					    <input type="reset" name="Submit2" value="重置" >
				          </div></td></tr>
		  </table>
		</form>
	</body>
</html>
