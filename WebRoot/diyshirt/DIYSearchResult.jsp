<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>�Ļ����������</title>
</head>
<% 
	Page mypage = (Page)request.getAttribute("mypage");
	List data = mypage.getData();
%>
<body>
<div align="center">
<form name="checkform" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<%
					Iterator it = data.iterator();
					while(it.hasNext()){ %>
				<tr>
				<% 	
						for(int i=0;i<2&&it.hasNext();i++){
						T_shirtTo to = (T_shirtTo)it.next();
				%>  <td>
				    <table>
				    <tr>
					<td>
					 	<img src='<%=request.getContextPath() %><%=to.getT_ShirtPath_1() %>' onload="javascript:resizeimg(this,200,200)">
					</td>
					</tr>
					<tr>
				     <td>
					 	<%=to.getShirtName() %>
					 </td>
					 </tr>
					 <tr>
					 <td>
					 	<input type="button" name="btn" value="ȥ����" onClick="act('<%=to.getT_ShirtPath_1() %>','<%=to.getT_ShirtPath_2() %>','<%=to.getT_ShirtID() %>');">
					 </td>
				     </tr>
				     </table>
				     </td>
				<%
						}%>
				</tr>
						<%
					}
				%>
			</table>
		</td>
	</tr>
	<tr>
	<td colspan=8 align=center>�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DiySearchResult.do?operation=diysearch&pageNum=1&ShirtName=<%=request.getAttribute("ShirtName") %>&CateID=<%=request.getAttribute("CateID") %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='DiySearchResult.do?operation=diysearch&&pageNum=<%=mypage.getPageNum()-1 %>&ShirtName=<%=request.getAttribute("ShirtName") %>&CateID=<%=request.getAttribute("CateID") %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DiySearchResult.do?operation=diysearch&&pageNum=<%=mypage.getPageNum()+1 %>&ShirtName=<%=request.getAttribute("ShirtName") %>&CateID=<%=request.getAttribute("CateID") %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='DiySearchResult.do?operation=diysearch&&pageNum=<%=mypage.getPageCount() %>&ShirtName=<%=request.getAttribute("ShirtName") %>&CateID=<%=request.getAttribute("CateID") %>'>ĩҳ</a>
	<%
	}%> 
	
	</td>
	</tr>
</table>
</form>
</div>
</body>
</html>