<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>��������</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>�����б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
	<tr><td colspan=6>�������µ�����δ��8Сʱ�Ĳ��ܴ���</td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="5%" align="center">ѡ��</td>
	<td width="10%" align="center">����ID</td>
	<td width="10%" align="center">����״̬</td>
	<td width="20%" align="center">��ԱID</td>
    <td width="10%" align="center">��ƷID</td>
    <td width="10%" align="center">��С</td>
    <td width="10%" align="center">����</td>
    <td width="10%" align="center">�ܼ�</td>
    <td width="15%" align="center">�µ�ʱ��</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	OrdersTo u = (OrdersTo)it.next();

%>
<tr>
	<td width="5%" align="center"><input type=radio name="OrderID" value="<%=u.getOrderID()%>"></td>
	<td width="10%" align="center"><%=u.getOrderID()%></td>
	<td width="10%" align="center">
<% if(u.getBookStatus()==1) {%>
    	  �Ѵ���
<% }else{ %>
    	  δ����
<% } %>			
      </td>
	<td width="20%" align="center"><%=u.getUserID()%></td>
    <td width="10%" align="center"><%=u.getCustomID()%></td>
    <td width="10%" align="center"><%=u.getSize()%></td>
    <td width="10%" align="center"><%=u.getNumber()%></td>
    <td width="10%" align="center"><%=u.getAllPrice()%></td>
    <td width="15%" align="center"><%=u.getBookTime()%></td>
</tr>
<%
}
%>
<tr><td><br></td></tr>
<tr>
	<%if(mypage.getPageCount()==0) {%><td colspan=10 align="center">��ǰû�м�¼</td>
	<%}else {%>  
	<td colspan=6 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=10>
<input type=button  value=" �鿴 " onclick="show()" class="button">
<input type=button  value=" ���� " onclick="edit()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function edit(){
	if(!isChecked(document.form.OrderID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=treatment";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.OrderID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=show";
	document.form.submit();
}
</script>
</body>
</html>