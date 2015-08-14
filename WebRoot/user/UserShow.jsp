<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>会员管理</title>
</head>
 
  <body>
   <% MemberinfoTo to = (MemberinfoTo)request.getAttribute("to");%>
   <form id="form" name="form" method="post" action="">
   <div id="contentborder" align="center">
   <table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>会员详细信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">会员ID</td>
      <td><%=to.getUserID()%></td>
    </tr>
    <tr>
      <td>状态</td>
      <td>
<% if(to.getStatus()==0) {%>
    	  正常
<% }else{ %>
    	  冻结
<% } %>			
      </td>
    </tr>
    <tr>
      <td>昵称</td>
      <td><%=to.getNickName()%></td>
    </tr>
    <tr>
      <td>性别</td>
      <td><%if(to.getSex()==0) out.println("男");
			else out.println("女");
		  %>
	  </td>     
    </tr>
    <tr>
      <td>年龄</td>
      <td><%=to.getAge() %></td>
    </tr>
    <tr>
      <td>固定电话</td>
      <td><%=to.getTelephone()%></td>
    </tr>
    <tr>
      <td>移动电话</td>
      <td><%=to.getMobilephone()%></td>
    </tr>
    <tr>
      <td>地址</td>
      <td><%=to.getAddress()%></td>
    </tr>
    <tr>
      <td>邮政编码</td>
      <td><%=to.getPost()%></td>
    </tr>
    <tr>
      <td>QQ</td>
      <td><%=to.getQQ()%></td>
    </tr>
<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html> 