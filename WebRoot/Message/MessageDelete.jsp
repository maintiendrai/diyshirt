<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>信息管理</title>
</head>

<body>
<%MessageTo to = (MessageTo)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="FrontController.do?operation=messagedelete">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>删除信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <td><input type="hidden" name="MesID"  value="<%=to.getMesID()%>"></td>
    <tr>
      <td width="80">信息主题</td>
      <td width="131"><%=to.getMesTitle()%></td>
    </tr>
    <tr>
      <td>信息类型</td>
      <td><%   switch (to.getAuthority())
               {
               case 0:out.println("游客");break;
               case 1:out.println("会员");break;
               case 2:out.println("管理员");break;
                }%>
      </td>
    </tr>
    <tr>
      <td>发布时间</td>
      <td><%=to.getPubTime()%></td>
    </tr>
    <tr>
      <td>生效时间</td>
      <td><%=to.getFocTime()%></td>
    </tr>
     <tr>
      <td>失效时间</td>
      <td><%=to.getFaiTime()%></td>
    </tr>
    <tr>
      <td>信息内容</td>
      <td><textarea name="mescontent" rows="20" cols="50"><%=to.getMesContent()%></textarea></td>   
    </tr> 
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>   
      <td colspan="2">
        <input type="submit" name="Submit" value=" 确认删除 " class="button"/>
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
