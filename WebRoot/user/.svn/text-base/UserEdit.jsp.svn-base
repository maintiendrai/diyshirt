<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.MemberinfoTo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户个人资料管理</title>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/diyshirt/Admin/table.css">
<style type="text/css"></style>
</head>
<script>
function jscheckform(checkform){

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
}

</script>
<% MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); %>
<body>
<form name="checkform" method="post" action="useredit.do?action=useredit" onSubmit="return jscheckform(checkform)">
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	
	<%
		if(user!=null){
	%>
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" width="55%" bgcolor="#dffdff" border="0">
							<tr>
								<td><a href="UserControl.jsp">查看用户资料<p></a></td>
							</tr>
							<tr>
								<td><a href="UserEdit.jsp">修改用户资料<p></a></td>
							</tr>
							<tr>
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">查看上传图片<p></a></td>
							</tr>
							<tr>
								<td><a href="picfavlist.do?operation=picfavlist&pageNum=1">查看收藏图片<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtfavlist.do?operation=shirtfavlist&pageNum=1">查看收藏文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtusercustomlist.do?operation=shirtusercustomlist&pageNum=1">查看定制文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">查看订单</a></td>
							</tr>
						</table>
					</td>
					<td>
						<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" height="20" border="0">
							<tr>
						 		<td width="40%" align="right">会员ID:</td>
								<td width="60%" align="left"><input type="text" name="UserID" value=<%=user.getUserID()%>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">昵  称:</td>
								<td width="60%" align="left"><input type="text" name="NickName" value=<%=user.getNickName() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">年  龄:</td>
								<td width="60%" align="left"><input type="text" name="Age" value=<%=user.getAge() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">性  别:</td>
								<td width="60%" align="left"><%
																if(user.getSex()==0){
															 %>
																	<input type="radio" name="Sex" value=0 checked>男
																	<input type="radio" name="Sex" value=1>女
															<%
																}
																else{
															%>
																	<input type="radio" name="Sex" value=0>男
																	<input type="radio" name="Sex" value=1 checked>女
															<%
																}
															%>
															</td>
							</tr>
							<tr>
							 	<td width="40%" align="right">固定电话:</td>
								<td width="60%" align="left"><input type="text" name="Telephone" value=<%=user.getTelephone() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">移动电话:</td>
								<td width="60%" align="left"><input type="text" name="Mobilephone" value=<%=user.getMobilephone() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">地  址:</td>
								<td width="60%" align="left"><input type="text" name="Address" value=<%=user.getAddress() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">邮政编码:</td>
								<td width="60%" align="left"><input type="text" name="Post" value=<%=user.getPost() %>></td>
							</tr>
							<tr>
							 	<td width="40%" align="right">QQ:</td>
								<td width="60%" align="left"><input type="text" name="QQ" value=<%=user.getQQ() %>></td>
								<input type="hidden" name="operation" value="useredit">
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit" name="sub" value="确认修改">
										<input type="button" name="btn" value="取消" onClick="javascript:window.location='/diyshirt/user/UserEdit.jsp'">
										<input type="button" name="btn2" value="修改密码" onClick="javascript:window.location='/diyshirt/user/UserChangePwd.jsp'">
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%
		}else{
	%>
	<tr>
		<td align="center"><h1>请先登录!</h1></td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="btn2" value="返回" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
	</tr>
	<%
		}
	%>
</table>
</div>
</form>
</body>
</html>