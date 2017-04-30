<%@page import="com.dao.MenuDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#categories{
	position: absolute;
	margin-left:25px;
	width:105%;
}
</style>
<link rel="stylesheet" href="../css/menu.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
ArrayList<String> listParent=MenuDAO.getMenuItems();
%>
<div id="categories">
<% int parentCount=listParent.size();
%>
<ul class="menu-menu">
 <li><a href="home">Home</a></li>

<%for(int i=0;i<listParent.size();i++){

%>

    <li>
   <% if(listParent.get(i).equalsIgnoreCase("others")){ %>
    <a href="search?category=<%=listParent.get(i)%>"><%=listParent.get(i)%></a>
    <%}else{%>
    <a href="#"><%=listParent.get(i)%></a>
   <%} %>
    <ul>
    <% ArrayList<String> listChild=MenuDAO.getSubMenuItems(listParent.get(i));%>
      
        <%for(int k=0;k<listChild.size();k++){ %>
        <li><a href="search?category=<%=listChild.get(k) %>"><%=listChild.get(k) %></a></li>
        <%} %>
    </ul>
  </li>



<%} %>
  <li><a href="http://">About Us</a></li>
  <li><a href="http://">Contact</a></li>
</ul>
</div>

</body>
</html>