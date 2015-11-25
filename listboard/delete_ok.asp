<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>delete_ok</title>
 </head>
 <body>
	<% 
		dim Num
		Num = Request("idx")

		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "Delete from shj28  Where idx= " & Num
		Conn.Execute(sql)

		sql = "Delete from shj28_c  Where key_value= " & Num
		Conn.Execute(sql)

		Conn.Close
		Set Conn = Nothing
		
		If Session("login") = "YES" Then
			Response.Redirect("listboard2.asp")
		Else
			Response.Redirect("listboard.asp")
		End If
		%>
 </body>
</html>
