<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*,com.diyshirt.model.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<link href="/diyshirt/css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<title>�ղ��б�</title>

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

</script>
</head>
<% 
	MemberinfoTo user = (MemberinfoTo)session.getAttribute("User"); 
	Page mypage = (Page)request.getAttribute("page");
	List data = mypage.getData();
%>
<body>
<form name="checkform" method="post" action="">
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	
	<%
		if(user!=null){
	%>
	</tr>
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
								<td><a href="picturelist.do?operation=picturelist&pageNum=1">�鿴�ϴ�ͼƬ<p></a></td>
							</tr>
							<tr>
								<td><a href="picfavlist.do?operation=picfavlist&pageNum=1">�鿴�ղ�ͼƬ<p></a></td>
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
								<table cellSpacing="10" cellPadding="0" bgcolor="#dffdff" border="0">
									<%
										Iterator it = data.iterator();
										while(it.hasNext()){
											PicturefavouritesTo to = (PicturefavouritesTo)it.next();
											PictureManager picture = PictureManager.getInstance();
											PictureTo picto = picture.pictureintro(to.getPicID());
									%>
									<tr>
										<td>
										 	<img src='/diyshirt/upload/<%=picto.getPicPath() %>' onload="javascript:resizeimg(this,100,200)">
										 </td>
									</tr>
									<%
										}
									%>
									<tr>
										<td align="center"><input type="button" name="btn" value="�ϴ�ͼƬ" onClick="javascript:window.location='/diyshirt/Picture/PictureUpload.jsp'"></td>
									</tr>
										
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
</body>
</html>