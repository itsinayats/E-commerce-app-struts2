
<%@page import="java.util.Date"%>
<%@page import="bean.Objects.ObjectFactory"%>
<%@page import="bean.Objects.Parent"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="/struts-tags" prefix="s" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.errorMessage{
	color:red;
}
</style>
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
	//document.getElementById("passwordform").style.visibility="hidden";
}
function showformperm(){
	document.getElementById("passwordform").style.visibility="visible";
}
function showform(){
	document.getElementById("passwordform").style.visibility="visible";
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
userType="provider"; //changed provider type as class name because the usertype here is "serviceprovider" but i want provider as my class
}
Parent data=new ObjectFactory().getObject(userType); //Creating Dyanamic object of CUSTOMER AND PROVIDER CLASS
%>

<!-- BODY-STARTS -->

<body  onload="disablesavebutton()">
<jsp:include page="/includes/header.jsp" />
<div id="contentPane">


<!-- START RIGHT SIDE OF SCREEN -->

<div id="profilepic">
<% if(data.getProfilepic()!=null&&data.getProfilepic()!=""){ %>
<img src="images/clients/<%=data.getProfilepic()%>" alt="Upload_profile_pic" style="width:150px;height:150px;border-radius:5px;">
<%}else{ %>
<img src="images/icons/defaultprofilepic.png" alt="Upload_profile_pic" style="width:150px;height:150px;border-radius:5px;">
<%} %>
<br>

<form action="upl8oad.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="fname"><br>
<%-- <s:property value="msgimage"/> --%>
<input type="image" src="images/icons/upload.png" width="150px" height="40px;">
</form>


<%if(userType.equalsIgnoreCase("provider")){ %>
<br> User-Rating:
<%int count=data.getRating();
for(int i=0;i<count;i++){
	%>
	<img src="images/icons/star.ico" width="20px" height="20px">
<%}
%><hr>

<%} %>


<%if(userType.equalsIgnoreCase("customer")){ %>
<br> <%=userType.toUpperCase()+"-"%>ID:<%=data.getCust_id() %><hr>
<%}else{ %>
<br> <%=userType.toUpperCase()+"-"%>ID:<%=data.getSp_id() %><hr>
<%} %>





<br>Account Status:<span style="color:red"> <%= data.getStatus() %></span>
<br> <span style="color:red"> <s:a href="deactivate">Change</s:a></span>
<%if(userType.equalsIgnoreCase("provider")){ %>
<hr>
<br>Availability Status:<span style="color:red"> <%= data.getAvailability_Status() %></span>
<br> <span style="color:red"> <s:a href="changeStatus">Change</s:a></span>
<%} %>
<hr><br> <span style="color:red"> <s:a href="dashboard.jsp">Dashboard</s:a></span>
<!--PASSWOD CHANGE FORM START  -->

<hr><br><span style="color:red"><a href="#" onclick="showform()" >Change Password</a><s:property value="msg"/></span>
<s:form action="changepassword" method="post" id="passwordform" onsubmit="showformperm" >
<s:password name="old_password" label="Old Password:"/>
<s:password name="new_password" label="New Password"/>
<s:password name="repeat_password" label="Repeat Password"/>
<s:submit value="Change"/>
</s:form>

<hr><br> <span style="color:red"> <s:a href="#">Change SecretKey</s:a><s:property value="secretmsg"/></span>

<s:form action="changekey" method="post">
<s:password name="newkey" label="New" /><br><span style="color:red;font-size:15px;">Required!when Password Is lost!!</span>
<s:submit value="change"></s:submit>
</s:form>

<hr><br> <span style="color:red"> <s:a href="index.jsp">Home</s:a></span>
</div>
<!-- END RIGHT SIDE OF SCREEN -->
<br><br><br><br><br>
<%-- <span style="color:blue;">
<h3>
<% Date date=new Date();
out.print(date.toLocaleString());
%>
</h3>
</span> --%>

<center>
<div id="intro">
<s:form method="POST" action="updateprofile">

<table id="profile">
<center><h1><u><%=userType.toUpperCase() %> Profile</u></h1></center>
<span style="color:red">Note:All fields are mandatory for activatation of your account.</span>
<span style="color:red">You will get an email regarding Activation of your account within a week! More details  <a href="terms" >click here</a></span>
<tr>
<td>UserName:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="username" readOnly="readonly"  type="text" value="<%= data.getUsername()%>" class="txt" >
<a href="#" id="username" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">Create username(can also logIn with)</span>
</td>
</tr>
<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Available From:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="avf" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailable_from()%>" class="txt">
<a href="#" id="avf" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(YYYY-MM-DD)</span>
</td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Available to:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="avt" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailable_to()%>" class="txt">
<a href="#" id="avt" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(YYYY-MM-DD)</span>
</td>
</tr>

<%} %>


<tr>
<tr>
<td>First Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)"  id="fname" readOnly="readonly"    type="text"  value="<%= data.getF_name().toUpperCase()%>" class="txt"> 
<!-- <a href="#" id="fname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a> -->
</td>

</tr>
<tr>
<td>Last Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="lname" readOnly="readonly"   type="text" value="<%= data.getL_name().toUpperCase()%>" class="txt">
<!-- <a href="#" id="lname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td> -->
</tr>
<tr>
<td>Gender:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="gender" readOnly="readonly"   type="text" id="gender" value="<%= data.getGender()%>" class="txt">
<a href="#" id="gender" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(M/F)</span>
</td>
</tr>




