<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>文化衫搜索</title>

<script>
function act()
{
	var cate;
	var temp=false;
	for(var i=0;i<document.checkform1.CateID.length;i++){
		if(document.checkform1.CateID[i].selected==true){
			cate=document.checkform1.CateID[i].value;
			if(cate==5) temp=true;
			break;
		}
	}
	
	if(document.checkform1.ShirtName.value==""&&temp){
		alert("请输入搜索条件");
		document.checkform1.ShirtName.focus;
		return false;
	}
	
	document.checkform1.action="diysearch.do?pageNum=1";
	document.checkform1.submit();
}
</script>
</head>
<body>
<div align="center">
<form name="checkform1" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="300" bgcolor="#dffdff" border="1">
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="300" bgcolor="#dffdff" border="0">
				<th colspan="2">文化衫搜索</th>
				<tr>
					<td width="30%">文化衫名</td>
					<td width="70%"><input type="text" name="ShirtName"></td>
				</tr>
				<tr>
					<td width="30%">文化衫类别</td>
					<td width="70%"><select name="CateID">
						<option value="5" checked>--</option>
						<option value="0">0</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						</select>
						<input type="hidden" name="operation" value="diysearch">
					</td>
				</tr>
				<th colspan="2"><input type="button" name="btn" value="开始搜索" onClick="act();"></th>
			</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>