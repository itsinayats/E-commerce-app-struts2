<%@page import="com.dao.SearchDAO"%>
<%@page import="bean.Objects.Provider"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/search.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>search</title>
</head>
<body>
<jsp:include page="includes/header.jsp"/>
<div id="ribbon">
<b>SortBy:</b>Name:&nbsp&nbsp<a href="searchResult?key=<%=request.getParameter("key")%>&sortby=f_name&order=ASC"><input type="image" src="images/icons/up.png" height="15px" width="15px"></a>
<a href="searchResult?key=<%=request.getParameter("key")%>&sortby=f_name&order=DESC"><input type="image" src="images/icons/down.png" height="15px" width="15px"></a>
||
<b>SortBy:</b>Price:&nbsp&nbsp<a href="searchResult?key=<%=request.getParameter("key")%>&sortby=fee_to_work&order=ASC"><input type="image" src="images/icons/up.png" height="15px" width="15px"></a>
<a href="searchResult?key=<%=request.getParameter("key")%>&sortby=fee_to_work&order=DESC"><input type="image" src="images/icons/down.png" height="15px" width="15px"></a>

</div>

<%! 
ArrayList<Provider> p; 
String sortby;
String order="ASC";
String category;
%>
<%
if(request.getParameter("sortby")!=null){
sortby=request.getParameter("sortby");
}
if(request.getParameter("order")!=null){
order=request.getParameter("order");
}
try{
String key=request.getParameter("key");
p=new SearchDAO().getResult(key,sortby,order);
}catch(Exception e){
	e.printStackTrace();
}

%>

<%
int i=0;
while(p!=null&&i<p.size())
{category=p.get(i).getCategory();
	%>
<div id="profileblock">
<table align="center">
<tr>




<td class="first">
<a href="$">
<%if((p.get(i).getProfilepic()!=null)&&(p.get(i).getProfilepic()=="")){ %>
<span class="profilepic"><img src="images/clients/<%=p.get(i).getProfilepic()%>" alt="image"></span>
<%}else{ %>
<span class="profilepic"><img src="images/icons/defaultprofilepic.png" alt="imagedefault"></span>
<%} %>
</a>
</td>



<td class="second">
<span class="username"><%=p.get(i).getF_name() %>&nbsp&nbsp<%=p.get(i).getL_name() %></span><span class="location"><%=p.get(i).getState()%></span><br>
<span class="rating">
<%int count=p.get(i).getRating();
for(int j=0;j<count;j++){
%>
<img src="images/icons/star.ico">
<%} %>
</span><br>
<%
String subcategory=p.get(i).getCategory();//p.get(i).getCategory();
try{
category=new SearchDAO().getParentCategory(subcategory);
}catch(Exception e){
e.printStackTrace();
}
%>
<span class="category">(<%= category.toUpperCase()%>)</span><br>
<span class="subcategory"><%= p.get(i).getCategory().toUpperCase() %></span><br>

<%if(p.get(i).getAvailable_from()!=null&&p.get(i).getAvailable_to()!=null){ %>
AVAILABLE FROM:  <span class="available"><%=p.get(i).getAvailable_from() %>to <%= p.get(i).getAvailable_to() %></span><br>
<%}else{ %>
AVAILABLE:  <span class="available">ANYTIME</span><br>
<%} %>
ABOUT ME<span class="aboutme">
<%=p.get(i).getAbout_me() %>
</span><br>
<hr>

<%
String fb=p.get(i).getFacebook();
String link="http://"+fb;
%>
FACEBOOK: <a href="<%=link %>"><%=link %></a>
</td>



<td class="third">
<span class="fee">Available At:<br><span style="font-size:35px;">Rs.<%=p.get(i).getFee() %>/- only<br><span style="font-size:15px;">*commodity charges Extra</span></span></span>
<span class="booknowbtn"><a href="#"><img src="images/icons/book_now.png" alt="book_now"></a></span>
</td>
</tr>
</table>
</div>
<%i++;} %>
<%if(p.size()==0){ %>
<H1 align="center">!!!Sorry!!<Br> No result found!!!</H1>
<%} %>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="includes/footer.jsp"/>
</body>
</html>