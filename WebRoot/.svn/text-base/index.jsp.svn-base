<%@ page language="java" import="com.diyshirt.to.*,java.util.*"
   contentType="text/html; charset=gbk"  pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.Page,com.diyshirt.model.*,com.diyshirt.to.*" %>
<jsp:useBean id="helper" class="com.diyshirt.view.ViewHelper" scope="application" />
<link href="css/index.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>DIY文化衫-首页</title>
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
　　　　　
    }
}
</script>
</head>
<%
	List messagetourist = helper.getMessage(10,"0");
    List messageuser = helper.getMessage(10,"1");
%>
<body>
<div align="center">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<th colspan="2"><%@ include file="top.jsp"%></th>
	<tr>
		<td colspan="2">
			<br>
		</td>
	</tr>
	<tr>
		<td width="20%" valign="top">
			<table cellSpacing="0" cellPadding="0" width="250" bgcolor="#dffdff" border="1">
				<tr>
				 	<td colspan="2">
				 		<%
				 			if(session.getAttribute("User")==null){
				 		%>
				 		<%@ include file="/user/UserLogin.jsp" %>
				 		<%
				 			}else{
				 		%>
				 		<%@ include file="/user/Userindex.jsp" %>
				 		<%
				 			}
				 		%>
				 	</td>
				</tr>
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" bgcolor="#dffdff" border="0">
							<%
					 			if(session.getAttribute("UserID")==null){
					 		%>
							<tr>
								<td width="190">近期公告</td>
							 	<td width="65"><a href="FrontController.do?operation=messagelist&pageNum=1&method=tourist">更多...</a></td>	
							</tr>
					 		<%
									for (int i = 0; i < messagetourist.size(); i++) {
							%>
							<tr>
								<td>
									<a href="FrontController.do?operation=messagequery&method=user&MesID=<%=((MessageTo) messagetourist.get(i)).getMesID()%>">
										<%=((MessageTo) messagetourist.get(i)).getMesTitle()%>
									</a>
								</td>
								<td>
									<%=((MessageTo) messagetourist.get(i)).getFocTime()%>
								</td>
							</tr>
						            
							<%
					 				}
	
					 			}else{
					 		%>
							<tr>
								<td width="190">近期公告</td>
							 	<td width="65"><a href="FrontController.do?operation=messagelist&pageNum=1&method=user">更多...</a></td>
							</tr>
					 		<%
							   		for (int i = 0; i < messageuser.size(); i++) {
							%>
							<tr>
								<td>
									<a href="FrontController.do?operation=messagequery&method=user&MesID=<%=((MessageTo) messageuser.get(i)).getMesID()%>">
										<%=((MessageTo) messageuser.get(i)).getMesTitle()%>
									</a>
								</td>
								<td>
									<%=((MessageTo) messageuser.get(i)).getFocTime()%>
								</td>
							</tr>
							<%
					 				}
	
					 			}
					 		%>
					 	</table>
					 </td>
				</tr>
			</table>
		</td>
		<td colspan="2">
			<table cellSpacing="0" cellPadding="0" width="100%" height="400" bgcolor="#dffdff" border="0">
				<tr>
					<td align="left" colspan="7" bgcolor="blue">
						<font color="white">站长推荐文化衫</font>
					</td>
				</tr>
				<%  Page pageshirt = (Page)request.getAttribute("page");
				    if(pageshirt==null){
				    	pageshirt=ShirtManager.getInstance().findShirtRCByPage(1,6);
					}
					List data = pageshirt.getData();
					Iterator it = data.iterator();
					for(int a=0;it.hasNext()&&a<2;a++){
				%>
				<tr>
				<%
						for(int i=0;it.hasNext()&&i<3;i++){
							T_shirtrecommendedTo to = (T_shirtrecommendedTo)it.next();
							T_shirtTo shirt = ShirtManager.getInstance().shirtinfo(to.getT_ShirtID());
				%>
					<td>
					 	<img src='/diyshirt<%=shirt.getT_ShirtPath_1() %>' onload="javascript:resizeimg(this,200,200)">
					 </td>
				<%
						}
					}
				%>
				</tr>
				<tr>
				<td align="right">
				第&nbsp;<% for(int m=1;m<=pageshirt.getPageCount();m++){ 
				if(m==pageshirt.getPageNum()){
				%>
				<%=m %><%} else{ %>
				<a href="shirtcommend.do?operation=shirtcommended&pageNum=<%=m %>"><%=m %></a>
				<%}
				} %>
				&nbsp;页
				</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="50">
		</td>
		<td width="700" align="right">
			<table cellSpacing="0" cellPadding="0" bgcolor="#dffdff" border="1">
				<tr>
					<td>
						<%@ include file="/Picture/PicSearch.jsp"%>
					</td>
					<td>
						<%@ include file="/diyshirt/DIYSearch.jsp"%>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td width="250">
		</td>
		<td>
			<table cellSpacing="0" cellPadding="0" width="100%" height="400" bgcolor="#dffdff" border="0">
				<tr>
					<td align="left" colspan="7" bgcolor="blue">
						<font color="white">站长推荐图片</font>
					</td>
				</tr>
					<%
					Page pagepicture = (Page)request.getAttribute("picpage");
				    if( pagepicture==null){
				    	 pagepicture=PictureManager.getInstance().findPicRCBypage(1,6);
					}
						List data2 = pagepicture.getData();
						Iterator it2 = data2.iterator();
						for(int b=0;it2.hasNext()&&b<2;b++){
					%>
				<tr>
					<%
							for(int j=0;it2.hasNext()&&j<3;j++){
								PicturerecommendedTo to = (PicturerecommendedTo)it2.next();
								PictureTo picture = PictureManager.getInstance().pictureintro(to.getPicID());
					%>
						<td align="center">
						 	<img src='upload/<%=picture.getPicPath() %>' onload="javascript:resizeimg(this,150,150)">
						 </td>
					<%
							}
						}
					%>
				</tr>
				<tr>
				<td align="right">
				第&nbsp;<% for(int n=1;n<=pagepicture.getPageCount();n++){ 
				if(n==pagepicture.getPageNum()){
				%>
				<%=n %><%} else{ %>
				<a href="piccommend.do?operation=picturercshow&pageNum=<%=n %>"><%=n %></a>
				<%}
				} %>
				&nbsp;页
				</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</div>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>