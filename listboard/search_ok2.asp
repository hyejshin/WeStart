<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>search page</title>

  <style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}

	h1{text-shadow: 4px 4px 5px pink; font-family:"HY�ٴ�M";}
	body{background-image: url("flower.jpg");}
-->
</style>

 </head>
 <body>
  <% 
		dim number, strSearchWord, strSearchOpt
		number=1
		strSearchWord = Request("searchWord")
		strSearchOpt = Request("searchOpt")
		
		Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "SELECT * FROM shj28 Where "+strSearchOpt+" like '%"+strSearchWord+"%'"
		Set rs = Conn.Execute(sql)
		%>

	<center><h1><b> �˻���� </b></h1></center>
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
			<%If rs.BOF or rs.EOF Then%>
		<TR bgcolor='#CEE3F6'>
			<TD colspan="5" align=center>�˻��� ���� �Խñ��� �����ϴ�.</TD>
		</TR>
		<%Else
			  Do%>
		<TR bgcolor='#CEE3F6'>
			<TD align=center><font size=2 color='black'><%=number%></font></TD>     
			<TD align=left>
				<a href="./view2.asp?idx=<%=rs("idx")%>">
				<font size=2 color="black"><%Response.Write rs("title")%></font></a>
			</TD>
			<TD align=center>
				<a href="./view2.asp?idx=<%=rs("idx")%>">
				<font size=2><%Response.Write rs("name")%></font>
			</TD>  
			<TD align=center>
				<font size=2 color="black"><%Response.Write Left(rs("date"), 10)%></font></a>     
			</TD>     
		   
			<TD align=center><font size=2><%Response.Write rs("visitor")%></font>
			</TD>  
		</TR>  
		<% 
		   rs.MoveNext
		   number=number+1
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
				<a href='listboard2.asp'><strong>[���]</strong></a>				
			</TD>
		</TR>
	</TABLE>


 </body>
</html>
