<%@page import="java.sql.Connection"%>
<%@page import="com.database.DataBaseConnection"%>
<%@page import="xtra.UserLoginAs"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="bean.Objects.ObjectFactory"%>
<%@page import="bean.Objects.Parent"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>test</title>
</head>
<body>
<% /* String usertype=UserLoginAs.getLoginAs().toLowerCase();
Connection cn=DataBaseConnection.connect(); */
out.print(UserLoginAs.getLoginAs()); 
%>
</body>
</html>