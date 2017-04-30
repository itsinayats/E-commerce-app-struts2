<%@page import="xtra.Usertype"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#background{
position:absolute;
height:150%;
top:0;
width: 99%;
	
}
</style>
<link rel="stylesheet" href="css/register.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
<script>

function test(){
location.reload(true);
}
</script>
</head>
<body>

<div id="background">
<img src="images/nature.jpg" height="80%" width="100%" />
</div>
<jsp:include page="includes/header.jsp"></jsp:include> <!--  header -->


<div id="formpane">
<s:form method="POST" id="customerform" action="welcome">

<h1 align="center"><% out.print(Usertype.getRegisterAs()); %> Form</h1>
<s:textfield name="firstName" placeholder="FirstName" class="textfield"></s:textfield>
<s:textfield name="lastName" placeholder="LastName" class="textfield"></s:textfield>


<!-- START LOGIC TO DYANAMIC FORM OF SERVICE PROVIDER -->

<% if(Usertype.getRegisterAs().equalsIgnoreCase("service-provider")){ %>
<s:select  name="chosenCategoryList" headerValue="---choose-your-skill---" headerKey="-1" list="categoryList" class="textfield"></s:select>

<%} %>

<!-- END LOGIC FOR DYANAMIC FORM OF SERVICE PROVIDER  -->


<s:textfield name="email" placeholder="Email" class="textfield"></s:textfield>
<s:password name="password" placeholder='password' class="textfield"></s:password>
<s:submit value="Register" class="btnsubmit" />
</s:form><br>
<center><a href="index.jsp" id="link">Or Login Here</a></center>
<!-- START LOGIC FOR LINK -->
<%
if(Usertype.getRegisterAs().equalsIgnoreCase("service-provider")){
%>
<center><a href="index.jsp" id="link">Or Register As Customer</a></center>
<% }else{ %>
<center><a href="index.jsp" id="link">Or Register As Service-provider</a></center>
<% }%>

<!--END LOGIC FOR LINK  -->
</div>

<br><br><br><br><br><br><br><br><br><br><br><br>

</body>
<jsp:include page="includes/footer.jsp" />
</html>