<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.MemberinfoTo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>用户资料管理</title>
</head>
<% 
	MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); 
	String UserID = (String)session.getAttribute("UserID");
%>
<body>
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
								<td width="40%" align="center">会员ID:</td>
								<td width="60%" align="center"><%=UserID%></td>
							</tr>
							<tr>
								<td width="40%" align="center">昵  称:</td>
								<td width="60%" align="center"><%=user.getNickName() %></td>
							</tr>
							<tr>
								<td width="40%" align="center">年  龄:</td>
								<td width="60%" align="center"><%=user.getAge() %></td>
							</tr>
							<tr>
								<td width="40%" align="center">性  别:</td>
								<td width="60%" align="center"><%
																if(user.getSex()==0){
															 %>
																	男
															<%
																}
																else{
															%>
																	女
															<%
																}
															%>
								</td>
							</tr>
							<tr>
								<td width="40%" align="center">固定电话:</td>
								<td width="60%" align="center"><%=user.getTelephone() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">移动电话:</td>
								<td width="60%" align="center"><%=user.getMobilephone() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">地  址:</td>
								<td width="60%" align="center"><%=user.getAddress() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">邮政编码:</td>
								<td width="60%" align="center"><%=user.getPost() %></td>
							</tr>
							<tr>
				 				<td width="40%" align="center">QQ:</td>
								<td width="60%" align="center"><%=user.getQQ() %></td>
							</tr>
						</table>
					</td>
				</tr>
				<%
					}else{
				%>
				<tr>
					<td align="center">请先登录</td>
				</tr>
				<tr>
					<td align="center"><input type="button" name="btn" value="返回" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
				</tr>
				<%
					}
				%>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>