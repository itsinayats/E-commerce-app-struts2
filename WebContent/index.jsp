<%@page import="com.dao.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<style>
#backgroundpic{
position:absolute;
height:120%;
top:0;
	
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<% String x;
x=request.getParameter("cat"); 
if(x==null){
	x="Home";
}
out.print(x);%>
</title>
<link rel="stylesheet" href="css/style.css">
<script>
function popup(){
	window.open("forgetPassword.jsp","_blank" ,"width=500px,height=300px,top=200px,left=500px");
}

</script>

</head>
<body>

<div id="background">
<img src="images/nature.jpg" height="80%" width="100%" />

<%-- <div id="subCategory">
<table><tr>


<!--START CODE FOR SUBCATEGORY -->
<%
String cat=request.getParameter("cat");
if(cat!=null){
String sc=request.getParameter("cat").substring(3, 6).toLowerCase();
ArrayList<String> list= MenuDAO.getSubMenuItems(sc); 
int i=0; 
while(i<list.size()){ 
	if(i==6){%>
	<tr>
	<% } %>

<td><a href="providers.jsp?cat=<%= list.get(i) %>"><%= list.get(i) %></a></td>

<%
i++;
}
}

%>
</tr>
</table>

</div>


<!--END CODE FOR SUBCATEGORY  --> --%>
<span style="top:200px;position:absolute;left:350; color:yellow;font-size:30px;"><s:property value="info" /></span>
<span style="top:200px;position:absolute;left:482;  color:yellow;font-size:30px;"><s:property value="msg" /></span>
<!-- START CODE FOR LOGIN PANEL -->
<div id="LoginPanel">

<% 
if(session.getAttribute("user")!=null){
%>
<div class="alternateloginpanel">
<jsp:include page="includes/alternateofloginpane.jsp"></jsp:include>
</div>

<%}else {%>

<span  style="color:cyan;font-size:30px;">LOGIN HERE:</span>
<s:form action="login">
<s:textfield tooltip="this is required" tooltipIconPath="images/icon.png" name="username" class="username"  placeholder="username/Email"  />
<s:password name="password" class="password"  placeholder="password"   /> 
<s:select name="usertype" headerValue="----Select User Type----" headerKey="-1" list="{'ServiceProvider','Customer'}" class="usertype" />
<s:submit class="btnsubmit" value="Log In"/>

</s:form>

<div id="reg"><a href="registerPros.jsp"><input type="button" class="btnnewuser" value="New User? RegisterHere"></a></div>
<s:a href="#" onclick="popup()" >Forget Password</s:a>
<!-- END CODE FOR LOGIN PANEL  -->
<%} %>
</div>
<!-- contents for information pane-->
<div id="infoContent">
<hr>

<div id="infohead">How it Works?</div>
<table class="info">
<tr>
<td class="info">
<img src="images/search.png" alt="search">
</td>
<td class="info">
<img src="images/browse.png" alt="browse">
</td>
<td class="info"><img src="images/book.png" alt="book">
</td>
<td class="info">
<img src="images/enjoy.png" alt="enjoy">
</td>
</tr>
<tr>
<td class="info"><h2>Search for the great service providers near you</h2></td>
<td class="info"><h2>Pick your favourite based on experience, price, or friend recommendations</h2></td>
<td class="info"><h2>No more messy phone calls. Book anytime, anywhere and friendly reminders mean you never miss out.</h2></td>
<td class="info"><h2>Spend more time doing the things you love. With so many great babysitters, tutors, cleaners, handymen, masseuses, dogwalkers, cooks etc you can relax with peace of mind.</h2></td>
</tr>
</table>
</div>
<!-- end contents of information pane -->
<!-- BEGIN CLIENTS REVIEW PANE -->
<div id="ClientsContent">
<hr>
<div id="infohead">What Clients Says?</div><br><br><br><br>
<table class="clients" >

<!-- BEGIN  FIRST ROW OF CLIENT TABLE -->
<tr class="row">
<td class="info">
<h3>yeah i like it,this nbasbhbahsbdis too much ehbhasbhbdhahsdhshvdasvhj</h3>
</td>
<td class="clients">
<img src="images/clients/3.JPG"><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Zubin<br>
(Painter)
</b>
</center>
</span>
</td>

<td class="info">
<h3>yeah i like it</h3>
</td>
<td class="clients">
<img src="images/clients/4.JPG" ><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Zara<br>
(Housekeeping)
</b>
</center>
</span>
</td>

<td class="info">
<h3>yeah i like it,this nbasbhbahsbdis too much ehbhasbhbdhahsdhshvdasvhj</h3>
</td>
<td class="clients">
<img src="images/clients/5.JPG"><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Selena<br>
(Decorator)
</b>
</center>
</span>
</td>



</tr>

<!-- END FIRST ROW OF CLIENT TABLE -->


<!--BEGIN SECOND ROW  -->
<tr class="row">
<td class="info">
<h3>yeah i like it,this nbasbhbahsbdis too much ehbhasbhbdhahsdhshvdasvhj</h3>
</td>
<td class="clients">
<img src="images/clients/33.JPG" alt="search"><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Zoya<br>
(Personal assistant)
</b>
</center>
</span>
</td>

<td class="info">
<h3>yeah i like it,this nbasbhbahsbdis too much ehbhasbhbdhahsdhshvdasvhj</h3>
</td>
<td class="clients">
<img src="images/clients/7.JPG"><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Aleena<br>
(Tutor)
</b>
</center>
</span>
</td>

<td class="info">
<h3>yeah i like it,this nbasbhbahsbdis too much ehbhasbhbdhahsdhshvdasvhj</h3>
</td>
<td class="clients">
<img src="images/clients/2.JPG" ><br>
<span style="color:#008040;margin-left:70px";>
<center><b>
Sonam<br>
(Housekeeping)
</b>
</center>
</span>
</td>



</tr>
</table>
<jsp:include page="includes/footer.jsp"></jsp:include>
</div>





</div>
</div>
<jsp:include page="includes/header.jsp" ></jsp:include>

</body>


</html>