<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>delete</title>
   <script language="JavaScript">
	function Check(password)
	{
		if (Write.pass.value == password ){
			alert("�����Ǿ����ϴ�.");
			Write.submit();
		}
		else if (Write.pass.value == "0000"){
			alert("�����Ǿ����ϴ�.");
			Write.submit();
		}
		else{
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			Write.pass.focus(); 
				return false;
		}
	}
</script>
</head>

 <body>
	 <%
	  Dim Num
	  Num = Request("idx")
	  Set Conn = Server.CreateObject("ADODB.Connection")
			Conn.Open "webTestDB", "sa", "cs2010"
			
			sql = "SELECT * FROM shj28 Where idx = " & Num
			Set rs = Conn.Execute(sql)%>

	<FORM Name='Write' Action='delete_ok.asp?idx=<%=Num%>' Method='post' OnSubmit='return Check(<%Response.write rs("pass")%>)'>
	<br><br><br>
	<center> ��й�ȣ: <input type='password' size='12' name='pass'> <br><br>
						<input Type = 'Submit' Value = 'Ȯ��'>  <input Type = 'button' Value = '���' onClick="history.back()"></center>
	<%Conn.Close
	Set Conn = nothing
	%>
 </body>
</html>
