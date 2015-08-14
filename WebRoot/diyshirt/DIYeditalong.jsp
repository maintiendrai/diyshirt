<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.model.*,com.diyshirt.to.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript" src='<%=request.getContextPath() %>/js/common.js'></script>
<title>文化衫编辑</title>
<script>
function act(){
	var CateID;
	for(var i=0;i<document.checkform.CateID.length;i++){
		if(document.checkform.CateID[i].selected==true){
			CateID=document.checkform.CateID[i].value;
			break;
		}
	}
	document.checkform.action="shirteditalong.do?operation=shirteditalong&CateID="+CateID;
	document.checkform.submit();
}

function act2(){
	document.checkform.action="shirtedit.do?operation=shirtedit&pageNum=1";
	document.checkform.submit();
}
</script>
</head>
<%
	int T_ShirtID = Integer.parseInt((String)request.getParameter("T_ShirtID"));
	T_shirtTo to = ShirtManager.getInstance().shirtinfo(T_ShirtID);
%>
<body>
<div align="center">
<form name="checkform" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">

	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr align="center">
					<td>
						<img src="/diyshirt<%=to.getT_ShirtPath_1() %>" onload="resizeimg(this,400,480);">
					</td>
					<td>
						<img src="/diyshirt<%=to.getT_ShirtPath_2() %>" onload="resizeimg(this,400,480);">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr align="center">
		<td>文化衫名称:<input type="text" name="ShirtName" value="<%=to.getShirtName() %>"></td>
	</tr>
	<tr align="center">
		<td>文化衫类别：<select name="CateID">
							<option value="0" <% if(to.getCateID()==0){ %>selected<%} %> >0</option>
							<option value="1" <% if(to.getCateID()==1){ %>selected<%} %> >1</option>
							<option value="2" <% if(to.getCateID()==2){ %>selected<%} %> >2</option>
							<option value="3" <% if(to.getCateID()==3){ %>selected<%} %> >3</option>
							<option value="4" <% if(to.getCateID()==4){ %>selected<%} %> >4</option>
							<option value="5" <% if(to.getCateID()==5){ %>selected<%} %> >5</option>
						</select>
		</td>
	</tr>
	<% short i=0,j=1; %>
	<tr align="center">
		<td>性别:<input type="radio" name="Sex" value="0" <%if(to.getSex()==i){ %>checked<%} %>>男
				<input type="radio" name="Sex" value="1" <%if(to.getSex()==j){ %>checked<%} %>>女
		</td>
	</tr>
	<tr align="center">
		<td>价格:<input type="text" name="Price" value="<%=to.getPrice() %>"></td>
	</tr>
	<tr align="center">
		<td>简介：<textarea name="Intro" rows="6" cols="45"><%=to.getIntro() %></textarea></td>
	</tr>
	<tr align="center">
		<td>
			<input type="button" name="btn" value="确认修改" onClick="act();"><input type="button" name="btn2" value="取消" onClick="act2();">
			<input type="hidden" name="T_ShirtID" value="<%=T_ShirtID %>">
		</td>
	</tr>
</table>
</form>
</div>
<script>

</script>
</body>
</html>