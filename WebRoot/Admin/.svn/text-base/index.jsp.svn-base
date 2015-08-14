<%@ page language="java" import="com.diyshirt.to.*,java.util.*" contentType="text/html;charset=gbk"%>
<html>
<head>

<title>系统管理</title>

</head>
<%AdministratorinfoTo Admin = (AdministratorinfoTo)session.getAttribute("Admin"); %>
<frameset rows="80,*" framespacing="0" border="0" frameborder="0"
	style="border:0px">
	<frame name="title" src="top.htm" marginwidth="1"
		marginheight="1" scrolling="no" frameborder="0" >
		<%
		if(Admin!=null){
	    %>
	<frameset name="content" cols="180,*" frameborder="yes"
		style="border-right:1px solid threedhighlight;border-left:1px solid threedshadow;border-bottom:1px solid threedhighlight;border-top:1px solid threedshadow">
		<frame name="menu" src="menu.htm" marginwidth="1"
			marginheight="1" scrolling="no" frameborder="1" target="wndMain">
		<frame name="wndMain" src="introduce.htm" marginwidth="1"
			marginheight="1" scrolling="auto"  target="_self">
	</frameset>
		<%
		}else{
	    %>
	    <frame name="Adminnull" src="Adminnull.html" marginwidth="1"
		marginheight="1" scrolling="no" frameborder="1" >
		<%
		}
	    %>
</frameset>

</html>
