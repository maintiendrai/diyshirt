<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*,com.diyshirt.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript" src='<%=request.getContextPath() %>/js/common.js'></script>
<title>�û������Ļ����б�</title>
<script>
function act(a,b){
	document.checkform.action="/diyshirt/diyshirt/DIYShirtInfor.jsp?T_ShirtID="+a+"&CustomID="+b;
	document.checkform.submit();
}
</script>
</head>
<% 
	Page mypage = (Page)request.getAttribute("page");
	List data = mypage.getData();
%>
<body>
<div align="center">
<form name="checkform" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
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
						<table cellSpacing="0" cellPadding="0" width="720" bgcolor="#dffdff" border="0">
							<tr align="center">
								<td>�Ļ�������</td>
								<td>����ͼƬ</td>
								<td>����ͼƬ</td>
								<td>������ID</td>
								<td></td>
							</tr>
							<%
								Iterator it = data.iterator();
								while(it.hasNext()){
									String T_ShirtPath_1 = ShirtManager.getInstance().shirtinfo(to.getT_ShirtID()).getT_ShirtPath_1();
								    String pic = to.getPosPic();
					     			String T_ShirtName = to.getT_ShirtName();
									
							%>
							<tr align="center">
								<td><%=to.getT_ShirtName() %></td>
								<td>
								<%
									if(!to.getPosPic().equals("undefined")){
								%>
										<img src="/diyshirt/upload/<%=to.getPosPic() %>" onload="resizeimg(this,150,150);">
								<%
									}else{
								%>
										��
								<%
									}
								%>
								</td>
								<td>
								<%
									if(!to.getNegPic().equals("undefined")){
								%>
										<img src="/diyshirt/upload/<%=to.getNegPic() %>" onload="resizeimg(this,150,150);">
								<%
									}else{
										out.println("��");
									}
								%>
								</td>
								<td><%=to.getUserID() %></td>
								<td><input type="button" name="btn" value="�鿴��ϸ" onClick="act('<%=to.getT_ShirtID() %>','<%=to.getCustomID() %>');"></td>
							</tr>
							
							<%
								}
							%>
						</table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>