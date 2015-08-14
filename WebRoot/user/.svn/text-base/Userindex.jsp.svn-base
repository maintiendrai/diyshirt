<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.model.*" %>
<%@ page import="com.diyshirt.to.*" %>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>用户登录</title>
</head>

	<body>
		<form name="userindex" method="post" action="FrontController.do?operation=login">
					<table width="250" height="91" border="0" align="center">
						<tr>
							<td width="60%" align="center">欢迎您：</td>
							<td width="40%" align="left"><%=user.getNickName() %></td>
						</tr>
							<%
								if(user.getAge()!=0){
							%>
						<tr>
									<td width="60%" align="center">年  龄：</td>
									<td width="40%" align="left"><%=user.getAge() %></td>
						</tr>
							<%
								}
							%>
						<tr>
							<td width="60%" align="center">性  别：</td>
							<td width="40%" align="left"><%
															if(user.getSex()==0) out.println("男");
															else out.println("女");
														%>
							</td>
						</tr>
						<% if(user!=null){
							FeedbackTo to=FeedbackManager.getInstance().findFeeByID(user.getUserID());
							%>
						<tr>
						<td>您当前信誉度为：</td>
						<td><%= to.getFeedback() %></td>
						</tr>
						<tr>
						<td>您当前总积分为：</td>
						<td><%= to.getIntegral() %></td>
						</tr>
						<%} %>
						<tr>
						<td></td>
						<td><a href="logout.do?operation=logout">注销</a></td>
						</tr>
					</table>

		</form>
	</body>
</html>