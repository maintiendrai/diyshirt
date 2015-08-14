<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>信息管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">选择</td>
	<td width="20%" align="center">信息主题</td>
	<td width="18%" align="center">发布时间</td>
	<td width="18%" align="center">生效时间</td>
	<td width="18%" align="center">失效时间</td>
	<td width="16%" align="center">浏览权限</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MessageTo u = (MessageTo)it.next();
%>
<tr>
	<td width="10%" align="center"><input type=radio name="MesID" value="<%=u.getMesID()%>"></td>
	<td width="20%" align="center"><%=u.getMesTitle()%></td>
	<td width="18%" align="center"><%=u.getPubTime()%></td>
	<td width="18%" align="center"><%=u.getFocTime()%></td>
    <td width="18%" align="center"><%=u.getFaiTime()%></td>
    <td width="16%" align="center"><%   switch (u.getAuthority())
                            {
                               case 0:out.println("游客");break;
                               case 1:out.println("会员");break;
                               case 2:out.println("管理员");break;
                            }%>
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
	<a href='messageList.do?operation=messagelist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='messageList.do?operation=messagelist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=10>
<input type=button  value=" 增加 " class="button" onclick="add()">
<input type=button  value=" 修改 " class="button" onclick="edit()">
<input type=button  value=" 查看 " class="button" onclick="show()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>

function add(){
	document.form.action="FrontController.do?operation=messageadd&method=addAdmin";
	document.form.submit();
}

function edit(){
	if(!isChecked(document.form.MesID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messagequery&method=edit";
	document.form.submit();
}

function show(){
	if(!isChecked(document.form.MesID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messagequery&method=show";
	document.form.submit();
}

function del(){
	if(!isChecked(document.form.MesID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messagequery&method=delete";
	document.form.submit();
}

</script>
</body>
</html>