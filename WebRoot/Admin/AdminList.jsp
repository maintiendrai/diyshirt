<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>����Ա����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>����Ա�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">ѡ��</td>
	<td width="45%" align="center">����ԱID</td>
	<td width="45%" align="center">����Ա����</td>
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
	<%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>  
	<td colspan=6 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='adminList.do?operation=adminlist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='adminList.do?operation=adminlist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" ���� " class="button" onclick="add()">
<!--<input type=button  value=" �鿴 " class="button" onclick="show()">-->
<input type=button  value=" ɾ�� " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<%
}else{
%>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
    <td align="center">Ȩ�޲���</td>
</tr>
<%} %>
<script>

function add(){
	document.form.action="FrontController.do?operation=adminadd&method=addL";
	document.form.submit();
}

function show(){
	if(!isChecked(document.form.AdminID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=adminquery&method=show";
	document.form.submit();
}

function del(){
	if(!isChecked(document.form.AdminID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=adminquery&method=delete";
	document.form.submit();
}

</script>
</body>
</html>