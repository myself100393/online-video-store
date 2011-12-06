<%@page contentType="text/html;charset=UTF-8"%>
<HTML>
<HEAD>
<TITLE>Inputs</TITLE>
</HEAD>
<BODY>
<H1>Inputs</H1>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

boolean valid = true;

if(methodID != -1) methodID = Integer.parseInt(method);
switch (methodID){ 
case 2:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 5:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">endpoint:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="endpoint8" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 10:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 13:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">userId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="userId30" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 32:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username35" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 37:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId60" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 62:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">person:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">registration:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="registration67" SIZE=20></TD>
<%
java.text.DateFormat dateFormatregistration67 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExampregistration67  = new java.util.GregorianCalendar();
java.util.Date dateregistration67 = gcExampregistration67.getTime();
String tempResultregistration67 = dateFormatregistration67.format(dateregistration67);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultregistration67 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="password69" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="lastName71" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="firstName73" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="last_login75" SIZE=20></TD>
<%
java.text.DateFormat dateFormatlast_login75 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExamplast_login75  = new java.util.GregorianCalendar();
java.util.Date datelast_login75 = gcExamplast_login75.getTime();
String tempResultlast_login75 = dateFormatlast_login75.format(datelast_login75);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultlast_login75 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username77" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id79" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">account:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">ssn:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="ssn83" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="outstandingMovies85" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId87" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="monthlyFee89" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="balance91" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="userType93" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id95" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">address:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">zip:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="zip99" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId101" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">state:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="state103" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">country:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="country105" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="city107" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">street:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="street109" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id111" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 113:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username116" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">pwd:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="pwd118" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 120:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username137" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 139:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId170" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">month:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="month172" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">year:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="year174" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 176:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">userId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="userId193" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 195:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId198" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 200:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id203" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">firstName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="firstName205" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">lastName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="lastName207" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username209" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">registration:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="registration211" SIZE=20></TD>
<%
java.text.DateFormat dateFormatregistration211 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExampregistration211  = new java.util.GregorianCalendar();
java.util.Date dateregistration211 = gcExampregistration211.getTime();
String tempResultregistration211 = dateFormatregistration211.format(dateregistration211);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultregistration211 %> </TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">last_Login:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="last_Login213" SIZE=20></TD>
<%
java.text.DateFormat dateFormatlast_Login213 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExamplast_Login213  = new java.util.GregorianCalendar();
java.util.Date datelast_Login213 = gcExamplast_Login213.getTime();
String tempResultlast_Login213 = dateFormatlast_Login213.format(datelast_Login213);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultlast_Login213 %> </TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 215:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">movieId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="movieId234" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 236:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id239" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">name:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="name241" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">banner:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="banner243" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">release:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="release245" SIZE=20></TD>
<%
java.text.DateFormat dateFormatrelease245 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExamprelease245  = new java.util.GregorianCalendar();
java.util.Date daterelease245 = gcExamprelease245.getTime();
String tempResultrelease245 = dateFormatrelease245.format(daterelease245);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultrelease245 %> </TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">rentalPrice:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="rentalPrice247" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">category:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="category249" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">isAvailable:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="isAvailable251" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 253:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">movieId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="movieId256" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId258" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 260:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 263:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">movieId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="movieId266" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 268:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">movieId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="movieId271" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">personId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="personId273" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 275:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">movie:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">banner:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="banner280" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nbAvailable:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="nbAvailable282" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">name:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="name284" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">rentAmount:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="rentAmount286" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">releaseDate:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="releaseDate288" SIZE=20></TD>
<%
java.text.DateFormat dateFormatreleaseDate288 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExampreleaseDate288  = new java.util.GregorianCalendar();
java.util.Date datereleaseDate288 = gcExampreleaseDate288.getTime();
String tempResultreleaseDate288 = dateFormatreleaseDate288.format(datereleaseDate288);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultreleaseDate288 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id290" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 292:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">movie:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">banner:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="banner297" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">nbAvailable:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="nbAvailable299" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">name:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="name301" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">rentAmount:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="rentAmount303" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">releaseDate:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="releaseDate305" SIZE=20></TD>
<%
java.text.DateFormat dateFormatreleaseDate305 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExampreleaseDate305  = new java.util.GregorianCalendar();
java.util.Date datereleaseDate305 = gcExampreleaseDate305.getTime();
String tempResultreleaseDate305 = dateFormatreleaseDate305.format(datereleaseDate305);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultreleaseDate305 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id307" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 309:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">person:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">registration:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="registration314" SIZE=20></TD>
<%
java.text.DateFormat dateFormatregistration314 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExampregistration314  = new java.util.GregorianCalendar();
java.util.Date dateregistration314 = gcExampregistration314.getTime();
String tempResultregistration314 = dateFormatregistration314.format(dateregistration314);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultregistration314 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="password316" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="lastName318" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="firstName320" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="last_login322" SIZE=20></TD>
<%
java.text.DateFormat dateFormatlast_login322 = java.text.DateFormat.getDateInstance();
java.util.GregorianCalendar gcExamplast_login322  = new java.util.GregorianCalendar();
java.util.Date datelast_login322 = gcExamplast_login322.getTime();
String tempResultlast_login322 = dateFormatlast_login322.format(datelast_login322);
%>
<TD ALIGN="left">
</TR>
<TR>
<TD> </TD>
<TD ALIGN="left"> eg. <%= tempResultlast_login322 %> </TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="username324" SIZE=20></TD>
</TR>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="id326" SIZE=20></TD>
</TR>
</TABLE>
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">accountType:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="accountType328" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 330:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">userId:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="userId333" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 335:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 338:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 341:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 1111111111:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<TABLE>
<TR>
<TD COLSPAN="1" ALIGN="LEFT">URLString:</TD>
<TD ALIGN="left"><INPUT TYPE="TEXT" NAME="url1111111111" SIZE=20></TD>
</TR>
</TABLE>
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
case 1111111112:
valid = false;
%>
<FORM METHOD="POST" ACTION="Result.jsp" TARGET="result">
<INPUT TYPE="HIDDEN" NAME="method" VALUE="<%=method%>">
<BR>
<INPUT TYPE="SUBMIT" VALUE="Invoke">
<INPUT TYPE="RESET" VALUE="Clear">
</FORM>
<%
break;
}
if (valid) {
%>
Select a method to test.
<%
}
%>

</BODY>
</HTML>
