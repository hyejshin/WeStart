<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>View</title>
  <style type="text/css">


  </style>
  <style type='text/css'>
	<!--
	a:link		{font-family:"";color:black;text-decoration:none;}
	a:visited	{font-family:"";color:black;text-decoration:none;}
	a:hover		{font-family:"";color:black;text-decoration:underline;}

	h2{text-shadow: 4px 4px 5px pink; font-family:"HY바다M";}
	-->
</style>
<script language="JavaScript">
	function prev(index)
	{
		if (index==null)
			alert("마지막 페이지 입니다.");
		else
			window.location.href = "view2.asp?idx=" + index
	}
	function next(index)
	{
		if (index==null)
			alert("마지막 페이지 입니다.");
		else
			window.location.href = "view2.asp?idx=" + index
	}
</script>
  </head>
  <body>
	  <%
	    Dim Num, prev_idx, next_idx
	    Num = Request("idx")
	    Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"
		
		sql = "UPDATE shj28 SET visitor = visitor + 1 Where idx = " & Num
		Conn.Execute(sql)

		sql = "SELECT Min(idx) FROM shj28 Where idx > " & Num
		Set rs = Conn.Execute(sql)
		If Not rs.EOF Then
			prev_idx = rs(0)
		End If

		sql = "SELECT Max(idx) FROM shj28 Where idx < " & Num
		Set rs = Conn.Execute(sql)
		If Not rs.EOF Then
			next_idx = rs(0)
		End If

		
		sql = "SELECT * FROM shj28 Where idx = " & Num
		Set rs = Conn.Execute(sql)%>
			
	  <h2 style='text-align:center'>게시글 읽기</h2>
	  <table border='0' width='800' cellpadding='0' cellspacing='0' align='center'>
		<tr><td><hr size='1' noshade></td></tr>
	  </table>

	  <table border='0' width='800' align='center'>
		  <tr bgcolor='#F5A9A9'>
			  <td width="33%">작성자: <%Response.Write rs("name")%></td> 
			  <td align="center">제목: <%Response.Write rs("title")%></td>
			  <td align="right" width="33%">조회수: <%Response.Write rs("visitor")%></td>
		  </tr>
		  <tr bgcolor='#F6CECE'>
			  <td colspan="3"><br><br><%Response.Write rs("contents")%><br><br><br></td> 
		  </tr>
		  <tr align="right" bgcolor='#F6CECE'>
			  <td colspan="3">작성일:<%Response.Write rs("date")%></td> 
		  </tr>
	  </table>

	 <table border='0' width='800' cellpadding='0' cellspacing='0' align="center">
		<tr><td><hr size='1' noshade></td></tr>
	 </table>

	 <table border="0" width="800" align="center">
		  <tr>
			  <td style="text-align:left"><input type=button value="이전글" onClick="prev(<%=prev_idx%>);">
										<input type=button value="다음글" onClick="prev(<%=next_idx%>);"></td> 
			  <td style="text-align:right"><a href='./edit.asp?idx=<%=Num%>'>수정</a> | <a href='./delete.asp?idx=<%=Num%>'>삭제</a> |
									<a href='write2.asp'>등록</a> | <a href='listboard2.asp'>목록</a></td> 
		  </tr>
	 </table>
	  <br><br>

	  <form Action='comments_ok.asp' Method='post'>
	  <table border='0' width='800' cellpadding=2 cellspacing=1 align="center">
	  	<tr>
			<td width='100' bgcolor='#F5A9A9'>
				<font size='2'><center><b>name</b></center></font>
			</td>
			<td>
				<font size='2'><input type='text' size='12' name='name'></font>
			</td>
		</tr>
		<tr>
			<td width='100' bgcolor='#F5A9A9'>
				<font size='2'><center><b>comments</b></center></font>
			</td>
			<td>
				<font size='2'><input type='text' size='105' maxlength='50' name='comments'></font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<font size='2'><input type='submit' value='댓글달기'></font>
			</td>
		</tr>
	</table>
	<input type='hidden' name='key_value' value='<%=Num%>'>
	</form>
	<br>
	<%Conn.Close
		Set Conn = nothing
	%>

	<%
	    Set Conn = Server.CreateObject("ADODB.Connection")
		Conn.Open "webTestDB", "sa", "cs2010"

		sql = "SELECT * FROM shj28_c Where key_value = " & Num
		Set rs = Conn.Execute(sql)%>

	<table border='0' width='800' align='center' cellspacing=1 cellpadding=2>
	<%If Not rs.EOF Then
		Do%>
	   <tr>
			<td width="100" style="text-align:center" bgcolor='#F5A9A9'><%Response.Write rs("name")%> </td> 
			<td bgcolor='#F6CECE'><%Response.Write rs("comments")%></td>
			<td align="right" width="180" bgcolor='#F6CECE'><%Response.Write rs("date")%></td>
	   </tr> 
	<% 
	   rs.MoveNext
	   Loop While Not rs.EOF
	End If
	Conn.Close
	Set Conn = nothing%>
	</table>
	
  </body>
</html>