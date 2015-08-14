<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">

<script type="text/javascript" src="/diyshirt/js/prototype.js"></script>
<script type="text/javascript" src="/diyshirt/js/AjaxWrapper.js"></script>
<link type="text/css" rel="stylesheet" href="/diyshirt/css/fileUpload.css"/>
<link type="text/css" href="./css/table.css" rel="stylesheet">

<title>文化衫上传</title>

<SCRIPT>
   
   function validator(){
       
       if(document.ShirtUploadForm.picture[0].value==""){
         alert("请选择正面图片！");
         document.ShirtUploadForm.picture[0].focus();
         return false;
       }
       
      if(document.ShirtUploadForm.picture[1].value==""){
         alert("请选择反面图片！");
         document.ShirtUploadForm.picture[1].focus();
         return false;
       }
       
       if(document.ShirtUploadForm.ShirtName.value==""){
         alert("请输入文化衫名称！");
         document.ShirtUploadForm.ShirtName.focus();
         return false;
       }
       
       if(document.ShirtUploadForm.price.value==""){
         alert("请输入文化衫价格！");
         document.ShirtUploadForm.price.focus();
         return false;
       }
       
       var f1 = document.ShirtUploadForm.picture[0].value.match(/^(.*)(\.)(.{1,8})$/)[3];
       var f2 = document.ShirtUploadForm.picture[1].value.match(/^(.*)(\.)(.{1,8})$/)[3];
       var c1 = f1.toLowerCase();
       var c2 = f2.toLowerCase();
   		if((c1!="jpg"&&c1!="bmp"&&c1!="gif")||(c2!="jpg"&&c2!="bmp"&&c2!="gif")){
   			alert("上传图片格式错误！");
   			document.ShirtUploadForm.picture[0].focus();
   			return false;
   		}

       //var kind = ShirtUploadForm.kind.value;
       //var integral = ShirtUploadForm.integral.value;

       var Price = ShirtUploadForm.price.value;
       var Intro = ShirtUploadForm.intro.value;
       var CateID;
       var Sex;
       var ShirtName = ShirtUploadForm.ShirtName.value;
       for(var i=0;i<document.ShirtUploadForm.CateID.length;i++){
       	if(document.ShirtUploadForm.CateID[i].checked==true){
       		CateID = document.ShirtUploadForm.CateID[i].value;
       		break;
       	}
       }
       for(var j=0;j<document.ShirtUploadForm.Sex.length;j++){
       	if(document.ShirtUploadForm.Sex[j].checked==true){
       		Sex = document.ShirtUploadForm.Sex[j].value;
       		break;
       	}
       }
	
       ShirtUploadForm.action="ShirtUpload.shirtup?Price="+Price+"&Intro="+Intro+"&CateID="+CateID+"&Sex="+Sex+"&ShirtName="+ShirtName;
       
   }
</SCRIPT>

</head>
<body>


<div  id="contentborder" align="center">
<form id="ShirtUploadForm" name="ShirtUploadForm" action="ShirtUpload.shirtup" 
		enctype="multipart/form-data" method="post" onsubmit="return validator(this)"> 

<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<div id="readme">上传需知:&nbsp;&nbsp;最大上传量:100M，单个图片最大长度:100K</div>
	<div id="uploadPictureUrl"></div>

	<tr>
      <td width="130">选择正面图片</td>
      <td align="left"><input type="file" name="picture" id="picture" style="width:230px" class="btn3"/><br></td>
    </tr>
	<tr>
      <td width="130">选择反面图片</td>
      <td align="left"><input type="file" name="picture" id="picture" style="width:230px" class="btn3"/><br></td>
    </tr>
	<tr>
      <td width="130">请选择图片类别</td>
      <td align="left">
      	<input type="radio" name="CateID" value="0" checked>0
      	<input type="radio" name="CateID" value="1">1
      	<input type="radio" name="CateID" value="2">2
      	<input type="radio" name="CateID" value="3">3
      	<input type="radio" name="CateID" value="4">4
      </td>
    </tr>
    <tr>
    	<td width="130">文化衫名称</td>
    	<td align="left">
    		<input type="text" name="ShirtName" size="10">
    	</td>
    </tr>
    <tr>
    	<td width="130">
    		文化衫价格
    	</td>
    	<td align="left">
    		<input type="text" name="price" size="10">
    	</td>
    </tr>
    <tr>
    	<td width="130">
    		性别
    	</td>
    	<td align="left">
    		<input type="radio" name="Sex" value="0" checked>男
    		<input type="radio" name="Sex" value="1">女
    	</td>
    <tr>
    	<td width="130" valign="top">文化衫介绍</td>
    	<td align="left">
    		<textarea name="intro" rows="6" cols="45"></textarea>
    	</td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" class="button" value="开始上传" onClick="return validator(this)"/>
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" class="button" value="取消上传"/>
	    <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
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
</form>
</div>


<script>
Element.hide('progressBar');
Event.observe('fileUploadForm','submit',startProgress,false);
Event.observe('cancelUploadButton','click',cancelProgress,false);

//刷新上传状态
function refreshUploadStatus(){
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'uploadStatus=',
		function(responseText){
				eval("uploadInfo = " + responseText);
				var progressPercent = Math.ceil(
					(uploadInfo.ReadTotalSize) / uploadInfo.UploadTotalSize * 100);
	
				$('progressBarText').innerHTML = ' 上传处理进度: '+progressPercent+'% '+
					' 正在处理第'+uploadInfo.CurrentUploadFileNum+'个文件';
				$('progressStatusText').innerHTML='';
				$('totalProgressBarBoxContent').style.width = parseInt(progressPercent * 3.5) + 'px';
		}
	);
}
//上传处理
function startProgress(){
	Element.show('progressBar');
    $('progressBarText').innerHTML = '上传处理进度: 0%';
    $('progressStatusText').innerHTML='';
    $('uploadButton').disabled = true;
    var periodicalExe=new PeriodicalExecuter(refreshUploadStatus,0.5);
    return true;
}
//取消上传处理
function cancelProgress(){
	$('cancelUploadButton').disabled = true;
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'cancelUpload=true',
		//因为form的提交，这可能不会执行
		function(responseText){
			eval("uploadInfo = " + responseText);
			$('progressStatusText').innerHTML='反馈状态:  '+uploadInfo.status;
			if (msgInfo.cancel=='true'){
				alert('删除成功!');
				window.location.reload();
			};
		}
	);
}
</script>


</body>
</html>