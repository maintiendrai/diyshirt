<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>

<html>
	<head>


		<title>�û�ע��</title>

<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 10px}
.STYLE4 {color: #FF0000}
-->
    </style>
	</head>
	
<script>
function jscheckform(){

  if(document.checkform.UserID.value==""){
    alert("�������û��ʺ�");
    document.checkform.UserID.focus();
    return false;
  }
  
    if(!isEmail(document.checkform.UserID.value)){
    alert("�û��ʺŲ��Ϸ�");
    document.checkform.UserID.focus();
    return false;
  }
	if(document.checkform.Password.value.length<6){
    alert("���볤��̫С");
    document.checkform.password.focus();
    return false;
  }
  
  if(document.checkform.Password.value==""){
    alert("���������룡");
    document.checkform.Password.focus();
    return false;
  }
  if(document.checkform.Password.value!=document.checkform.Password2.value){
    alert("�������õ����벻һ�£�");
    document.checkform.Password.focus();
    return false;
  } 
  if(document.checkform.NickName.value==""){
    alert("�������ǳƣ�");
    document.checkform.Password.focus();
    return false;
  }
   if(!isNum(document.checkform.Age.value)||document.checkform.Age.value<0||document.checkform.Age.value>100){
    alert("��������ȷ����");
    document.checkform.Age.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.Telephone.value)){
    alert("�̶��绰���Ϸ�");
    document.checkform.Telephone.focus();
    return false;
  }
  if(!isTelnum(document.checkform.Mobilephone.value)){
    alert("�ƶ��绰���Ϸ�");
    document.checkform.Mobilephone.focus();
    return false;
  }
  if(!isNum(document.checkform.Post.value)){
    alert("�ʱ಻�Ϸ�");
    document.checkform.Post.focus();
    return false;
  }
  if(!isNum(document.checkform.QQ.value)){
    alert("QQ���Ϸ�");
    document.checkform.QQ.focus();
    return false;
  }
  

  if(confirm('��ȷ��Ҫע��ô��')){
 	 document.checkform.Password.value=hex_md5(document.checkform.Password.value);
 	 document.checkform.submit();
  }
}

</script>
	<body>
		<form  name="checkform" method="post" action="userregedit.do">
			<h1 align="center">�û�ע��</h1>
			<table width="596" height="175" border="0" align="center">
				<tr>
					<td width="50%" align="center">�û��ʺ�</td>
					<td width="50%" align="left"><input type="text" name="UserID" >
						<span class="STYLE4">*</span>
						<span class="STYLE2">����Email��Ϊ�ʺ�</span>
					</td>
				</tr>
				<tr>
					<td width="50%" align="center">��  ��</td>
					<td width="50%"><input type="password" name="Password"><span class="STYLE4">*</span>
				    	<span class="STYLE2"> ���볤������Ϊ6λ</span>
				    </td>
				</tr>
				<tr>
					<td width="50%" align="center">ȷ������</td>
					<td width="50%"><input type="password" name="Password2"><span class="STYLE4">*</span></td>
				</tr>
				<tr>
					<td width="50%" align="center">�û��ǳ�</td>
					<td width="50%"><input type="text" name="NickName"><span class="STYLE4">*</span></td>
				</tr>
				<tr>
					<td width="50%" align="center">��  ��</td>
					<td width="50%"><label><input type="radio" name="Sex" value="0" checked>��</label>
						<label><input type="radio" name="Sex" value="1">Ů</label>
					</td>
				</tr>
				<tr>
					<td width="50%" align="center">��  ��</td>
					<td width="50%"><input type="text" name="Age"></td>
				</tr>
				<tr>
					<td width="50%" align="center">�̶��绰</td>
					<td width="50%"><input type="text" name="Telephone"></td>
				</tr>
				<tr>
					<td width="50%" align="center">�ƶ��绰</td>
					<td width="50%"><input type="text" name="Mobilephone"></td>
				</tr>
				<tr>
					<td width="50%" align="center">��ϵ��ַ</td>
					<td width="50%"><input type="text" name="Address"></td>
				</tr>
				<tr>
					<td width="50%" align="center">��  ��</td>
					<td width="50%"><input type="text" name="Post"></td>
				</tr>
				<tr>
					<td width="50%" align="center">QQ</td>
					<td width="50%"><input type="text" name="QQ"><input type="hidden" name="operation" value="userregedit"></td>
				</tr>
				<tr>
					<td colspan="2">
					  <div align="center">
					    <input type="button" name="Submit" value="ע��" onClick="jscheckform();">
					    <input type="reset" name="Submit2" value="����" >
				          </div></td></tr>
		  </table>
		</form>
	</body>
</html>
