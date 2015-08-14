<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>图片收藏</title>
</head>
<% 
	MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); 
	Page mypage = (Page)request.getAttribute("mypage");
	List data = mypage.getData();
%>
<body>
<form name="checkform" method="post" action="">
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
								<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" border="0">
										
											<%
												Iterator it = data.iterator();
												while(it.hasNext()){
													PictureTo to = (PictureTo)it.next();
											%>
										 		<tr><td>
										 				<img src='/diyshirt/upload/<%=to.getPicPath() %>' onload="javascript:resizeimg(this,100,200)">
										 		</td></tr>
										 	<%} %>
										
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