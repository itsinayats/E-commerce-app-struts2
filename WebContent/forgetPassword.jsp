<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Recovery</title>
<style>
.errorMessage{
color:red;}
</style>

</head>
<body style="background-color:green;">

<s:form action="forget" method="POST">
<center></center><h1>FORGET PASSWORD</h1></center>
<h3><s:label name="passwordmessage"/></h3>
<s:textfield label="Provide username" cssStyle="width:200px" placeholder="email or username" name="username" />
<s:select label="Account Type" cssStyle="width:200px;" name="usertype" headerValue="----Select User Type----" headerKey="-1" list="{'ServiceProvider','Customer'}" />
<s:password label="Secret Key" cssStyle="width:200px" name="secretkey" maxlength="5" placeholder="Enter 5 digit Secret key"   />
<s:submit value="GetPassword" cssStyle="width:100px;"></s:submit>
</s:form>

</body>
</html>