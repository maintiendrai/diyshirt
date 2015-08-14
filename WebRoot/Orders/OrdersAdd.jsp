<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*,com.diyshirt.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>订购</title>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<style type="text/css"></style>
</head>
<script>
function jscheckform(checkform){

  if(document.checkform.Number.value==""){
    alert("请输入文化衫数量");
    document.checkform.Number.focus();
    return false;
  }
}  
</script>
<% 
  MemberinfoTo user = (MemberinfoTo)session.getAttribute("User");
  T_ShirtCustomTo to = (T_ShirtCustomTo)request.getAttribute("to");
  int T_ShirtID = to.getT_ShirtID();
  T_shirtTo shirt = ShirtManager.getInstance().shirtinfo(T_ShirtID);
%>
<body>
<form id="form" name="checkform" method="post" action="FrontController.do?operation=ordersadd&method=add" onSubmit="return jscheckform(checkform)">
<input type="hidden" name="UserID"  value="<%=user.getUserID()%>">
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
								<td><a href="">查看收藏图片<p></a></td>
							</tr>
							<tr>
								<td><a href="">查看收藏文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="">查看定制文化衫<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">查看订单</a></td>
								<input type="hidden" name="pageNum" value="1">
							</tr>
						</table>
					</td>
					<td><%if(shirt.getStatus()==0){ %>
						<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" height="20" border="0">
						   <!-- <tr align="center">
								<td>
								<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(T_ShirtID).getT_ShirtPath_1() %>" onload="resizeimg(this,400,480);over('<%=to.getPosPic() %>');">
								</td>
								<td>
								<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(T_ShirtID).getT_ShirtPath_2() %>" onload="resizeimg(this,400,480);over2('<%=to.getNegPic() %>');">
								</td>
				            </tr>  -->
							<tr>
						 		<td width="40%" align="right">文化衫名称:</td>
								<td width="60%" align="left"><%=to.getT_ShirtName()%></td>
								<input type="hidden" name="CustomID" value=<%=to.getCustomID()%>>
								<input type="hidden" name="T_ShirtID" value=<%=to.getT_ShirtID()%>>
							</tr>
							<tr>
							    <td width="40%" align="right">文化衫大小:</td>
							    <td width="60%" align="left">
							    <select name=size>
     							       <option>160
        							   <option>165
        							   <option>170
        							   <option>175
        							   <option>180
        							   <option>185
        							   <option>190
        							   <option>195
                                </select>
                                </td>
							</tr>
							<tr>
							 	<td width="40%" align="right">文化衫数量:</td>
								<td width="60%" align="left"><input type="text" name="Number" value=""></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit" name="sub" value="确认新增">
										<input type="button" name="btn" value="取消" onClick="javascript:window.location='/diyshirt/user/orderslist.do?operation=orderslist&pageNum=1&method=user'"/>
								</td>
							</tr>
						</table>
						<%}else{ %>
						<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" height="20" border="0">
						<tr>
						    <td align="center"><h3>断货</h3></td>
						</tr>
						</table>
						<%} %>
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