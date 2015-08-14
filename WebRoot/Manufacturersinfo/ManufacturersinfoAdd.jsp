<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>单位信息管理</title>
</head>
<script>
function jscheckform(form){

  if(document.form.mf_name.value==""){
    alert("请输入单位名称");
    document.form.mf_name.focus();
    return false;
  }
  
  if(document.form.mf_tel.value==""){
    alert("请输入联系电话");
    document.form.mf_tel.focus();
    return false;
  }
  
  if(document.form.mf_post.value==""){
    alert("请输入邮编");
    document.form.mf_post.focus();
    return false;
  }
  
  if(document.form.mf_add.value==""){
    alert("请输入联系地址");
    document.form.mf_add.focus();
    return false;
  }
  
  if(!isTelnum(document.form.mf_tel.value)){
    alert("输入电话错误");
    document.form.mf_tel.focus();
    return false;
  }
  
  if(!isNum(document.form.mf_post.value)){
    alert("输入邮编不错误");
    document.form.mf_post.focus();
    return false;
  }
}

</script>
<body>
<form id="form" name="form" method="post" action="FrontController.do?operation=manufacturersinfoadd&method=add" onSubmit="return jscheckform(form)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>新增厂商信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">单位名称</td>
      <td><input type="text" name="mf_name" value="" style="width:180px"/></td>
    </tr>
    <tr>
      <td>联系电话</td>
      <td><input type="text" name="mf_tel" value="" style="width:180px"/></td>
    </tr>
        <tr>
      <td>邮编</td>
      <td><input type="text" name="mf_post" value="" style="width:180px"/></td>
    </tr>
    <tr>
      <td>联系地址</td>
      <td><input type="text" name="mf_add" value="" style="width:419px"/></td>
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
