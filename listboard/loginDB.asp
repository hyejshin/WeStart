<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>login DB</title>
 </head>
 <body>
  <%
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "CREATE TABLE shj30( id char(10), pw char(10), name char(10), email char(20), address char(50), zipcode char(10))"
		'sql = "DROP TABLE shj30"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = nothing	
	%>
 </body>
</html>