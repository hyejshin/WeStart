<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>edit</title>

 <script language="JavaScript">
	function Check(password)
	{
	if (Write.pass.value != password) {
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
		Write.pass.focus(); 
			return false;
		}
	else
		alert("�����Ǿ����ϴ�.");

		Write.submit();
	}
</script>
</head>

<BODY>
<%
  Dim Num
  Num = Request("idx")
  Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "SELECT * FROM shj28 Where idx = " & Num
		Set rs = Conn.Execute(sql)%>

<FORM Name='Write' Action='edit_ok.asp?idx=<%=Num%>' Method='post' OnSubmit='return Check(<%Response.write rs("pass")%>)'>
<center><font size='3'><b> �Խ��� �ۼ��� </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�ۼ���</b></center></font> 
		</TD>
		<TD>
			<p><input type='text' size='12' name='name' value='<%Response.Write rs("name")%>'> </p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>��й�ȣ</b></center></font>
		</TD>
		<TD>
			<p><input type='password' size='12' name='pass'> *��й�ȣ�� ��ġ���� ������ ���� ������ �� �����ϴ�.</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='40' maxlength='50' name='email' value='<%Response.Write rs("email")%>'></font>
		</TD>
	</TR>
	
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='title' value='<%Response.Write rs("title")%>'></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents'><%Response.Write rs("contents")%></textarea>
         		</font>
      		</TD>
	</TR>
		<%Conn.Close
		Set Conn = nothing
		%>
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD align='center' colspan='2' width='100%'>
		<TABLE>
			<TR>
				<TD width='100' align='center'>
					<input Type = 'button' Value = '��������' onClick="history.back()">
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '�����Ϸ�'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>
</BODY>
</HTML>