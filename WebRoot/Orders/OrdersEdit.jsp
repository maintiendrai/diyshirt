<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*,com.diyshirt.model.ShirtManager" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>�û��������Ϲ���</title>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<style type="text/css"></style>
</head>
<script>
function jscheckform(checkform){

  if(document.checkform.CustomID.value==""){
    alert("�������ƷID");
    document.checkform.T_ShirtID.focus();
    return false;
  }

  if(document.checkform.Number.value==""){
    alert("�������Ļ�������");
    document.checkform.Number.focus();
    return false;
  }
}  
</script>
<%
MemberinfoTo user = (MemberinfoTo)session.getAttribute("User");
OrdersTo to = (OrdersTo)request.getAttribute("to");
T_ShirtCustomTo cto = (T_ShirtCustomTo)request.getAttribute("cto");
%>
<body>
<form id="form" name="checkform" method="post" action="FrontController.do?operation=ordersedit&method=edit" onSubmit="return jscheckform(checkform)">
<input type="hidden" name="UserID"  value="<%=user.getUserID()%>"/>
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
								<td><a href="UserControl.jsp">�鿴�û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="UserEdit.jsp">�޸��û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">�鿴�ϴ�ͼƬ<p></a></td>
							</tr>
							<tr>
								<td><a href="">�鿴�ղ�ͼƬ<p></a></td>
							</tr>
							<tr>
								<td><a href="">�鿴�ղ��Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="">�鿴�����Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">�鿴����</a></td>
								<input type="hidden" name="pageNum" value="1">
							</tr>
						</table>
					</td>
					<td>
						<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" height="20" border="0">
							<tr align="center">
								<td>
								<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(cto.getT_ShirtID()).getT_ShirtPath_1() %>" onload="resizeimg(this,400,480);over('<%=cto.getPosPic() %>');">
								</td>
								<td>
								<img src="<%=request.getContextPath() %><%=ShirtManager.getInstance().shirtinfo(cto.getT_ShirtID()).getT_ShirtPath_2() %>" onload="resizeimg(this,400,480);over2('<%=cto.getNegPic() %>');">
								</td>
				            </tr>
							<tr>
						 		<td width="40%" align="right">�Ļ�������:</td>
								<td width="60%" align="left"><%=cto.getT_ShirtName()%></td>
								<td> <input type="hidden" name="CustomID" value=<%=cto.getT_ShirtName() %> > </td>
							</tr>
							<tr>
							    <td width="40%" align="right">�Ļ�����С:</td>
							    <td width="60%" align="left">
							    <select name=size>
     							       <option>160-165
        							   <option>165-170
        							   <option>170-175
        							   <option>175-180
        							   <option>180-185
        							   <option>185-190
        							   <option>190-195
        							   <option>195-200
                                </select>
                                </td>
							</tr>
							<tr>
							 	<td width="40%" align="right">�Ļ�������:</td>
								<td width="60%" align="left"><input type="text" name="Number" value=""></td>
							</tr>
							<tr>
								<td align="center" colspan="2"><input type="submit" name="sub" value="ȷ���޸�">
								<input type="button" name="btn" value="ȡ��" onClick="javascript:window.location='/diyshirt/user/orderslist.do?operation=orderslist&pageNum=1&method=user'"/>
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
		<td align="center"><h1>���ȵ�¼!</h1></td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="btn2" value="����" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
	</tr>
	<%
		}
	%>
</table>
</div>
</form>
</body>
</html>