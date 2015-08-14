<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>会员信息管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>会员信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">选择</td>
	<td width="40%" align="center">会员ID</td>
    <td width="20%" align="center">昵称</td>
    <td width="10%" align="center">性别</td>
    <td width="10%" align="center">年龄</td>
    <td width="10%" align="center">状态</td>
    
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MemberinfoTo u = (MemberinfoTo)it.next();

%>
<tr>
	<td width="10%" align="center"><input type=radio name="UserID" value="<%=u.getUserID()%>"></td>
	<td width="40%" align="center"><%=u.getUserID()%></td>
	<td width="20%" align="center"><%=u.getNickName()%></td> 
	<td width="10%" align="center">
	      <%if(u.getSex()==0) out.println("男");
			else out.println("女");
		  %></td>
	<td width="10%" align="center"><%=u.getAge()%></td>
	<td width="10%" align="center">
                       <% if(u.getStatus()==0) {%>
    	                  正常
                       <% }else{ %>
    	                  冻结
                       <% } %>			
                       </td>
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
	<a href='userlist.do?operation=userlist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	上页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" 查看 " onclick="show()" class="button">
<input type=button  value=" 状态修改 " onclick="edit()" class="button">
<input type=button  value=" 删除 " onclick="del()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function edit(){
	if(!isChecked(document.form.UserID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=freeze";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.UserID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.UserID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=delete";
	document.form.submit();
}
</script>
</body>
</html>