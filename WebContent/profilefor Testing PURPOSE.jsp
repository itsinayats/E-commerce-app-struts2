
<%@page import="java.util.Date"%>
<%@page import="bean.Objects.ObjectFactory"%>
<%@page import="bean.Objects.Parent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script LANGUAGE="JavaScript">

function setedible(id){
document.getElementById(id).readOnly=false;
document.getElementById(id).focus();
}
function makeReadOnly(id){
	document.getElementById(id).readOnly=true;
}

function activatesave(){
	document.getElementById("save").disabled=false;
	document.getElementById("save").style.visibility="visible";
}
function disablesavebutton(){
	document.getElementById("save").style.visibility="hidden";
}
</script>
<!-- <meta content="5" http-equiv="refresh"> -->   
<link rel="stylesheet" href="css/profile.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>profile</title>
</head>

<% HttpSession s=request.getSession();
String userType=(String)s.getAttribute("usertype");
if(userType.equalsIgnoreCase("serviceProvider")){
userType="provider";                     //changed provider type as class name
}
Parent data=new ObjectFactory().getObject(userType); //Creating Dyanamic object of CUSTOMER AND PROVIDER CLASS
%>
<!-- BODY STARTS -->

<body  onload="disablesavebutton()">
<jsp:include page="/includes/header.jsp" />
<div id="contentPane">


<!-- START RIGHT SIDE OF SCREEN -->

<div id="profilepic">
<img src="images/clients/<%=data.getProfilepic()%>" style="border-style:groove;length:150px;width:150px;">

<%if(userType.equalsIgnoreCase("provider")){ %>
<br> User-Rating:
<%int count=data.getRating();
for(int i=0;i<count;i++){
	%>
	<img src="images/icons/star.ico" width="15px" height="15px">
<%}
%><hr>
<%} %>


<%if(userType.equalsIgnoreCase("customer")){ %>
<br> <%=userType.toUpperCase()+"-"%>ID:<%=data.getCust_id() %><hr>
<%}else{ %>
<br> <%=userType.toUpperCase()+"-"%>ID:<%=data.getSp_id() %><hr>
<%} %>





<br>Account Status:<span style="color:red"> <%= data.getStatus().toUpperCase() %></span>
<br> <span style="color:red"> <s:a href="DeactivateTemporarily">DeactivateTemporarily</s:a></span>
<%if(userType.equalsIgnoreCase("provider")){ %>
<hr>
<br>Availability Status:<span style="color:red"> <%= data.getAvailability_Status().toUpperCase() %></span>
<br> <span style="color:red"> <s:a href="DeactivateTemporarily">Change</s:a></span>
<%} %>


<hr><br><span style="color:red"> <s:a href="ChangePassword" >change Password</s:a></span>
<hr><br> <span style="color:red"> <s:a href="ChangePassword">change SecretKey</s:a></span>
<hr><br> <span style="color:red"> <s:a href="index.jsp">Home</s:a></span>

</div>
<!-- END RIGHT SIDE OF SCREEN -->
<% Date date=new Date();
out.print(date.toLocaleString());
%>
<center>
<div id="intro">
<s:form method="POST" action="profileAction">

<table id="profile">
<center><h1><u><%=userType.toUpperCase() %> Profile</u></h1></center>
<span style="color:red">Note:All fields are mandatory for activatation of your account.</span>
<span style="color:red">You will get an email regarding Activation of your account within a week! More details  <a href="terms" >click here</a></span>
<tr>
<td>UserName:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="username" readOnly="readonly"  type="text" value="<%= data.getUsername()%>" class="txt" >
<a href="#" id="username" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Available From:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailable_from()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Available to:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailable_to()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>





