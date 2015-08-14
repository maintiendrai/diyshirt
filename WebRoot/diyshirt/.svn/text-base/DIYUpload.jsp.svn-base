<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="../Admin/table.css">
		<link href="../css/index.css" rel="stylesheet" type="text/css">
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
        <script type="text/javascript" src="/diyshirt/js/ParamUtil.js"></script>
		<script type="text/javascript" src="/diyshirt/js/prototype.js"></script>
		<link type="text/css" rel="stylesheet"
			href="/diyshirt/css/fileUpload.css" />
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
      
      if(!isFloatNum(document.ShirtUploadForm.price.value)){
      alert("文化衫价格格式不正确！");
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
   }
</SCRIPT>

	</head>
	<body>


		<div id="contentborder" align="center">
			<form id="ShirtUploadForm" name="ShirtUploadForm"
				action="ShirtUpload.do?operation=shirtupload" enctype="multipart/form-data" method="post"
				onsubmit="return validator(this)">

				<table border=0 cellspacing=0 cellpadding=0 width="98%"
					class="small">
					<div id="readme">
						上传需知:&nbsp;&nbsp;最大上传量:100M，单个图片最大长度:100K
					</div>
					<div id="uploadPictureUrl"></div>

					<tr>
						<td width="130">
							选择正面图片
						</td>
						<td align="left">
							<input type="file" name="picture" id="picture"
								style="width:230px" sise="30" />
							<br>
						</td>
					</tr>
					<tr>
						<td width="130">
							选择反面图片
						</td>
						<td align="left">
							<input type="file" name="picture" id="picture"
								style="width:230px" size="30" />
							<br>
						</td>
					</tr>
					<tr>
						<td width="130">
							请选择图片类别
						</td>
						<td align="left">
							<input type="radio" name="CateID" value="0" checked>
							0
							<input type="radio" name="CateID" value="1">
							1
							<input type="radio" name="CateID" value="2">
							2
							<input type="radio" name="CateID" value="3">
							3
							<input type="radio" name="CateID" value="4">
							4
						</td>
					</tr>
					<tr>
						<td width="130">
							文化衫名称
						</td>
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
							<input type="radio" name="sex" value="0" checked>
							男
							<input type="radio" name="sex" value="1">
							女
						</td>
					<tr>
						<td width="130" valign="top">
							文化衫介绍
						</td>
						<td align="left">
							<textarea name="intro" rows="6" cols="45"></textarea>
						</td>
					</tr>
				</table>
				<table border=0 cellspacing=0 cellpadding=0 width="98%"
					class="small">
					<tr>
						<td colspan="2">
							<input type="submit" name="uploadButton" value="开始上传" onClick="return validator(this)" />
							<input type="button" name="cancelUploadButton" value="取消上传" />
							<input type="reset" name="reset" value=" 返回 " onclick="history.back();">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
