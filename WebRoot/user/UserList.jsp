<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>��Ա��Ϣ����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>��Ա��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%" align="center">ѡ��</td>
	<td width="40%" align="center">��ԱID</td>
    <td width="20%" align="center">�ǳ�</td>
    <td width="10%" align="center">�Ա�</td>
    <td width="10%" align="center">����</td>
    <td width="10%" align="center">״̬</td>
    
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
	      <%if(u.getSex()==0) out.println("��");
			else out.println("Ů");
		  %></td>
	<td width="10%" align="center"><%=u.getAge()%></td>
	<td width="10%" align="center">
                       <% if(u.getStatus()==0) {%>
    	                  ����
                       <% }else{ %>
    	                  ����
                       <% } %>			
                       </td>
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
	<a href='userlist.do?operation=userlist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='userlist.do?operation=userlist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" �鿴 " onclick="show()" class="button">
<input type=button  value=" ״̬�޸� " onclick="edit()" class="button">
<input type=button  value=" ɾ�� " onclick="del()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function edit(){
	if(!isChecked(document.form.UserID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=freeze";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.UserID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.UserID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=userquery&method=delete";
	document.form.submit();
}
</script>
</body>
</html>