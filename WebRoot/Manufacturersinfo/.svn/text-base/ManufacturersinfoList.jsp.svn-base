<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>厂商信息管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>厂商信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">选择</td>
	<td width="25%" align="center">厂商名称</td>
    <td width="15%" align="center">联系电话</td>
    <td width="35%" align="center">联系地址</td>
    <td width="15%" align="center">邮编</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ManufacturersinfoTo u = (ManufacturersinfoTo)it.next();

%>
<tr>
	<td width="10%" align="center"><input type=radio name="MF_ID" value="<%=u.getMF_ID()%>"></td>
	<td width="25%" align="center"><%=u.getMF_Name()%></td>
	<td width="15%" align="center"><%=u.getMF_Tel()%></td> 
	<td width="35%" align="center"><%=u.getMF_Add()%></td>
	<td width="15%" align="center"><%=u.getMF_Post()%></td>
</tr>
<%
}
%>
<tr><td><br></td></tr>
<tr>
	<%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>  
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	上页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=8>
<input type=button  value=" 查看 " onclick="show()" class="button">
<input type=button  value=" 修改 " onclick="edit()" class="button">
<input type=button  value=" 增加 " onclick="add()" class="button">
<input type=button  value=" 删除 " onclick="del()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=manufacturersinfoadd&method=addF";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.MF_ID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=manufacturersinfoquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.MF_ID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=manufacturersinfoquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.MF_ID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=manufacturersinfoquery&method=delete";
	document.form.submit();
}
</script>
</body>
</html>