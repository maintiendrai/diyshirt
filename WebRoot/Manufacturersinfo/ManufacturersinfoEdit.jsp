<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<title>��λ��Ϣ����</title>
</head>
<script>
function jscheckform(form){

  if(document.form.mf_name.value==""){
    alert("�����뵥λ����");
    document.form.mf_name.focus();
    return false;
  }
  
  if(document.form.mf_tel.value==""){
    alert("��������ϵ�绰");
    document.form.mf_tel.focus();
    return false;
  }
  
  if(document.form.mf_post.value==""){
    alert("�������ʱ�");
    document.form.mf_post.focus();
    return false;
  }
  
  if(document.form.mf_add.value==""){
    alert("��������ϵ��ַ");
    document.form.mf_add.focus();
    return false;
  }
  
  if(!isTelnum(document.form.mf_tel.value)){
    alert("����绰����");
    document.form.mf_tel.focus();
    return false;
  }
  
  if(!isNum(document.form.mf_post.value)){
    alert("�����ʱ಻����");
    document.form.mf_post.focus();
    return false;
  }
}

</script>
<body>
<%ManufacturersinfoTo to = (ManufacturersinfoTo)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="FrontController.do?operation=manufacturersinfoedit" onSubmit="return jscheckform(form)">
<input type="hidden" name="MF_ID"  value="<%=to.getMF_ID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸ĳ�����Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <td><input type="hidden" name="mf_id" value="<%=to.getMF_ID()%>" style="width:180px"/></td>
    <tr>
      <td width="130">��λ����</td>
      <td><input type="text" name="mf_name" value="<%=to.getMF_Name()%>" style="width:180px"/></td>
    </tr>
    <tr>
      <td>��ϵ�绰</td>
      <td><input type="text" name="mf_tel" value="<%=to.getMF_Tel()%>" style="width:180px"/></td>
    </tr>
        <tr>
      <td>�ʱ�</td>
      <td><input type="text" name="mf_post" value="<%=to.getMF_Post()%>" style="width:180px"/></td>
    </tr>
    <tr>
      <td width="129">��ϵ��ַ</td>
      <td><input type="text" name="mf_add" value="<%=to.getMF_Add()%>" style="width:419px"/></td>
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
