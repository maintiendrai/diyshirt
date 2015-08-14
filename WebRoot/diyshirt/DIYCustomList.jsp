<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*,com.diyshirt.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript" src='<%=request.getContextPath() %>/js/common.js'></script>
<title>用户定制文化衫列表</title>
<script>
function act(a,b){
	document.checkform.action="/diyshirt/diyshirt/DIYShirtInfor.jsp?T_ShirtID="+a+"&CustomID="+b;
	document.checkform.submit();
}
</script>
</head>
<% 
	Page mypage = (Page)request.getAttribute("page");
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
				<tr align="center">
					<td>文化衫名称</td>
					<td>正面图片</td>
					<td>反面图片</td>
					<td>定制者ID</td>
					<td></td>
				</tr>
				<%
					Iterator it = data.iterator();
					while(it.hasNext()){
						T_ShirtCustomTo to = (T_ShirtCustomTo)it.next();
						String T_ShirtPath_1 = ShirtManager.getInstance().shirtinfo(to.getT_ShirtID()).getT_ShirtPath_1();
						String pic = to.getPosPic();
						String T_ShirtName = to.getT_ShirtName();
						
				%>
				<tr align="center">
					<td><%=to.getT_ShirtName() %></td>
					<td>
					<%
						if(!to.getPosPic().equals("undefined")){
					%>
							<img src="<%=request.getContextPath() %>/upload/<%=to.getPosPic() %>" onload="resizeimg(this,150,150);">
					<%
						}else{
					%>
							无
					<%
						}
					%>
					</td>
					<td>
					<%
						if(!to.getNegPic().equals("undefined")){
					%>
							<img src="<%=request.getContextPath() %>/upload/<%=to.getNegPic() %>" onload="resizeimg(this,150,150);">
					<%
						}else{
							out.println("无");
						}
					%>
					</td>
					<td><%=to.getUserID() %></td>
					<td><input type="button" name="btn" value="查看详细" onClick="act('<%=to.getT_ShirtID() %>','<%=to.getCustomID() %>');"></td>
				</tr>
				
				<%
					}
				%>
			</table>
		</td>
	</tr>
	<tr>
	<td colspan=5 align=center >第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DIYCustomList.do?operation=diyshirtcustomlistall&pageNum=1'>首页</a>&nbsp;&nbsp;
	<a href='DIYCustomList.do?operation=diyshirtcustomlistall&pageNum=<%=mypage.getPageNum()-1 %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DIYCustomList.do?operation=diyshirtcustomlistall&pageNum=<%=mypage.getPageNum()+1 %>'>下页</a>&nbsp;&nbsp;
	<a href='DIYCustomList.do?operation=diyshirtcustomlistall&pageNum=<%=mypage.getPageCount() %>'>末页</a>
	<%
	}%> 
	
	</td>
	</tr>
</table>
</form>
</div>
</body>
</html>