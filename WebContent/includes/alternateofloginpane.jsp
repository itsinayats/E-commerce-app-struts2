<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
function slide(){
	window.scrollBy(50, 1000);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#alternate{
width: 100%;
position: relative;
}
#alternate table tr td{
border-right-style: solid;
color:silver;
font-size: 25px;
}
.link{
color:red;
}
.b{
color: blue;
}
</style>

</head>
<body>
<div id="alternate">
<marquee><h1 class="b">Welcome To HomeServices!!!</h1></marquee>
<table>
<tr>
<td>
<h3>we go for the New Moments,We go for the new World,we go just for you,
Coz,you are Special For us, Try visiting</h3>
</td>
<td>
<h3>
Extend your Business,Extend your world,Keep working,and keep earning,
we will always with you to help you.
<h3>

</td>
<td>
<h3>
Our company is india's leading company that provides something something..
stay updated.
</h3>

</td>
</tr>
</table>
<center>
<h2><a class="link" href="profile">Go to Your profile</a></h2>
<h2><a class="link" href="how it works" onclick="slide()">How it works</a></h2>
</center>
</div>
</body>
</html>