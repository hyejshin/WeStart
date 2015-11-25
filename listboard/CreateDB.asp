<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Document</title>
  <head>
    <title>Create DB</title>

  </head>
  <body>
  		<%
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "CREATE TABLE shj28(idx int Identity(1, 1) Primary Key, name char(10), pass char(10), email char(20), title char(30), contents char(500), date datetime, visitor int)"
		'sql = "DROP TABLE shj28"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = nothing
		%>
  </body>
</html>