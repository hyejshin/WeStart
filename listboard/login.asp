<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>login</title>
 </head>
 <body>
	<% 
		dim strID, strPW
		strID = Request("id")
		strPW = Request("pw")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "SELECT * FROM shj30 Where id = '" & strID & "'" 
		Set rs = Conn.Execute(sql)

		If rs.EOF Or Trim(strPW) <> Trim(rs("pw")) Then%>
			<script language="JavaScript">
				alert("잘못된 아이디 또는 비밀번호 입니다.");
				history.back(-1);
			</script>	
		<%Else
			Session("login") = "YES"
			Session("username") = rs("name")
			Session.Timeout = 30
			Response.Redirect("listboard2.asp")	
		End If

		Conn.Close
		Set Conn = Nothing
		%>
 </body>
</html>
