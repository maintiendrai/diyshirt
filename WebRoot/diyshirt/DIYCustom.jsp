<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<script type="text/javascript" src='<%=request.getContextPath() %>/js/common.js'></script>
<title>文化衫定制</title>
<script language="javascript">
var PosPic,NegPic;

function resizeimg(ImgD,iwidth,iheight) {
     var image=new Image();
     image.src=ImgD.src;
     if(image.width>0 && image.height>0){
        if(image.width/image.height>= iwidth/iheight){
           if(image.width>iwidth){
               ImgD.width=iwidth;
               ImgD.height=(image.height*iwidth)/image.width;
           }else{
                  ImgD.width=image.width;
                  ImgD.height=image.height;
                }
               ImgD.alt=image.width+"×"+image.height;
        }
        else{
                if(image.height>iheight){
                       ImgD.height=iheight;
                       ImgD.width=(image.width*iheight)/image.height;
                }else{
                        ImgD.width=image.width;
                        ImgD.height=image.height;
                     }
                ImgD.alt=image.width+"×"+image.height;
            }
　　　　　ImgD.style.cursor= "pointer"; //改变鼠标指针
　　　　　//ImgD.onclick = function() { window.open(this.src);} //点击打开大图片
　　　　if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //判断浏览器，如果是IE
　　　　　　//ImgD.title = "请使用鼠标滚轮缩放图片，点击图片可在新窗口打开";
　　　　　　//ImgD.onmousewheel = function img_zoom() //滚轮缩放
　　　　　  //{
　　　　　　//　　　　var zoom = parseInt(this.style.zoom, 10) || 100;
　　　　　　//　　　　zoom += event.wheelDelta / 12;
　　　　　　//　　　　if (zoom> 0)　this.style.zoom = zoom + "%";
　　　　　　//　　　　return false;
　　　　　  //}
　　　  } else { //如果不是IE
　　　　　　　     //ImgD.title = "点击图片可在新窗口打开";
　　　　　　   }
    }
}

function savePosPic(sPosPic){
	PosPic = sPosPic;
}
function saveNegPic(sNegPic){
	NegPic = sNegPic;
}

function authentication(a){
	if(PosPic==null&&NegPic==null){
		alert("请先定制");
		return false;
	}
	if(checkform.T_ShirtName.value==""){
		alert("请输入文化衫名");checkform.T_ShirtName.focus();return false;
	}else act(a);
}

function act(a){
	var o1=  GetElCoordinate(img1).left;
	var o2 = GetElCoordinate(img1).top;
	var o3=  GetElCoordinate(img2).left;
	var o4 = GetElCoordinate(img2).top;
	var PosLoc_1 = GetElCoordinate(new1).left - o1;
	var PosLoc_2 = o2 - GetElCoordinate(new1).top;
	var NegLoc_1 = GetElCoordinate(new2).left - o3;
	var NegLoc_2 = o4 - GetElCoordinate(new2).top;
	var T_ShirtName = checkform.T_ShirtName.value;
	var PosSize;
	var NegSize;
	if(document.getElementById("img4")!=null) PosSize=document.getElementById("img4").width>document.getElementById("img4").height?document.getElementById("img4").width:document.getElementById("img4").height;
		else PosSize=0;
	if(document.getElementById("img5")!=null) NegSize=document.getElementById("img5").width>document.getElementById("img5").height?document.getElementById("img5").width:document.getElementById("img5").height;
		else NegSize=0;
	document.checkform.action="diycustom.do?operation=shirtcustomsuccess&PosPic="+PosPic+"&NegPic="+NegPic+"&PosLoc_1="+PosLoc_1+"&NegLoc_1="+NegLoc_1+"&PosLoc_2="+PosLoc_2+"&NegLoc_2="+NegLoc_2+"&PosSize="+PosSize+"&NegSize="+NegSize+"&T_ShirtName="+T_ShirtName+"&T_ShirtID="+a;
	document.checkform.submit();
}

