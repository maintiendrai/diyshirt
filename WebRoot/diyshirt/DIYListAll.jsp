<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.diyshirt.to.*,java.util.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Admin/table.css">
<link href="../css/index.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>文化衫展示</title>

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

function act(a,b,c){
	document.checkform.action="diycustom.do?operation=diyshirtcustom&pageNum=1&pic1="+a+"&pic2="+b+"&shirtid="+c;
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
<form name="checkform" method="post" action="">
<table cellSpacing="0" cellPadding="0" width="70%" bgcolor="#dffdff" border="0">
	<tr>
		<td><%@ include file="/top.jsp"%></td>
	</tr>
	<tr><td><br><br></td></tr>
	<tr>
		<td align="center">
			<table cellSpacing="0" cellPadding="0" width="100%" bgcolor="#dffdff" border="0">
				<%
					Iterator it = data.iterator();
					for(;it.hasNext();){
				%>
				<tr>
				<%
						for(int i=0;it.hasNext()&&i<3;i++){
							T_shirtTo to = (T_shirtTo)it.next();
				%>
					<td>
						<table cellSpacing="0" cellPadding="0">
							<tr>
								<td align="center">
					 				<img src='<%=request.getContextPath() %>/<%=to.getT_ShirtPath_1() %>' onload="javascript:resizeimg(this,200,200)">
								</td>
							</tr>
							<tr>
								 <td align="center">
								 	<input type="button" name="btn" value="去定制" onClick="act('<%=to.getT_ShirtPath_1() %>','<%=to.getT_ShirtPath_2() %>','<%=to.getT_ShirtID() %>');">
								 </td>
							</tr>
						</table>
					</td>
				<%
						}
				%>
				</tr>
				<tr>
					<td><br></td>
				</tr>
				<%
					}
				%>
			</table>
		</td>
	</tr>
	<tr>
	<td colspan=5 align=center >第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DIYShirt.do?operation=diyshirtlistall&pageNum=1'>首页</a>&nbsp;&nbsp;
	<a href='DIYShirt.do?operation=diyshirtlistall&pageNum=<%=mypage.getPageNum()-1 %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='DIYShirt.do?operation=diyshirtlistall&pageNum=<%=mypage.getPageNum()+1 %>'>下页</a>&nbsp;&nbsp;
	<a href='DIYShirt.do?operation=diyshirtlistall&pageNum=<%=mypage.getPageCount() %>'>末页</a>
	<%
	}%> 
	
	</td>
	</tr>
	<tr>
		<td align="center">
			<a href="picturelistall.do?operation=picturelistall&pageNum=1&tag=0"><font color=red>图片展示</font></a>
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>