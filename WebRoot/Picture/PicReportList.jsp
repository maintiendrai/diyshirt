<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*,com.diyshirt.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>ͼƬ�ٱ��б�</title>
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
	document.checkform.action="picturetreat.do?operation=picturetreat&act=remove&picid="+picid+"&pageNum=1";
	document.checkform.submit();
}

function report(picid){
	document.checkform.action="picturetreat.do?operation=picturetreat&act=neglected&picid="+picid+"&pageNum=1";
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
	<tr><td><br><br></td></tr>
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<tr>
				<%
					Iterator it = data.iterator();
					while(it.hasNext()){
						PictureManager picture = PictureManager.getInstance();
						ReportinfoTo to = (ReportinfoTo)it.next();
						PictureTo picto = new PictureTo();
						picto = picture.pictureintro(to.getPicID());
						if(picto.getStatus()==0){
						
				%>
				
					<td><%=picto.getPicID() %>
					 	<img src='/diyshirt/upload/<%=picto.getPicPath() %>' onload="javascript:resizeimg(this,200,200)">
					 </td>
					 <td>
					 	
						<input type="button" name="btn" value="ɾ��" onClick="act('<%=picto.getPicID() %>');">
						<input type="button" name="btn2" value="����" onClick="report('<%=picto.getPicID() %>');">
					 </td>
				
				<%
						}
					}
				%>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>