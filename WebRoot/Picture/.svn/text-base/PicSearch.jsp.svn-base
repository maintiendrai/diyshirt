<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>图片搜索</title>

<script>
function act2()
{
	var cate;
	var temp=false;
	for(var i=0;i<document.checkform2.PicCate.length;i++){
		if(document.checkform2.PicCate[i].selected==true){
			cate=document.checkform2.PicCate[i].value;
			if(cate==5) temp=true;
			break;
		}
	}
	
	if(document.checkform2.PicName.value==""&&temp){
		alert("请输入搜索条件");
		document.checkform2.PicName.focus;
		return false;
	}
	
	document.checkform2.action="picturesearch.do?pageNum=1";
	document.checkform2.submit();
}
</script>
</head>
<body>
<div align="center">
<form name="checkform2" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="300" bgcolor="#dffdff" border="1">
<tr>
	<td>
		<table cellSpacing="0" cellPadding="0" width="300" bgcolor="#dffdff" border="0">
			<th colspan="2">图片搜索</th>
			<tr>
				<td width="30%">图片名</td>
				<td width="70%"><input type="text" name="PicName"></td>
			</tr>
			<tr>
				<td width="30%">图片类别</td>
				<td width="70%"><select name="PicCate">
					<option value="5" checked>--</option>
					<option value="0">0</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					</select>
					<input type="hidden" name="operation" value="picturesearch">
				</td>
			</tr>
			<th colspan="2"><input type="button" name="btn" value="开始搜索" onClick="act2();"></th>
		</table>
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>