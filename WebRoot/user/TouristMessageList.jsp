<%@ page language="java" import="com.diyshirt.to.*,java.util.*"
   contentType="text/html; charset=gbk"  pageEncoding="gbk"%>
<jsp:useBean id="helper" class="com.diyshirt.view.ViewHelper" scope="application" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>DIY文化衫-首页</title>
</head>

<%
    Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
%>
<body>
<div id="contentborder" align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dddfff" border="0">
	<tr>
		<td><%@ include file="../top.jsp"%></td>
	</tr>
	<tr>
	    <td>
	    	<table border=0 cellspacing=0 cellpadding=0 width="100%" class="small" bgcolor="#dffdff">
            <tr><td><br></td></tr>
            <tr> 
	        	<td colspan=6 class="newline"></td>
	        </tr>
	        <tr> 
		        <td colspan="2"  class="dvInnerHeader"><b>信息列表</b></td>
	        	<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	        </tr>
	        <tr><td><br></td></tr>
            </table>
            <table border=0 cellspacing=0 cellpadding=0 width="100%" class="small" bgcolor="#dffdff">
            <tr>
	            <td>信息主题</td>
	            <td>发布时间</td>
	            <td>截止时间</td>
	            <td>浏览权限</td>
            </tr>
        <%

        Iterator it = data.iterator();

        while(it.hasNext()){
            	MessageTo u = (MessageTo)it.next();
        %>
            <tr>
            <input type=hidden name="MesID" value="<%=u.getMesID()%>">
        	    <td><a href="FrontController.do?operation=messagequery&method=user&MesID=<%=u.getMesID()%>"><%=u.getMesTitle()%></a></td>
                <td><%=u.getFocTime()%></td>
                <td><%=u.getFaiTime()%></td>
                <td><%   switch (u.getAuthority())
                            {
                               case 0:out.println("游客");break;
                               case 1:out.println("会员");break;
                               case 2:out.println("管理员");break;
                            }%>
                </td> 
            </tr>
        <%
        }
         %>
            <tr><td></td></tr>
            <tr>
	        <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	        <%}else {%>  
	            <td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	        <%if(mypage.getPageNum()==1) {
	        %>
	        首页&nbsp;&nbsp;
	        上页&nbsp;&nbsp;
        	<%
            	}else{
	        %>
	        <a href='messageList.do?operation=messagelist&pageNum=1&method=tourist&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	        <a href='messageList.do?operation=messagelist&method=tourist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	        <%
	        }%>
	
	 
	
        	<%if(mypage.getPageNum()==mypage.getPageCount()) {
            %>
        	下页&nbsp;&nbsp;
        	末页&nbsp;&nbsp;
        	<%
            	}else{
                    	%>
        	<a href='messageList.do?operation=messagelist&method=tourist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	        <a href='messageList.do?operation=messagelist&method=tourist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	        <%
	        }}
	        %> 
	          </td>
            </tr>
</table>
</body>
</html>