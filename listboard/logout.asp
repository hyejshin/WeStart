<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>logout</title>
 </head>
 <body>
  <%
	Session("login") = "NO"
	Response.Redirect("listboard.asp")
	%>
 </body>
</html>
