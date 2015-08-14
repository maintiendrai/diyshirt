<%@ page language="java" pageEncoding="gbk" contentType="text/html; charset=gbk"%>
<%@ page import="java.util.*,com.diyshirt.to.*,com.diyshirt.model.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>图片管理</title>
<script>

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
　　　　　ImgD.onclick = function() { window.open(this.src);} //点击打开大图片
　　　　if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //判断浏览器，如果是IE
　　　　　　ImgD.title = "请使用鼠标滚轮缩放图片，点击图片可在新窗口打开";
　　　　　　ImgD.onmousewheel = function img_zoom() //滚轮缩放
　　　　　 {
　　　　　　　　　　var zoom = parseInt(this.style.zoom, 10) || 100;
　　　　　　　　　　zoom += event.wheelDelta / 12;
　　　　　　　　　　if (zoom> 0)　this.style.zoom = zoom + "%";
　　　　　　　　　　return false;
　　　　　 }
　　　  } else { //如果不是IE
　　　　　　　     ImgD.title = "点击图片可在新窗口打开";
　　　　　　   }
    }
}

function act(picid){
	document.checkform.action="favorit.do?operation=recommended&act=recommended&pageNum=1&picid="+picid;
	document.checkform.submit();
}

function act2(picid){
	document.checkform.action="favorit.do?operation=recommended&act=canclerecommended&pageNum=1&picid="+picid;
	document.checkform.submit();
}

</script>
<% 
	Page mypage = (Page)request.getAttribute("page");
	List data = mypage.getData();
%>
</head>
<body>
<div id="contentborder" align="center">
<form name="checkform" action="" method="post">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>

	<tr><td><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<%
					Iterator it = data.iterator();
					for(;it.hasNext();){
				%>
				<tr>
				<%
						for(int i=0;it.hasNext()&&i<3;i++){
							PictureTo to = (PictureTo)it.next();
							if(to.getStatus()==0){
								PictureManager picture = PictureManager.getInstance();
								boolean f = picture.isrecommended(to.getPicID());
				%>
					<td align="center">
						<table cellSpacing="0" cellPadding="0">
							<tr>
								<td align="center" height="200">
					 				<img src='../upload/<%=to.getPicPath() %>' onload="javascript:resizeimg(this,200,200)">
					 			</td>
					 		</tr>
					 		<tr>
					 			<td align="center">
					 				<%=to.getPicName() %>
					 			</td>
					 		</tr>
					 		<tr>
							 		<%
							 				if(!f){
							 		%>
								<td align="center">
									<input type="button" name="btn" value="推荐此图" onClick="act('<%=to.getPicID() %>');">
					 			</td>
									<%
										 	}else{
									%>
								<td align="center">
									<input type="button" name="btn" value="取消推荐" onClick="act2('<%=to.getPicID() %>');">
								</td>
								<%
					 				}
							 	%>
							 </tr>
						</table>
					</td>
				<%
							}
						}
				%>
				</tr>
				<%
					}
				%>
				<tr>
	<td colspan=5>第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicRCList.do?operation=picrecommended&pageNum=1'>首页</a>&nbsp;&nbsp;
	<a href='PicRCList.do?operation=picrecommended&pageNum=<%=mypage.getPageNum()-1 %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicRCList.do?operation=picrecommended&pageNum=<%=mypage.getPageNum()+1 %>'>下页</a>&nbsp;&nbsp;
	<a href='PicRCList.do?operation=picrecommended&pageNum=<%=mypage.getPageCount() %>'>末页</a>
	<%
	}%> 
	
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