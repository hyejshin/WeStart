<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>���̵� �ߺ� Ȯ��</title>
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
				alert("��밡���� ���̵� �Դϴ�.");
			</script>
		<%Else%>
			<script language="javascript">
				alert("�ߺ��Ǵ� ���̵� �ֽ��ϴ�. ��� �Ұ����� ���̵� �Դϴ�.");
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
