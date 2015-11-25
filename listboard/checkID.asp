<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>아이디 중복 확인</title>
 </head>
 <body>
	<% 
		dim strID
		strID = Request("id")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"

		sql = "SELECT * FROM shj30 Where id = '" & strID & "'"
		Set rs = Conn.Execute(sql)

		If rs.EOF Then%>
			<script language="javascript">
				alert("사용가능한 아이디 입니다.");
			</script>
		<%Else%>
			<script language="javascript">
				alert("중복되는 아이디가 있습니다. 사용 불가능한 아이디 입니다.");
			</script>
		<%End If
		
		Conn.Close
		Set Conn = Nothing
	%>
	<script language="javascript">
		history.back(-1);
	</script>
 </body>
</html>
