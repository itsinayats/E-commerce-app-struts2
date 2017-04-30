<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<style>
#background{
position:absolute;
height:120%;
top:0;
width: 99%;
	
}
</style>
<link rel="stylesheet" href="css/register.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>

<div id="background">
<img src="images/nature.jpg" height="80%" width="100%" />
</div>
<jsp:include page="includes/header.jsp"></jsp:include>

<s:form action="register" id="registerprosform"><br>
<span style="font-size:20px; font-weight:bold;align:center;">REGISTER AS:</span>
<s:select name="registertype" headerValue="----Select User Type----" headerKey="-1" list="{'CUSTOMER','SERVICE-PROVIDER'}" class="combo" />
<s:submit value="GO" class="gobtn"  />
</s:form><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="includes/footer.jsp" />
</body>
</html>