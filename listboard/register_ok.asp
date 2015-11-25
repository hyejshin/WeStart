<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>register ok</title>
 </head>
 <body>
   <% 
		dim strID, strPW, strName, strEmail, strAddress, strZipcode
		strID = Request("id")
		strPW = Request("pw")
		strName = Request("name")
		strEmail = Request("email")
		strAddress = Request("address")
		strZipcode = Request("zipcode")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "INSERT INTO shj30 VALUES('"+strID+"', '"+strPW+"', '"+strName+"', '"+strEmail+"', '"+strAddress+"', '"+strZipcode+"')"
		Conn.Execute(sql)
		
		Conn.Close
		Set Conn = Nothing%>

		<script language="javascript">
			alert("회원가입이 완료되었습니다.");
		</script>

		<%
			If Session("login") = "YES" Then
				Response.Redirect("listboard2.asp")
			Else
				Response.Redirect("listboard.asp")
			End If
		%>

 </body>
</html>