<tr>
<tr>
<td>First Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)"  id="fname" readOnly="readonly"    type="text"  value="<%= data.getF_name().toUpperCase()%>" class="txt"> 
<a href="#" id="fname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Last Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="lname" readOnly="readonly"   type="text" value="<%= data.getL_name().toUpperCase()%>" class="txt">
<a href="#" id="lname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Gender:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="gender" readOnly="readonly"   type="text" id="gender" value="<%= data.getGender().toUpperCase()%>" class="txt">
<a href="#" id="gender" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Date Of Birth:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="dob" readOnly="readonly"   type="text" id="dob" value="<%= data.getDob()%>" class="txt">
<a href="#" id="dob" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Email Id:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="email" readOnly="readonly"   type="text" id="email" value="<%= data.getEmail_id()%>" class="txt">
<a href="#" id="email" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Father's Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="faname" readOnly="readonly"   type="text" id="father" value="<%= data.getFathers_name().toUpperCase()%>" class="txt"> 
<a href="#" id="faname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>First Address:</td>
<td><textarea onchange="activatesave()" onblur="makeReadOnly(this.id)" id="fad" readOnly="readonly"   class="txt"><%= data.getFirst_address().toUpperCase()%></textarea>
<a href="#" id="fad" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Second Address(optional):</td>
<td><textarea onchange="activatesave()" onblur="makeReadOnly(this.id)" id="secad" readOnly="readonly"   class="txt"><%= data.getSecond_address().toUpperCase()%></textarea>
<a href="#" id="secad" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>City:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="city" readOnly="readonly"   type="text" id="city" value="<%= data.getCity().toUpperCase()%>" class="txt">
<a href="#" id="city" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>District:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="dist" readOnly="readonly"   type="text" id="father" value="<%= data.getDist().toUpperCase()%>" class="txt">
<a href="#" id="dist" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>State:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="state" readOnly="readonly"   type="text" id="father" value="<%= data.getState().toUpperCase()%>" class="txt">
<a href="#" id="state" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Country:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="country" readOnly="readonly"   type="text" id="father" value="<%= data.getCountry().toUpperCase()%>" class="txt">
<a href="#" id="country" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Pin:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="pin" readOnly="readonly"   type="text" id="father" value="<%= data.getPincode()%>" class="txt">
<a href="#" id="pin" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Highest Qualification:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="hq" readOnly="readonly"   type="text" id="father" value="<%= data.getQualification()%>" class="txt">
<a href="#" id="hq" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Aadhar Number:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getAadhar_number()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>PAN Number:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getPAN()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Fee to work:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getFee()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Category To Work:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getCategory()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<tr>
<td>Currenty Working As:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="wrk" readOnly="readonly"   type="text" id="father" value="<%= data.getWork()%>" class="txt">
<a href="#" id="wrk" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Facaebook:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="fb" readOnly="readonly"   type="text" id="father" value="<%= data.getFacebook()%>" class="txt">
<a href="#" id="fb" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Twitter:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="twtr" readOnly="readonly"   type="text" id="father" value="<%= data.getTwitter()%>" class="txt">
<a href="#" id="twtr" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>LinkedIn:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="lkn" readOnly="readonly"   type="text" id="father" value="<%= data.getLinkedin()%>" class="txt">
<a href="#" id="lkn" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Status:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="st" readOnly="readonly"   type="text" id="father" value="<%= data.getStatus()%>" class="txt">
<a href="#" id="st" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<tr>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Availability Status:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailability_Status()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<%if(userType.equals("customer")){ %>
<tr>
<td>Review:</td>
<td><textarea onchange="activatesave()" id="rvw" readOnly="readonly"   class="txt"> <%= data.getFeedback()%></textarea>
<a href="#" id="rvw" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<% }%>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Feedback:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getFeedback()%>" class="txt">
<a href="#" id="an onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>



</table>
<br><br><br>
<input type="submit" disabled="disabled" id="save" value="">&nbsp&nbsp&nbsp&nbsp
<a href="index.jsp" ><img id="exit" ></a>
</s:form>

</div>
</center>



<br><br><br><br>

</div>
<jsp:include page="/includes/footer.jsp" />

</body>
</html>