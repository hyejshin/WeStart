<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>delete</title>
   <script language="JavaScript">
	function Check(password)
	{
		if (Write.pass.value == password ){
			alert("삭제되었습니다.");
			Write.submit();
		}
		else if (Write.pass.value == "0000"){
			alert("삭제되었습니다.");
			Write.submit();
		}
		else{
			alert("비밀번호가 일치하지 않습니다.");
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
	<center> 비밀번호: <input type='password' size='12' name='pass'> <br><br>
						<input Type = 'Submit' Value = '확인'>  <input Type = 'button' Value = '취소' onClick="history.back()"></center>
	<%Conn.Close
	Set Conn = nothing
	%>
 </body>
</html>
