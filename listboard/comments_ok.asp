<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>comments</title>
 </head>
 <body>
   <% 
		dim strName, strComments
		strName = Request("name")
		strComments = Request("comments")
		strKey = Request("key_value")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "INSERT INTO shj28_c (key_value, name, comments, date) VALUES('"+strKey+"', '"+strName+"', '"+strComments+"', GetDate())"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = Nothing
		
		Response.Redirect("./view.asp?idx="&strKey)
	%>
 </body>
</html>
