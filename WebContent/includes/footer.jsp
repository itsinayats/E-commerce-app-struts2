<%@page import="com.dao.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/footer.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<div id="footer">

<table class="footercontent">
<tr>
<td><h1 align="center"><u>Contact US</u></</h1></td>
<td><h1 align="center"><u>Categories</u></</h1></td>
<td><h1 align="center"><u>About Us</u></</h1></td>

</tr>


<tr>

<td>
<b>
Delhi Meerut Road,Duhai<br>
Ghaziabad-201206<br>
contact:+919311982278
</b>
</td>
<!--STARTS CODE FOR CATEGORIES  -->
<td>
<ul><b>
<%

ArrayList<String> list=MenuDAO.getMenuItems();
int i=0;
while(i<list.size()){
	String cat="home";
	%>


<li><a  href="categoryPage.jsp?cat=<%= list.get(i) %>"> <%= list.get(i)%></a></li>


	
  <%

i++;
}
%>
</b>
</ul>
</td>





<!-- ENDS OF OF CATEGORIES -->

<td>
<p><b> We are the Number one Servicec provider At Home.We provider the dailyservices at home by 
simple call.This is fast and secure.We ensures your security and risk and go through
heigh level of security check,and verification process,
of the service providers <a href="more...">more</a></b></p>
</td>
</tr>
</table>

</div>
<h5 align="center" >&copy; 2015-2020 ServicesAtHome.com</h5>


</body>
</html>