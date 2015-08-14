<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>会员个人资料管理</title>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
		<style type="text/css"></style>
		<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
		<link rel="stylesheet" type="text/css" href="../Admin/table.css">
	</head>
	<script>
function add(){
	document.form.action="FrontController.do?operation=ordersadd&method=addL";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.OrderID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersedit&method=editUOL";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.OrderID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=showuser";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.OrderID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=ordersquery&method=delete";
	document.form.submit();
}
</script>
	<%
	MemberinfoTo user = (MemberinfoTo) session.getAttribute("User");
	%>
	<body>
		<%
			Page mypage = (Page) request.getAttribute("mypage");
			List data = mypage.getData();
		%>
		<form name="form" action="" method=post>
			<div id="contentborder" align="center">
				<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff"
					border="0">
					<tr>
						<td>
							<%@ include file="/top.jsp"%>
						</td>
					</tr>
					<%
					if (user != null) {
					%>
					<tr>
						<td>
							<br>
							<br>
						</td>
					</tr>
					<tr>
						<td>
							<table cellSpacing="0" cellPadding="0" width="100%"
								bgcolor="#dffdff" border="0">
								<tr>
									<td>
										<table cellSpacing="0" cellPadding="0" width="55%"
											bgcolor="#dffdff" border="0">
											<tr>
												<td>
													<a href="UserControl.jsp">查看用户资料
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="UserEdit.jsp">修改用户资料
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="picturelist.do?operation=picturelist&pageNum=1">查看上传图片
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="picfavlist.do?operation=picfavlist&pageNum=1">查看收藏图片
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a href="shirtfavlist.do?operation=shirtfavlist&pageNum=1">查看收藏文化衫
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a
														href="shirtusercustomlist.do?operation=shirtusercustomlist&pageNum=1">查看定制文化衫
														<p>
													</a>
												</td>
											</tr>
											<tr>
												<td>
													<a
														href="orderslist.do?operation=orderslist&pageNum=1&method=user">查看订单</a>
												</td>
											</tr>
										</table>
									</td>
									<td>
										<table border=0 cellspacing=0 cellpadding=0 width="98%"
											class="small">
											<tr>
												<td>
													<br>
												</td>
											</tr>
											<tr>
												<td colspan=6 class="newline"></td>
											</tr>
											<tr>
												<td colspan="2" class="dvInnerHeader">
													<b>订单列表</b>
												</td>
												<td colspan="4" align="right" class="dvInnerHeader">
													&nbsp;
												</td>
											</tr>
											<tr>
												<td>
													<br>
												</td>
											</tr>
										</table>
										<table border=1 cellspacing=0 cellpadding=0 width="98%"
											class="small">
											<tr>
												<td width="5%" align="center">
													选择
												</td>
												<td width="10%" align="center">
													订单ID
												</td>
												<td width="10%" align="center">
													订单状态
												</td>
												<td width="20%" align="center">
													会员ID
												</td>
												<td width="10%" align="center">
													成品ID
												</td>
												<td width="10%" align="center">
													大小
												</td>
												<td width="10%" align="center">
													数量
												</td>
												<td width="10%" align="center">
													总价
												</td>
												<td width="15%" align="center">
													下单时间
												</td>
											</tr>
											<%
													Iterator it = data.iterator();

													while (it.hasNext()) {
														OrdersTo u = (OrdersTo) it.next();
											%>
											<tr>
												<td width="5%" align="center">
													<input type=radio name="OrderID"
														value="<%=u.getOrderID()%>">
												</td>
												<td width="10%" align="center">
													<%=u.getOrderID()%>
												</td>
												<td width="10%" align="center">
													<%
													if (u.getBookStatus() == 1) {
													%>
													已处理
													<%
													} else {
													%>
													未处理
													<%
													}
													%>
												</td>
												<td width="20%" align="center">
													<%=u.getUserID()%>
												</td>
												<input type="hidden" name="UserID"
													value="<%=u.getUserID()%>" />
												<td width="10%" align="center">
													<%=u.getCustomID()%>
												</td>
												<td width="10%" align="center">
													<%=u.getSize()%>
												</td>
												<td width="10%" align="center">
													<%=u.getNumber()%>
												</td>
												<td width="10%" align="center">
													<%=u.getAllPrice()%>
												</td>
												<td width="15%" align="center">
													<%=u.getBookTime()%>
												</td>
											</tr>
											<%
											}
											%>
											<tr>
												<td>
													<br>
												</td>
											</tr>
											<tr>
												<%
												if (mypage.getPageCount() == 0) {
												%>
												<td colspan=6 align="center">
													当前没有记录
												</td>
												<%
												} else {
												%>
												<td colspan=6 align="center">
													第
													<%=mypage.getPageNum()%>
													/
													<%=mypage.getPageCount()%>
													页 共
													<%=mypage.getRecordNum()%>
													条记录
													<%
												if (mypage.getPageNum() == 1) {
												%>
													首页&nbsp;&nbsp; 上页&nbsp;&nbsp;
													<%
													} else {
													%>
													<a
														href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=1&pageLength=<%=mypage.getPageLength()%>'>首页</a>&nbsp;&nbsp;
													<a
														href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum() - 1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
													<%
													}
													%>



													<%
													if (mypage.getPageNum() == mypage.getPageCount()) {
													%>
													下页&nbsp;&nbsp; 末页&nbsp;&nbsp;
													<%
													} else {
													%>
													<a
														href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageNum() + 1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
													<a
														href='manufacturersinfoList.do?operation=manufacturersinfolist&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
													<%
															}
															}
													%>

												</td>
											</tr>
											<tr>
												<td colspan=10>
													<input type=button value=" 查看 " onclick="show()"
														class="button">
													<input type=button value=" 修改 " onclick="edit()"
														class="button">
													<!--<input type=button  value=" 新增 " onclick="add()" class="button">-->
													<input type=button value=" 撤消 " onclick="del()"
														class="button">
												</td>
											</tr>
										</table>
									<font> 温馨提示：订单在新增或修改后8小时将不能修改和撤消订单 </font>
					<%
					} else {
					%>
					<tr>
						<td align="center">
							<h1>
								请先登录!
							</h1>
						</td>
					</tr>
					<tr>
						<td align="center">
							<input type="button" name="btn2" value="返回"
								onClick="javascript:window.location='/diyshirt/index.jsp'">
						</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</form>
	</body>
</html>
