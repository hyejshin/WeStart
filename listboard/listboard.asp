<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>listboard</title>
<HEAD>
<TITLE> �Խ��� </TITLE>

<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
	
	h1{text-shadow: 4px 4px 5px pink; font-family:"HY�ٴ�M";}
-->
</style>
<%
	If Session ("login") = "YES" Then
		Response.Redirect ("listboard2.asp")
	End If

	If Session("refresh") <> "YES" Then
		Session("refresh") = "YES"
		Response.Redirect ("listboard.asp")
	Else
		Session("refresh") = "NO"
	End If
%>
</HEAD>
<BODY>

<center><h1><b> ��ȸ�� �Խ��� </b></h1></center>

<form Action='login.asp' Method='post'>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align='center'>
	<TR><strong>
		<TD><a href="register.asp">[ȸ������]</a></TD>
		<TD align='right'>ID<input type='text' size='10' name='id'> PW<input type='password' size='10' name='pw'> <input type='submit' value='login'></TD>
 	</strong></TR>
</TABLE>
</form>

<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align='center'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>              
                    
<TABLE border='0' cellspacing=1 cellpadding=2 width='600' align='center'>      

	<TR bgcolor='#81BEF7'>      
		<TD><font size=2><center><b>��ȣ</b></center></font></TD>      
		<TD><font size=2><center><b>�� ����</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>�ۼ���</b></center></font></TD>      
		<TD><font size=2><center><b>��ȸ</b></center></font></TD>      
	</TR>   
	
	<%Dim total, number
	  total=0

		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "SELECT * FROM shj28"
		Set rs = Conn.Execute(sql)

	  If rs.BOF or rs.EOF Then
		number=0
	  Else
	    Do
		total=total+1
		rs.MoveNext
	    Loop While Not rs.EOF
	  End If
		
	   number=total
		
		sql = "SELECT * FROM shj28 Order by idx Desc"
		Set rs = Conn.Execute(sql)
		
		If rs.BOF or rs.EOF Then%>
	<TR bgcolor='#CEE3F6'>
		<TD colspan="5" align=center>��ϵ� �Խð� �����ϴ�.</TD>
	</TR>
	<%Else
		  Do%>
	<TR bgcolor='#CEE3F6'>
		<TD align=center><font size=2 color='black'><%=number%></font></TD>     
		<TD align=left>
			<a href="./view.asp?idx=<%=rs("idx")%>">
			<font size=2 color="black"><%Response.Write rs("title")%></font></a>
		</TD>
		<TD align=center>
			<a href="./view.asp?idx=<%=rs("idx")%>">
			<font size=2><%Response.Write rs("name")%></font></a>
		</TD>  
		<TD align=center>
			<font size=2 color="black"><%Response.Write Left(rs("date"), 10)%></font>
		</TD>     
	   
		<TD align=center>
			<a href="./view.asp?idx=<%=rs("idx")%>">
			<font size=2><%Response.Write rs("visitor")%></font></a>
		</TD>  
	</TR>  
	<% 
	   rs.MoveNext
	   number=number-1
	   Loop While Not rs.EOF
	End If
	Conn.Close
	Set Conn = nothing	%>
</TABLE>     

<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align='center'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=600 align='center'>
	<TR>
		<TD align='right'>		
		<a href='write.asp'><strong>[���]</strong></a>				
		</TD>
	</TR>
</TABLE>
<br><br>
<div align='center'>
<form action='search_ok.asp' Method='post'>
<strong>�˻���:</strong> <input type='text' size='30' name='searchWord'>
	<select name="searchOpt" size="1">
		<option value="title" selected>����</option>
		<option value="name">�ۼ���</option>
		<option value="contents">����</option>
	
	</select>
	<input type='submit' value='�˻�' >
</form>
</div>
</BODY>                     
</HTML>