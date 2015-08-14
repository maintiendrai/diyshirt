<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>订单管理</title>
</head>

<body>
<%OrdersTo to = (OrdersTo)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="FrontController.do?operation=manufacturersinfolist&pageNum=1&method=change">
<input type="hidden" name="OrderID"  value="<%=to.getOrderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>订单详细信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">订单ID</td>
      <td><%=to.getOrderID()%></td>
    </tr>
    <tr>
      <td>订单状态</td>
      <td>
<% if(to.getBookStatus()==1) {%>
    	  已处理
<% }else{ %>
    	  未处理
<% } %>			
      </td>
    </tr>
    <tr>
      <td>成品ID</td>
      <td><%=to.getCustomID()%></td>
    </tr>
    <tr>
      <td>数量</td>
      <td><%=to.getNumber()%></td>     
    </tr>
    <tr>
      <td>会员ID</td>
      <td><%=to.getUserID()%></td>
    </tr>
    <tr>
      <td>总价</td>
      <td><%=to.getAllPrice()%></td>
    </tr>
    <tr>
      <td>下单时间</td>
      <td><%=to.getBookTime()%></td>
    </tr>
<hr>
      <td>接单厂商</td>
      <td><%=to.getMF_Name()%></td>
<tr><td><br></td></tr>
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 选择厂商 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="javascript:window.location='/diyshirt/Admin/orders.do?operation=orderslist&pageNum=1&method=admin'">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html> 