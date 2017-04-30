<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Error</title>
</head>
<body>

<jsp:include page="includes/header.jsp"  ></jsp:include>


<center style="color:red;">
<h1>
<s:property value="message" />
</h1>
<h2><a href="index.jsp">Log In</h2>
</center>

<img src="images/error.jpg" style="margin-left:2in;width:70%; ">
<jsp:include page="includes/footer.jsp"></jsp:include></body>
</html>