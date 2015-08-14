<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<script src="../js/datepicker/WdatePicker.js"></script>
<title>信息管理</title>
</head>
<script>
function jscheckform(form){

  if(document.form.mestitle.value==""){
    alert("请输入公告标题");
    document.form.mestitle.focus();
    return false;
  }
  
  if(document.form.foctime.value==""){
    alert("请输入生效时间！");
    document.form.foctime.focus();
    return false;
  }

  if(document.form.faitime.value==""){
    alert("请输入失效时间！");
    document.form.faitime.focus();
    return false;
  }

  if(document.form.mescontent.value==""){
    alert("请输入公告内容！");
    document.form.mescontent.focus();
    return false;
  }

}

</script>
<body>
<form id="form" name="form" method="post" action="FrontController.do?operation=messageadd&method=add" onSubmit="return jscheckform(form)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>发布信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">信息标题</td>
      <td><input type="text" name="mestitle" value=""/></td>
    </tr>
    <tr>
      <td>信息浏览权限</td>
      <td>   
          <select name="authority">
    			<option value="0">游客</option>  			
    			<option value="1">会员</option>
    			<option value="2">管理员</option>
  	      </select>
  	  </td>
    </tr>
    <tr>
      <td>生效时间</td>
      <td><input id="foctime" name="foctime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MAXDATE="$faitime" /></td>
    </tr>
     <tr>
      <td>失效时间</td>
      <td><input id="faitime" name="faitime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MINDATE="$foctime"/></td>
    </tr>
    <tr>
      <td>公告内容</td>
      <td><textarea name="mescontent" rows="20" cols="50" value="" /></textarea></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 "class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
