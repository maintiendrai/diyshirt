<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    <%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">

<script type="text/javascript" src="/diyshirt/js/prototype.js"></script>
<script type="text/javascript" src="/diyshirt/js/AjaxWrapper.js"></script>
<link type="text/css" rel="stylesheet" href="./css/fileUpload.css"/>
<link type="text/css" href="./css/table.css" rel="stylesheet">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>ͼƬ�ϴ�</title>

<SCRIPT>
   
   function validator(){
   
   		
       
       if(document.PictureUploadForm.picture.value==""){
         alert("��ѡ���ϴ��ļ���");
         document.PictureUploadForm.picture.focus();
         return false;
       }
       
       if(document.PictureUploadForm.picname.value==""){
         alert("�������������ƣ�");
         document.PictureUploadForm.picname.focus();
         return false;
       }
       
       var f = document.PictureUploadForm.picture.value.match(/^(.*)(\.)(.{1,8})$/)[3];
       var c = f.toLowerCase();
   		if(c!="jpg"&&c!="bmp"&&c!="gif"){
   			alert("�ϴ�ͼƬ��ʽ����");
   			document.PictureUploadForm.picture.focus();
   			return false;
   		}
       
       var picname = PictureUploadForm.picname.value;
       var UserID = PictureUploadForm.UserID.value;
       //var kind = PictureUploadForm.kind.value;
       //var integral = PictureUploadForm.integral.value;

       PictureUploadForm.action="BackGroundService.action?picname="+picname+"&UserID="+UserID;
       
   }
</SCRIPT>
<% 
	MemberinfoTo user = (MemberinfoTo)session.getAttribute("User");
%>
</head>
<body>
<%
  String UserID =(String)session.getAttribute("UserID");
%>

<div  id="contentborder" align="center">
<form id="PictureUploadForm" name="PictureUploadForm" action="./BackGroundService.action" 
		enctype="multipart/form-data" method="post" onsubmit="return validator(this)"> 
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	
	<%
		if(user!=null){
	%>
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" width="55%" bgcolor="#dffdff" border="0">
							<tr>
								<td><a href="UserControl.jsp">�鿴�û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="UserEdit.jsp">�޸��û�����<p></a></td>
							</tr>
							<tr>
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">�鿴�ϴ�ͼƬ</a><p></td><
							</tr>
							<tr>
								<td><a href="picfavlist.do?operation=picfavlist&pageNum=1">�鿴�ղ�ͼƬ</a><p></td>
							</tr>
							<tr>
								<td><a href="shirtfavlist.do?operation=shirtfavlist&pageNum=1">�鿴�ղ��Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="shirtusercustomlist.do?operation=shirtusercustomlist&pageNum=1">�鿴�����Ļ���<p></a></td>
							</tr>
							<tr>
								<td><a href="orderslist.do?operation=orderslist&pageNum=1&method=user">�鿴����</a></td>
							</tr>
						</table>
					</td>
					<td>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<div id="readme">�ϴ���֪:&nbsp;&nbsp;����ϴ���:100M������ͼƬ��󳤶�:2M</div>
	<div id="uploadPictureUrl"></div>

	<tr>
      <td width="130">ѡ��ͼƬ</td>
      <td><input type="file" name="picture" id="picture" style="width:230px" class="btn3"/><br></td>
    </tr>
	
	<tr>
      <td width="130">ͼƬ����</td>
      <td><input type="text" name="picname" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
      <td width="130">�ϴ���ID</td>
      <td><input type="hidden" name="UserID" value="<%=UserID%>"/><%=UserID%><br></td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" class="button" value="��ʼ�ϴ�" onClick="return validator(this)"/>
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" class="button" value="ȡ���ϴ�"/>
	    <input type="reset" name="reset" value=" ���� " class="button" onclick="history.back();">
      </td>
    </tr>
    <div id="progressBar">
	<div id="theMeter">
    	<div id="progressBarText"></div>
	        <div id="totalProgressBarBox">
	        	<div id="totalProgressBarBoxContent"></div>
	        </div>
        </div>
        <div id="progressStatusText"></div>
   </div>
</table>
</td>
</tr>
</table>
</td>
</tr>
<%
		}else{
	%>
	<tr>
		<td align="center"><h1>���ȵ�¼!</h1></td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="btn2" value="����" onClick="javascript:window.location='/diyshirt/index.jsp'"></td>
	</tr>
	<%
		}
	%>
</table>
</div>
</form>
</div>


<script>
Element.hide('progressBar');
Event.observe('fileUploadForm','submit',startProgress,false);
Event.observe('cancelUploadButton','click',cancelProgress,false);

//ˢ���ϴ�״̬
function refreshUploadStatus(){
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'uploadStatus=',
		function(responseText){
				eval("uploadInfo = " + responseText);
				var progressPercent = Math.ceil(
					(uploadInfo.ReadTotalSize) / uploadInfo.UploadTotalSize * 100);
	
				$('progressBarText').innerHTML = ' �ϴ��������: '+progressPercent+'% '+
					' ���ڴ����'+uploadInfo.CurrentUploadFileNum+'���ļ�';
				$('progressStatusText').innerHTML='';
				$('totalProgressBarBoxContent').style.width = parseInt(progressPercent * 3.5) + 'px';
		}
	);
}
//�ϴ�����
function startProgress(){
	Element.show('progressBar');
    $('progressBarText').innerHTML = '�ϴ��������: 0%';
    $('progressStatusText').innerHTML='';
    $('uploadButton').disabled = true;
    var periodicalExe=new PeriodicalExecuter(refreshUploadStatus,0.5);
    return true;
}
//ȡ���ϴ�����
function cancelProgress(){
	$('cancelUploadButton').disabled = true;
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'cancelUpload=true',
		//��Ϊform���ύ������ܲ���ִ��
		function(responseText){
			eval("uploadInfo = " + responseText);
			$('progressStatusText').innerHTML='����״̬:  '+uploadInfo.status;
			if (msgInfo.cancel=='true'){
				alert('ɾ���ɹ�!');
				window.location.reload();
			};
		}
	);
}
</script>


</body>
</html>