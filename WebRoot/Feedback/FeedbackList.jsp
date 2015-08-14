<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>积分管理</title>
</head>
<body>
<%

Page feedbackpage = (Page) request.getAttribute("feedbackpage");
List data = feedbackpage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>积分列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="30%">会员账号</td>
	<td width="30%">积分</td>
	<td width="30%">信用度</td>
	
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	FeedbackTo u = (FeedbackTo)it.next();
%>
<tr>
	<td width="10%"><input type=radio name="UserID" value="<%=u.getUserID()%>"></td>
	<td width="30%"><%=u.getUserID()%></td>
	<td width="30%"><%=u.getIntegral()%></td>
	<td width="30%"><%=u.getFeedback()%></td>
	
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
	<%if(feedbackpage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>  
	<td colspan=6 align="center">第 <%=feedbackpage.getPageNum() %>/<%=feedbackpage.getPageCount() %> 页  共 <%=feedbackpage.getRecordNum() %>条记录  
	<%if(feedbackpage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='feedbackList.do?operation=feedbacklist&pageNum=1&pageLength=<%=feedbackpage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='feedbackList.do?operation=feedbacklist&pageNum=<%=feedbackpage.getPageNum()-1 %>&pageLength=<%=feedbackpage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(feedbackpage.getPageNum()==feedbackpage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='feedbackList.do?operation=feedbacklist&pageNum=<%=feedbackpage.getPageNum()+1 %>&pageLength=<%=feedbackpage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='feedbackList.do?operation=feedbacklist&pageNum=<%=feedbackpage.getPageCount() %>&pageLength=<%=feedbackpage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" 修改 " class="button" onclick="edit()">
</td></tr>
</table> 
</form>
<script>
function edit(){
	if(!isChecked(document.form.UserID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=feedbackedit&method=editF";
	document.form.submit();
}
</script>
</body>
</html>