<%@ page language="java" import="com.diyshirt.to.*,java.util.*"
   contentType="text/html; charset=gbk"  pageEncoding="gbk"%>
<jsp:useBean id="helper" class="com.diyshirt.view.ViewHelper" scope="application" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<html>
<head>

<title>DIY文化衫-首页</title>
</head>
<%
	List messagetourist = helper.getMessage(10,"0");
    List messageuser = helper.getMessage(10,"1");
%>
<body>
<%MessageTo to = (MessageTo)request.getAttribute("to");%>
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dddfff" border="0">
	<tr>
		<td><%@ include file="../top.jsp"%></td>
	</tr>
	<tr>
		<td width="20%">
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="1">
				<tr>
					<td rowspan=3>
					<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
					<tr>
                        <th align="center"><h1><%=to.getMesTitle()%></h1></th>  					
					</tr>
					<tr>
					    <td align="right">发布时间:<%=to.getFocTime()%></td>
					</tr>
					<tr>
					    <td align="right">截止时间:<%=to.getFaiTime()%></td>
					</tr>
					<tr>
                    <td  height=500 align="center">
                    <textarea name="mescontent" rows="30" cols="70"><%=to.getMesContent()%>
                    </textarea>
                    </td>   
                    </tr>
                    <tr>   
                        <td colspan="2" align="center">
                            <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
                        </td>
                    </tr>
                    <tr><td></td></tr> 
                    </table>		
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
</html>