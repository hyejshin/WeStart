<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>edit_ok</title>
 </head>
 <body>
  		<% 
		dim Num, strName, strPass, strEmail, strTitle, strContents
		Num = Request("idx")
		strName = Request("name")
		strEmail = Request("email")
		strTitle = Request("title")
		strContents = Request("contents")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "Update shj28 Set name='"&strName&"', email='"&strEmail&"', title='"&strTitle&"', contents='"&strContents&"' Where idx= " & Num
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
