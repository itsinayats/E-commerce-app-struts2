
<%@page import="bean.Objects.Parent"%>
<%@page import="xtra.UserLoginAs"%>
<%@page import="bean.Objects.ObjectFactory"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.Invocation"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.MenuDAO"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/header.css">
<link rel="stylesheet" href="css/menu.css">
</head>
<body>
<div id="header">
<div id="search">
<form action="searchResult">
<input type="search" class="search" placeholder="search" name="key">
</form>
</div>

<a href="home"><img src="images/icons/background.jpg" width="100%" height="140px;"></a>

 <jsp:include page="menu.jsp"></jsp:include>
<% 
HttpSession s=request.getSession(true);
String n=(String)s.getAttribute("user");
if(n!=null&&!n.equals("")){
String usertype=UserLoginAs.getLoginAs().toLowerCase();
//Parent p=new ObjectFactory().getObject(usertype);
	
%>
<div id="user">
Logged In:<br><s:property value="#session.user" />
<a href="logout">Log Out</a>
<br>
<a href="profile">View Profile</a>
</div>
<%}else {%>
<div id="user">
<br>
<a href="home">Log In Here</a>
</div>
<%} %>

</div>


</body>




</html>