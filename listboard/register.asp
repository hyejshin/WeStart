<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>회원가입</title>

  <SCRIPT language="JavaScript">
	function checkID(){
		var ID = Write.id.value;
		address = "checkID.asp?id="+ID;
		location.href=address;
	}

	function Check()
	{
	if (Write.id.value.length < 1) {
		alert("아이디를 입력하세요.");
		Write.id.focus(); 
			return false;
		}

	if (Write.pw.value.length < 1) {
		alert("비밀번호를 입력하세요.");
		Write.pw.focus(); 
		return false;
		}

	if (Write.name.value.length < 1) {
		alert("작성자을 입력하세요.");
		Write.name.focus(); 
			return false;
		}

	if (Write.email.value.indexOf("@") + "" == "-1" ||
		Write.email.value.indexOf(".") + "" == "-1" ||
		Write.email.value == "" )
		{ 
			alert("E-mail을 입력하세요.");
			Write.email.focus();
			return false;
		}

		Write.submit();
}
</SCRIPT>
</head>

<body>
<FORM Name='Write' Action='register_ok.asp' Method='post' OnSubmit='return Check()'>
<center><font size='3'><b> 회원가입 </b></font>                   

<TABLE border='0' width='600' cellpadding='0' cellspacing='0'>
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>

<TABLE border='0' width='600' cellpadding='2' cellspacing='2'>
	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>아이디</b></center></font> 
		</TD>
		<TD>
			<p align="left"><input type='text' size='12' name='id'> <input type='button' value='중복확인' onclick="checkID();"> *</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>비밀번호</b></center></font>
		</TD>
		<TD>
			<p align="left"><input type='password' size='12' name='pw'> *</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>이름</b></center></font> 
		</TD>
		<TD>
			<p align="left"><input type='text' size='12' name='name'> *</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD align="left">
			<font size='2'><input type='text' size='40' maxlength='50' name='email'>*</font>
		</TD>
	</TR>
	<TR>
      		<TD colspan='2' align="left">
         		* 필수항목
      		</TD>
	</TR>
	<TR>
      		<TD colspan='2'>
         		<hr size='1' noshade>
      		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>주소</b></center></font>
		</TD>
		<TD>
			<font size='2'><input type='text' size='70' maxlength='50' name='address'></font>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>우편번호</b></center></font> 
		</TD>
		<TD>
			<p align="left"><input type='text' size='12' name='zipcode'></p>
		</TD>
	</TR>

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
					<input Type = 'Reset' Value = '다시 작성'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '회원가입'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
</TABLE>
</FORM>


</body>
</HTML>
