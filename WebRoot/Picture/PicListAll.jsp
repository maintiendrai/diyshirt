<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>ͼƬչʾ</title>
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
               ImgD.alt=image.width+"��"+image.height;
        }
        else{
                if(image.height>iheight){
                       ImgD.height=iheight;
                       ImgD.width=(image.width*iheight)/image.height;
                }else{
                        ImgD.width=image.width;
                        ImgD.height=image.height;
                     }
                ImgD.alt=image.width+"��"+image.height;
            }
����������ImgD.style.cursor= "pointer"; //�ı����ָ��
����������ImgD.onclick = function() { window.open(this.src);} //����򿪴�ͼƬ
��������if (navigator.userAgent.toLowerCase().indexOf("ie") > -1) { //�ж�������������IE
������������ImgD.title = "��ʹ������������ͼƬ�����ͼƬ�����´��ڴ�";
������������ImgD.onmousewheel = function img_zoom() //��������
���������� {
��������������������var zoom = parseInt(this.style.zoom, 10) || 100;
��������������������zoom += event.wheelDelta / 12;
��������������������if (zoom> 0)��this.style.zoom = zoom + "%";
��������������������return false;
���������� }
������  } else { //�������IE
��������������     ImgD.title = "���ͼƬ�����´��ڴ�";
������������   }
    }
}

function act(picid){
	document.checkform.action="favorit.do?operation=picturefavarit&picid="+picid;
	document.checkform.submit();
}

function report(picid){
	document.checkform.action="report.do?operation=picturereport&picid="+picid;
	document.checkform.submit();
}

</script>
</head>
<% 
	Page mypage = (Page)request.getAttribute("page");
	List data = mypage.getData();
%>
<body>
<div align="center">
<form name="checkform" action="" method="post">
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
					for(;it.hasNext();){
				%>
				<tr>
				<%
						for(int i=0;it.hasNext()&&i<3;i++){
							PictureTo to = (PictureTo)it.next();
				%>
					<td align="center">
						<table cellSpacing="0" cellPadding="0">
							<tr>
								<td align="center" height="200">
					 				<img src='<%=request.getContextPath() %>/upload/<%=to.getPicPath() %>' onload="javascript:resizeimg(this,200,200)">
								</td>
							</tr>
							<tr>
								<td align="center"><%=to.getPicName() %></td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" name="btn" value="�ղش�ͼ" onClick="act('<%=to.getPicID() %>');">
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="button" name="btn2" value="�ٱ���ͼ" onClick="report('<%=to.getPicID() %>');">
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
	<td colspan=8 align=center>�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicListAll.do?operation=picturelistall&pageNum=1&tag=0'>��ҳ</a>&nbsp;&nbsp;
	<a href='PicListAll.do?operation=picturelistall&pageNum=<%=mypage.getPageNum()-1 %>&tag=0'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='PicListAll.do?operation=picturelistall&pageNum=<%=mypage.getPageNum()+1 %>&tag=0'>��ҳ</a>&nbsp;&nbsp;
	<a href='PicListAll.do?operation=picturelistall&pageNum=<%=mypage.getPageCount() %>&tag=0'>ĩҳ</a>
	<%
	}%> 
	
	</td>
	</tr>
</table>
</form>
</div>
</body>
</html>