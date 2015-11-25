<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>write2 ok</title>
  </head>
  <body>
  		<% 
		dim strName, strPass, strEmail, strTitle, strContents
		strName = Session("username")
		strTitle = Request("title")
		strContents = Request("contents")
		strContents = Replace(strContents, vbLf, vbLf & "<br>")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"

		sql = "SELECT * FROM shj30 Where name = '" & strName & "'" 
		Set rs = Conn.Execute(sql)

		strPass = rs("pw")
		strEmail = rs("email")

		Conn.Close
		Set Conn = Nothing


		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "INSERT INTO shj28 (name, pass, email, title, contents, date, visitor) VALUES('"+strName+"', '"+strPass+"', '"+strEmail+"', '"+strTitle+"', '"+strContents+"', GetDate(), 0)"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = Nothing
		
		Response.Redirect ("listboard2.asp")
		%>

  </body>
</html>