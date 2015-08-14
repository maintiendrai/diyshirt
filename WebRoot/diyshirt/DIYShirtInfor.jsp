<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.model.*,com.diyshirt.to.*,com.diyshirt.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript" src='<%=request.getContextPath() %>/js/common.js'></script>
<title>文化衫详细信息</title>
</head>
<%
	int T_ShirtID = Integer.parseInt((String)request.getParameter("T_ShirtID"));
	int CustomID = Integer.parseInt((String)request.getParameter("CustomID"));
	T_ShirtCustomTo to = ShirtManager.getInstance().diyshirtinfo(CustomID);
%>
<body>
<div align="center">
<form name="checkform" method="post" action="">
<input type=hidden name="UserID"value=<%=session.getAttribute("UserID") %> >
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr align="center">
					<td>
						<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(T_ShirtID).getT_ShirtPath_1() %>" onload="resizeimg(this,400,480);over3('<%=to.getPosPic() %>','<%=to.getPosLoc_1() %>','<%=to.getPosLoc_2() %>','<%=to.getPosSize() %>');">
						<div id="img1"></div>
					</td>
					<td>
						<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(T_ShirtID).getT_ShirtPath_2() %>" onload="resizeimg(this,400,480);over4('<%=to.getNegPic() %>','<%=to.getNegLoc_1() %>','<%=to.getNegLoc_2() %>','<%=to.getNegSize() %>');">
						<div id="img2"></div>
					</td>
				</tr>
				<tr align="center">
					<td>上传者ID</td>
					<td><%=to.getUserID() %></td>
				</tr>
				<tr align="center">
					<td>文化衫名称</td>
					<td><%=to.getT_ShirtName() %></td>
				</tr>
				<tr>
					<th colspan="2" align="center">
						<input type="hidden" name="CustomID"  value=<%=CustomID%>>
						<input type="button" value="订购" onClick="orderAdd('<%=session.getAttribute("UserID") %>')">
					</th>
				</tr>
				<div id="new1" style="position:absolute; width:150px; height:150px; z-index:2; left: 685px; top: 160px;display:none;" class="dragme" onmousedown="selectmouse(this);"></div>
				<div id="new2" style="position:absolute; width:150px; height:150px; z-index:1; left: 685px; top: 160px;display:none;" class="dragme" onmousedown="selectmouse(this);"></div>
			</table>
		</td>
	</tr>
</table>
</form>
</div>
<script>
function orderAdd(str){
    if('null'==str){
    alert("要先登陆才能购买！");
    window.location.href='<%=request.getContextPath() %>/index.jsp';
    }else{
    document.checkform.action="FrontController.do?operation=ordersadd&method=addL";
	document.checkform.submit();
	}
}
</script>
</body>
</html>