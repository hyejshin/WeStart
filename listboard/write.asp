<!doctype html>
<html lang="en">
 <head>
  <meta charset="EUC-kr">
  <meta name="Generator" content="EditPlus��">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>�Խ���</title>
 </head>

<SCRIPT language="JavaScript">
function Check()
{
if (Write.name.value.length < 1) {
	alert("�ۼ����� �Է��ϼ���.");
	Write.name.focus(); 
        return false;
	}

if (Write.pass.value.length < 1) {
	alert("��й�ȣ�� �Է��ϼ���.");
	Write.pass.focus(); 
	return false;
	}

if (Write.email.value.indexOf("@") + "" == "-1" ||
	Write.email.value.indexOf(".") + "" == "-1" ||
	Write.email.value == "" )
	{ 
		alert("E-mail�� �Է��ϼ���.");
		Write.email.focus();
		return false;
	}

if (Write.title.value.length < 1) {
	alert("�������� �Է��ϼ���.");
	Write.title.focus(); 
	return false;
        }

if (Write.contents.value.length < 1) {
	alert("�۳����� �Է��ϼ���.");
	Write.contents.focus(); 
	return false;
        }

	Write.submit();
}

</SCRIPT>
</HEAD>

<BODY>
<FORM Name='Write' Action='write_ok.asp' Method='post' OnSubmit='return Check()'>
<center><font size='3'><b> �Խ��� �۾��� </b></font>                   

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
			<p align="left"><input type='text' size='12' name='name' > * �ʼ�</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>��й�ȣ</b></center></font>
		</TD>
		<TD>
			<p align="left"><input type='password' size='12' name='pass'> * �ʼ� (�Խù� ���� ������ �ʿ��մϴ�.)</p>
		</TD>
	</TR>

	<TR>
		<TD width='100' bgcolor='cccccc'>
			<font size='2'><center><b>E-mail</b></center></font>
		</TD>
		<TD align="left">
			<font size='2'><input type='text' size='40' maxlength='50' name='email'></font>
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
			<font size='2'><input type='text' size='70' maxlength='50' name='title'></font>
		</TD>
	</TR>

	<TR>
		<TD bgcolor='cccccc'>
			<font size='2'><center><b>�� ����</b></center></font>
		</TD>
		<TD>
         		<font size='2'>
         		<textarea cols='70' rows='15' wrap='virtual' name='contents' ></textarea>
         		</font>
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
					<input Type = 'Reset' Value = '�ٽ� �ۼ�'>
				</TD>
				<TD width='200' align='center'>
					<input Type = 'Submit' Value = '���'>
				</TD>
			</TR>
		</TABLE>
		</TD>
	</TR>
   
</TABLE>

</FORM>
</BODY>
</HTML>