function shirtlist(){
	document.checkform.action="diylistall.do?operation=diyshirtlistall&pageNum=1";
	document.checkform.submit();
}

</script>
</head>
<% 
	Page mypage = (Page)request.getAttribute("page");
	List data = mypage.getData();
	String pic1 = request.getParameter("pic1");
	String pic2 = request.getParameter("pic2");
	String T_ShirtID = request.getParameter("shirtid");
%>
<body>
<div align="center">
<form name="checkform" action="" method="post">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td colspan="2"><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td colspan="2"><br><br></td></tr>
	<tr>
		<td>
			<table>
				<tr>
					<td>
						<div id="img3"></div>
						<img src="<%=request.getContextPath() %><%=pic1 %>" onload="javascript:resizeimg(this,400,480)">
						<div id="img1"></div>
						<div id="img2"></div>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="移除正面图片" onClick="move()">
						<input type="button" value="移除反面图片" onClick="move2()">
						<input type="button" value="返回文化衫列表" onClick="shirtlist();">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" value="正面" onClick="hidden();hiddenpic();"><input type="button" value="反面" onClick="show('<%=pic2 %>');showpic();">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" value="扩大" onClick="javascript:resizeimg(img4,img4.width+10,img4.height+10)"><input type="button" value="缩小" onClick="javascript:resizeimg(img4,img4.width-10,img4.height-10)">
						<input type="button" value="扩大" onClick="javascript:resizeimg(img5,img5.width+10,img5.height+10)"><input type="button" value="缩小" onClick="javascript:resizeimg(img5,img5.width-10,img5.height-10)">
					</td>
				</tr>
				<tr>
					<td>请输入文化衫名
						<input type="text" name="T_ShirtName" size="20">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" name="btn" value="确认定制" onClick="authentication('<%=T_ShirtID %>');">
					</td>
				</tr>
			</table>
		</td>
	
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<%
					Iterator it = data.iterator();
					while(it.hasNext()){
						PictureTo to = (PictureTo)it.next();
						if(to.getStatus()==0){
				%>
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0">
							<tr>
								<td>
									<table cellSpacing="0" cellPadding="0">
										<tr>
											<td width="100">
					 							<img src='<%=request.getContextPath() %>/upload/<%=to.getPicPath() %>' onload="javascript:resizeimg(this,100,100)">
					 						</td>
					 					</tr>
										<tr>
											<td>
								 				<%=to.getPicName() %>
								 			</td>
								 		</tr>
								 	</table>
								 </td>
								 <td>
								 	<table cellSpacing="0" cellPadding="0">
								 		<tr>
								 			<td>
												<input type="button" name="btn" value="选择此图为正面图片" onClick="over('<%=to.getPicPath() %>');savePosPic('<%=to.getPicPath() %>');">
											</td>
										<tr>
										<tr>
											<td>
												<input type="button" name="btn" value="选择此图为反面图片" onClick="show('<%=pic2 %>');over2('<%=to.getPicPath() %>');saveNegPic('<%=to.getPicPath() %>');">
								 			</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<%
						}
					}
				%>
				<div id="new1" style="position:absolute; width:150px; height:150px; z-index:1; left: 685px; top: 160px;display:none;" class="dragme" onmousedown="selectmouse(this);"></div>
				<div id="old" style="position:absolute; width:240px; height:480px; z-index:2; left: 685px; top: 160px;display:none;"></div>
				<div id="new2" style="position:absolute; width:150px; height:150px; z-index:3; left: 685px; top: 160px;display:none;" class="dragme" onmousedown="selectmouse(this);"></div>
			<tr>
				<td>
				第&nbsp;<% for(int m=1;m<=mypage.getPageCount();m++){ 
				if(m==mypage.getPageNum()){
				%>
				<%=m %><%} else{ %>
				<a href="PicListAll.do?operation=picturelistall&pageNum=<%=m %>&tag=1&pic1=<%=pic1 %>&pic2=<%=pic2 %>&shirtid=<%=T_ShirtID %>" ><%=m %></a>
				<%}
				} %>
				&nbsp;页
				</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>