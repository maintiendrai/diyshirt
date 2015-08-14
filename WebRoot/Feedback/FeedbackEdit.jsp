<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>积分信用度管理</title>
</head>

<body>
<%FeedbackTo to = (FeedbackTo)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="FrontController.do?operation=feedbackedit&method=edit">
<input type="hidden" name="UserID"  value="<%=to.getUserID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改积分</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="80">会员帐号</td>
      <td><input type="hidden" name="UserID" value="<%=to.getUserID()%>"/>
          <%=to.getUserID()%>
      </td>
    </tr>
    <tr>
      <td>信用度</td>
      <td><input type="text" name="feedback" value="<%=to.getFeedback()%>"/></td>
    </tr>
    <tr>
      <td>积分</td>
      <td><input type="text" name="integral" value="<%=to.getIntegral()%>"/></td>
    </tr>
<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>