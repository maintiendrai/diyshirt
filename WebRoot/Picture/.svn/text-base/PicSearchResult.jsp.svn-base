<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>图片搜索结果</title>
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
</script>
</head>
<% 
	Page mypage = (Page)request.getAttribute("mypage");
	List data = mypage.getData();
%>
<body>
<div align="center">
<form name="checkform" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">	
				<%
					Iterator it = data.iterator();
					while(it.hasNext()){ %>
				<tr>
				<%		for(int i=0;i<3&&it.hasNext();i++){
						PictureTo to = (PictureTo)it.next();
				%>  
				    <td>
				    <table>
				    <tr>
					<td>
					 	<img src='/diyshirt/upload/<%=to.getPicPath() %>' onload="javascript:resizeimg(this,200,200)">
					</td>
					</tr>
					<tr>
					 <td>
					 	<%=to.getPicName() %>
					 </td>
			        </tr>
			        </table>
			        </td>
				<%
						}
				%>
				</tr>
				<%
					}
				%>
			</table>
		</td>
	</tr>
	<tr>
	<td colspan=8 align=center>第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicSearchResult.do?operation=picturesearch&pageNum=1&PicName=<%=request.getAttribute("PicName") %>&PicCate=<%=request.getAttribute("PicCate") %>'>首页</a>&nbsp;&nbsp;
	<a href='PicSearchResult.do?operation=picturesearch&pageNum=<%=mypage.getPageNum()-1 %>&PicName=<%=request.getAttribute("PicName") %>&PicCate=<%=request.getAttribute("PicCate") %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicSearchResult.do?operation=picturesearch&pageNum=<%=mypage.getPageNum()+1 %>&PicName=<%=request.getAttribute("PicName") %>&PicCate=<%=request.getAttribute("PicCate") %>'>下页</a>&nbsp;&nbsp;
	<a href='PicSearchResult.do?operation=picturesearch&pageNum=<%=mypage.getPageCount() %>&PicName=<%=request.getAttribute("PicName") %>&PicCate=<%=request.getAttribute("PicCate") %>'>末页</a>
	<%
	}%> 
	
	</td>
	</tr>
</table>
</form>
</div>
</body>
</html>