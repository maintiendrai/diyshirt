<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>订单管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>订单列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
	<tr><td colspan=6>订单从下单至此未过8小时的不能处理</td></tr>
</table>
<table border=1 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="5%" align="center">选择</td>
	<td width="10%" align="center">订单ID</td>
	<td width="10%" align="center">订单状态</td>
	<td width="20%" align="center">会员ID</td>
    <td width="10%" align="center">成品ID</td>
    <td width="10%" align="center">大小</td>
    <td width="10%" align="center">数量</td>
    <td width="10%" align="center">总价</td>
    <td width="15%" align="center">下单时间</td>
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
    	  已处理
<% }else{ %>
    	  未处理
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
	<%if(mypage.getPageCount()==0) {%><td colspan=10 align="center">当前没有记录</td>
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
	下页&nbsp;&nbsp;
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
<tr><td colspan=10>
<input type=button  value=" 查看 " onclick="show()" class="button">
<input type=button  value=" 处理 " onclick="edit()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function edit(){
	if(!isChecked(document.form.OrderID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=treatment";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.OrderID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=show";
	document.form.submit();
}
</script>
</body>
</html>