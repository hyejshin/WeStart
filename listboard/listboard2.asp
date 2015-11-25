<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>listboard</title>
<HEAD>
<TITLE> 회원 전용 게시판 </TITLE>

<style type='text/css'>
<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}
	
	h1{text-shadow: 4px 4px 5px pink; font-family:"HY바다M";}
-->
</style>
</HEAD>
<BODY>

<center><h1><b> 회원 전용 게시판 </b></h1></center>

<%
	If Session ("login") <> "YES" Then
		Response.Redirect ("listboard.asp")
	End If

	If Session("refresh") <> "YES" Then
		Session("refresh") = "YES"
		Response.Redirect ("listboard2.asp")
	Else
		Session("refresh") = "NO"
	End If
%>

<form Action='logout.asp' Method='post'>
<TABLE border='0' width='600' cellpadding='0' cellspacing='0' align='center'>
	<TR><strong>
		<TD><%Response.write(Session("username"))%>님 안녕하세요^^</TD>
		<TD align='right'><input type='submit' value='logout'></TD>
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
		<TD><font size=2><center><b>번호</b></center></font></TD>      
		<TD><font size=2><center><b>글 제목</b></center></font></TD>      
		<TD><font size=2><center><b>작성자</b></center></font></TD>      
		<TD><font size=2><center><b>작성일</b></center></font></TD>      
		<TD><font size=2><center><b>조회</b></center></font></TD>      
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
		<TD colspan="5" align=center>등록된 게시가 없습니다.</TD>
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
		<a href='write2.asp'><strong>[등록]</strong></a>				
		</TD>
	</TR>
</TABLE>
<br><br>
<div align='center'>
<form action='search_ok2.asp' Method='post'>
<strong>검색어:</strong> <input type='text' size='30' name='searchWord'>
	<select name="searchOpt" size="1">
		<option value="title" selected>제목</option>
		<option value="name">작성자</option>
		<option value="contents">내용</option>
	
	</select>
	<input type='submit' value='검색' >
</form>
</div>
</BODY>                     
</HTML>