<tr>
<td>Date Of Birth:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="dob" readOnly="readonly"   type="text" id="dob" value="<%= data.getDob()%>" class="txt">
<a href="#" id="dob" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(YYYY/MM/DD)</span>
</td>
</tr>
<tr>
<td>Email Id:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="email" readOnly="readonly"   type="text" id="email" value="<%= data.getEmail_id()%>" class="txt">
<!-- <a href="#" id="email" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td> -->
</tr>
<tr>
<td>Father's Name:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="faname" readOnly="readonly"   type="text" id="father" value="<%= data.getFathers_name()%>" class="txt"> 
<a href="#" id="faname" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>First Address:</td>
<td><textarea onchange="activatesave()" onblur="makeReadOnly(this.id)" id="fad" readOnly="readonly"   class="txt"><%= data.getFirst_address()%></textarea>
<a href="#" id="fad" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Second Address(optional):</td>
<td><textarea onchange="activatesave()" onblur="makeReadOnly(this.id)" id="secad" readOnly="readonly"   class="txt"><%= data.getSecond_address()%></textarea>
<a href="#" id="secad" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>City:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="city" readOnly="readonly"   type="text" id="city" value="<%= data.getCity()%>" class="txt">
<a href="#" id="city" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>District:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="dist" readOnly="readonly"   type="text" id="father" value="<%= data.getDist()%>" class="txt">
<a href="#" id="dist" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>State:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="state" readOnly="readonly"   type="text" id="father" value="<%= data.getState()%>" class="txt">
<a href="#" id="state" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Country:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="country" readOnly="readonly"   type="text" id="father" value="<%= data.getCountry()%>" class="txt">
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
<a href="#" id="hq" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(eg.BTech/Mtech/Bsc..)</span>
</td>
</tr>
<tr>
<td>Aadhar Number:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="adhar" readOnly="readonly"   type="text" id="father" value="<%= data.getAadhar_number()%>" class="txt">
<a href="#" id="adhar" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(required for verification)</span>
</td>
</tr>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>PAN Number:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="pan" readOnly="readonly"   type="text" id="father" value="<%= data.getPAN()%>" class="txt">
<a href="#" id="pan" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(required for verification)</span>
</td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Fee to work:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="f2w" readOnly="readonly"   type="text" id="father" value="<%= data.getFee()%>" class="txt">
<a href="#" id="f2w" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(in Rs.)</span>
</td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Category To Work:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="an" readOnly="readonly"   type="text" id="father" value="<%= data.getCategory()%>" class="txt">
<!-- <a href="#" id="an" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td> -->
<span style="color:green;font-size:15px;">(can't change)</span>
</td>
</tr>

<%} %>

<tr>
<td>Currenty Working As:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="wrk" readOnly="readonly"   type="text" id="father" value="<%= data.getWork()%>" class="txt">
<a href="#" id="wrk" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>
<tr>
<td>Facebook:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="fb" readOnly="readonly"   type="text" id="father" value="<%= data.getFacebook()%>" class="txt">
<a href="#" id="fb" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(eg.http://facebook.com/example)</span>
</td>
</tr>
<tr>
<td>Twitter:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="twtr" readOnly="readonly"   type="text" id="father" value="<%= data.getTwitter()%>" class="txt">
<a href="#" id="twtr" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(eg.http://twitter.com/example)</span>
</td>
</tr>
<tr>
<td>LinkedIn:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="lkn" readOnly="readonly"   type="text" id="father" value="<%= data.getLinkedin()%>" class="txt">
<a href="#" id="lkn" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(eg.http://linkedin.com/example)</span>
</td>
</tr>
<tr>
<td>Status:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="st" readOnly="readonly"   type="text" id="father" value="<%= data.getStatus()%>" class="txt">
<a href="#" id="st" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(Active/DeActive)</span>
</td>
</tr>

<tr>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Availability Status:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="ast" readOnly="readonly"   type="text" id="father" value="<%= data.getAvailability_Status()%>" class="txt">
<a href="#" id="ast" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(Available/NA)</span>
</td>
</tr>

<%} %>

<tr>
<td>Review:</td>
<td><textarea onchange="activatesave()" id="rvw" readOnly="readonly"   class="txt"> <%= data.getFeedback()%></textarea>
<a href="#" id="rvw" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(How you feel about this website?)</span>
</td>
</tr>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>Feedback:</td>
<td><input onchange="activatesave()" onblur="makeReadOnly(this.id)" id="feed" readOnly="readonly"   type="text" id="father" value="<%= data.getFeedback()%>" class="txt">
<a href="#" id="feed" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a></td>
</tr>

<%} %>

<%if(userType.equalsIgnoreCase("provider")){ %>
<tr>
<td>About Me:</td>
<td><textarea onchange="activatesave()" onblur="makeReadOnly(this.id)" id="abt" readOnly="readonly"   class="txt"><%= data.getAbout_me()%></textarea>
<a href="#" id="abt" onclick="setedible(this.id)"><img width="15px" height="15px" src="images/edit.ico" alt="edit"></a>
<span style="color:green;font-size:15px;">(Tell Something about yourself)</span>
</td>
</tr>

<%} %>



</table>
<br><br><br>
<input type="submit" disabled="disabled" id="save" value="">&nbsp&nbsp&nbsp&nbsp
<a href="index.jsp" ><img id="exit" ></a>  <!-- image for exit button -->
</s:form>

</div>
</center>



<br><br><br><br>

</div>
<jsp:include page="/includes/footer.jsp" />

</body>
</html>