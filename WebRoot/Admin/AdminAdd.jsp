<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>����Ա����</title>
</head>
<script>
function jscheckform(form){

  if(document.form.AdminAccount.value==""){
    alert("���������Ա�ʻ�");
    document.form.AdminAccount.focus();
    return false;
  }
  if(document.form.Password.value==""){
    alert("���������룡");
    document.form.Password.focus();
    return false;
  }
  if(document.form.Password.value!=document.form.Password1.value){
    alert("�������õ����벻һ�£�");
    document.form.Password.focus();
    return false;
  }   
  if(document.form.Password.value.length<6){
    alert("���볤��̫С");
    document.form.Password.focus();
    return false;
  }
}

</script>
<body>
<form id="form" name="form" method="post" action="FrontController.do?operation=adminadd&method=add" onSubmit="return jscheckform(form)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��������Ա</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">����Ա�ʻ�</td>
      <td><input type="text" name="AdminAccount" value="" style="width:180px"/></td>
    </tr>
    <tr>
      <td>����Ա����</td>
      <td><input type="password" name="Password" value="" style="width:180px"/>
      <span class="STYLE2"> ���볤������Ϊ6λ</span></td>
    </tr>
        <tr>
      <td>�ٴ���������</td>
      <td><input type="password" name="Password1" value="" style="width:180px"/></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
