<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.MemberinfoTo" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�û����Ϲ���</title>
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
								<td><a href="UserControl.jsp">�鿴�û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="UserEdit.jsp">�޸��û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">�鿴�ϴ�ͼƬ<p></a></td>
							</tr>
							<tr>
								<td><a href="picfavlist.do?operation=picfavlist&pageNum=1">�鿴�ղ�ͼƬ<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtfavlist.do?operation=shirtfavlist&pageNum=1">�鿴�ղ��Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtusercustomlist.do?operation=shirtusercustomlist&pageNum=1">�鿴�����Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">�鿴����</a></td>
							</tr>
						</table>
					</td>
					<td>
						<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" height="20" border="0">
							<tr>
								<td width="40%" align="center">��ԱID:</td>
								<td width="60%" align="center"><%=UserID%></td>
							</tr>
							<tr>
								<td width="40%" align="center">��  ��:</td>
								<td width="60%" align="center"><%=user.getNickName() %></td>
							</tr>
							<tr>
								<td width="40%" align="center">��  ��:</td>
								<td width="60%" align="center"><%=user.getAge() %></td>
							</tr>
							<tr>
								<td width="40%" align="center">��  ��:</td>
								<td width="60%" align="center"><%
																if(user.getSex()==0){
															 %>
																	��
															<%
																}
																else{
															%>
																	Ů
															<%
																}
															%>
								</td>
							</tr>
							<tr>
								<td width="40%" align="center">�̶��绰:</td>
								<td width="60%" align="center"><%=user.getTelephone() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">�ƶ��绰:</td>
								<td width="60%" align="center"><%=user.getMobilephone() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">��  ַ:</td>
								<td width="60%" align="center"><%=user.getAddress() %></td>
							</tr>
							<tr>
							 	<td width="40%" align="center">��������:</td>
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
					<td align="center">���ȵ�¼</td>
				</tr>
				<tr>
					<td align="center"><input type="button" name="btn" value="����" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
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