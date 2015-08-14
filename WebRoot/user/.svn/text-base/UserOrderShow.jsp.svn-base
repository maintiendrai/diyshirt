<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户个人资料管理</title>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<style type="text/css"></style>
</head>
<%MemberinfoTo user = (MemberinfoTo)session.getAttribute("User");%>
<%OrdersTo to = (OrdersTo)request.getAttribute("to");%>
<body>
<form id="form" name="checkform" method="post" action="">
<input type="hidden" name="OrderID"  value="<%=to.getOrderID()%>"/>
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	
	<%
		if(user!=null){
	%>
   <tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" width="55%" bgcolor="#dffdff" border="0">
							<tr>
								<td><a href="UserControl.jsp">查看用户资料<p></a></td>
							</tr>
							<tr>
								<td><a href="UserEdit.jsp">修改用户资料<p></a></td>
							</tr>
							<tr>
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">查看上传图片<p></a></td>
							</tr>
							<tr>
								<td><a href="picfavlist.do?operation=picfavlist&pageNum=1">查看收藏图片<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtfavlist.do?operation=shirtfavlist&pageNum=1">查看收藏文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtusercustomlist.do?operation=shirtusercustomlist&pageNum=1">查看定制文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">查看订单</a></td>
							</tr>
						</table>
					</td>
					<td>
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
                            <tr>
                                <td>
                                <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
                                </td>
                            </tr>
                         </table>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<%
		}else{
	%>
	<tr>
		<td align="center"><h1>请先登录!</h1></td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="btn2" value="返回" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
	</tr>
	<%
		}
	%>
</table>
</div>
</form>
</body>
</html>