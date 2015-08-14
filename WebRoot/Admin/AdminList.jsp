<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>管理员管理</title>
</head>
<body>
<%
AdministratorinfoTo Admin = (AdministratorinfoTo)session.getAttribute("Admin");
Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
%>
<%
if(Admin.getAuthority()==1){
%>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>管理员列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">选择</td>
	<td width="45%" align="center">管理员ID</td>
	<td width="45%" align="center">管理员名称</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	AdministratorinfoTo u = (AdministratorinfoTo)it.next();
%>
<tr>
	<td width="10%" align="center"><input type=radio name="AdminID" value="<%=u.getAdminID()%>"></td>
	<td width="45%" align="center"><%=u.getAdminID()%></td>
	<td width="45%" align="center"><%=u.getAdminAccount()%></td>
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
	<a href='adminList.do?operation=adminlist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" 增加 " class="button" onclick="add()">
<!--<input type=button  value=" 查看 " class="button" onclick="show()">-->
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<%
}else{
%>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
    <td align="center">权限不足</td>
</tr>
<%} %>
<script>

function add(){
	document.form.action="FrontController.do?operation=adminadd&method=addL";
	document.form.submit();
}

function show(){
	if(!isChecked(document.form.AdminID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=adminquery&method=show";
	document.form.submit();
}

function del(){
	if(!isChecked(document.form.AdminID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=adminquery&method=delete";
	document.form.submit();
}

</script>
</body>
</html>