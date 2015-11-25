<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Create DB</title>
  </head>
  <body>
  		<%
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "CREATE TABLE shj28_c(idx int Identity(1, 1) Primary Key, key_value int, name char(10), comments char(100), date datetime)"
		'sql = "DROP TABLE shj28_c"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = nothing
		%>
  </body>
</html>