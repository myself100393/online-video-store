<%@page contentType="text/html;charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<HTML>
<HEAD>
<TITLE>Result</TITLE>
</HEAD>
<BODY>
<H1>Result</H1>

<jsp:useBean id="sampleServiceProxyid" scope="session" class="video.connection.ServiceProxy" />
<%
if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
sampleServiceProxyid.setEndpoint(request.getParameter("endpoint"));
%>

<%
String method = request.getParameter("method");
int methodID = 0;
if (method == null) methodID = -1;

if(methodID != -1) methodID = Integer.parseInt(method);
boolean gotMethod = false;

try {
switch (methodID){ 
case 2:
        gotMethod = true;
        java.lang.String getEndpoint2mtemp = sampleServiceProxyid.getEndpoint();
if(getEndpoint2mtemp == null){
%>
<%=getEndpoint2mtemp %>
<%
}else{
        String tempResultreturnp3 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(getEndpoint2mtemp));
        %>
        <%= tempResultreturnp3 %>
        <%
}
break;
case 5:
        gotMethod = true;
        String endpoint_0id=  request.getParameter("endpoint8");
            java.lang.String endpoint_0idTemp = null;
        if(!endpoint_0id.equals("")){
         endpoint_0idTemp  = endpoint_0id;
        }
        sampleServiceProxyid.setEndpoint(endpoint_0idTemp);
break;
case 10:
        gotMethod = true;
        video.connection.Service getService10mtemp = sampleServiceProxyid.getService();
if(getService10mtemp == null){
%>
<%=getService10mtemp %>
<%
}else{
        if(getService10mtemp!= null){
        String tempreturnp11 = getService10mtemp.toString();
        %>
        <%=tempreturnp11%>
        <%
        }}
break;
case 13:
        gotMethod = true;
        String userId_1id=  request.getParameter("userId30");
        long userId_1idTemp  = Long.parseLong(userId_1id);
        video.dto.Address getAddress13mtemp = sampleServiceProxyid.getAddress(userId_1idTemp);
if(getAddress13mtemp == null){
%>
<%=getAddress13mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">zip:</TD>
<TD>
<%
if(getAddress13mtemp != null){
java.lang.String typezip16 = getAddress13mtemp.getZip();
        String tempResultzip16 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typezip16));
        %>
        <%= tempResultzip16 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAddress13mtemp != null){
%>
<%=getAddress13mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">state:</TD>
<TD>
<%
if(getAddress13mtemp != null){
java.lang.String typestate20 = getAddress13mtemp.getState();
        String tempResultstate20 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestate20));
        %>
        <%= tempResultstate20 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">country:</TD>
<TD>
<%
if(getAddress13mtemp != null){
java.lang.String typecountry22 = getAddress13mtemp.getCountry();
        String tempResultcountry22 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecountry22));
        %>
        <%= tempResultcountry22 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">city:</TD>
<TD>
<%
if(getAddress13mtemp != null){
java.lang.String typecity24 = getAddress13mtemp.getCity();
        String tempResultcity24 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typecity24));
        %>
        <%= tempResultcity24 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">street:</TD>
<TD>
<%
if(getAddress13mtemp != null){
java.lang.String typestreet26 = getAddress13mtemp.getStreet();
        String tempResultstreet26 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typestreet26));
        %>
        <%= tempResultstreet26 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAddress13mtemp != null){
%>
<%=getAddress13mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 32:
        gotMethod = true;
        String userId_2id=  request.getParameter("userId35");
        int userId_2idTemp  = Integer.parseInt(userId_2id);
        java.lang.String logout32mtemp = sampleServiceProxyid.logout(userId_2idTemp);
if(logout32mtemp == null){
%>
<%=logout32mtemp %>
<%
}else{
        String tempResultreturnp33 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logout32mtemp));
        %>
        <%= tempResultreturnp33 %>
        <%
}
break;
case 37:
        gotMethod = true;
        String registration_4id=  request.getParameter("registration42");
            java.util.Calendar registration_4idTemp = null;
        if(!registration_4id.equals("")){
        java.text.DateFormat dateFormatregistration42 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration42  = dateFormatregistration42.parse(registration_4id);
         registration_4idTemp = new java.util.GregorianCalendar();
        registration_4idTemp.setTime(dateTempregistration42);
        }
        String password_5id=  request.getParameter("password44");
            java.lang.String password_5idTemp = null;
        if(!password_5id.equals("")){
         password_5idTemp  = password_5id;
        }
        String lastName_6id=  request.getParameter("lastName46");
            java.lang.String lastName_6idTemp = null;
        if(!lastName_6id.equals("")){
         lastName_6idTemp  = lastName_6id;
        }
        String firstName_7id=  request.getParameter("firstName48");
            java.lang.String firstName_7idTemp = null;
        if(!firstName_7id.equals("")){
         firstName_7idTemp  = firstName_7id;
        }
        String last_login_8id=  request.getParameter("last_login50");
            java.util.Calendar last_login_8idTemp = null;
        if(!last_login_8id.equals("")){
        java.text.DateFormat dateFormatlast_login50 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login50  = dateFormatlast_login50.parse(last_login_8id);
         last_login_8idTemp = new java.util.GregorianCalendar();
        last_login_8idTemp.setTime(dateTemplast_login50);
        }
        String username_9id=  request.getParameter("username52");
            java.lang.String username_9idTemp = null;
        if(!username_9id.equals("")){
         username_9idTemp  = username_9id;
        }
        String id_10id=  request.getParameter("id54");
        long id_10idTemp  = Long.parseLong(id_10id);
        %>
        <jsp:useBean id="video1dto1Person_3id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_3id.setRegistration(registration_4idTemp);
        video1dto1Person_3id.setPassword(password_5idTemp);
        video1dto1Person_3id.setLastName(lastName_6idTemp);
        video1dto1Person_3id.setFirstName(firstName_7idTemp);
        video1dto1Person_3id.setLast_login(last_login_8idTemp);
        video1dto1Person_3id.setUsername(username_9idTemp);
        video1dto1Person_3id.setId(id_10idTemp);
        String ssn_12id=  request.getParameter("ssn58");
            java.lang.String ssn_12idTemp = null;
        if(!ssn_12id.equals("")){
         ssn_12idTemp  = ssn_12id;
        }
        String outstandingMovies_13id=  request.getParameter("outstandingMovies60");
        int outstandingMovies_13idTemp  = Integer.parseInt(outstandingMovies_13id);
        String personId_14id=  request.getParameter("personId62");
        long personId_14idTemp  = Long.parseLong(personId_14id);
        String monthlyFee_15id=  request.getParameter("monthlyFee64");
        double monthlyFee_15idTemp  = Double.parseDouble(monthlyFee_15id);
        String balance_16id=  request.getParameter("balance66");
        double balance_16idTemp  = Double.parseDouble(balance_16id);
        String userType_17id=  request.getParameter("userType68");
        int userType_17idTemp  = Integer.parseInt(userType_17id);
        String id_18id=  request.getParameter("id70");
        long id_18idTemp  = Long.parseLong(id_18id);
        %>
        <jsp:useBean id="video1dto1Account_11id" scope="session" class="video.dto.Account" />
        <%
        video1dto1Account_11id.setSsn(ssn_12idTemp);
        video1dto1Account_11id.setOutstandingMovies(outstandingMovies_13idTemp);
        video1dto1Account_11id.setPersonId(personId_14idTemp);
        video1dto1Account_11id.setMonthlyFee(monthlyFee_15idTemp);
        video1dto1Account_11id.setBalance(balance_16idTemp);
        video1dto1Account_11id.setUserType(userType_17idTemp);
        video1dto1Account_11id.setId(id_18idTemp);
        String zip_20id=  request.getParameter("zip74");
            java.lang.String zip_20idTemp = null;
        if(!zip_20id.equals("")){
         zip_20idTemp  = zip_20id;
        }
        String personId_21id=  request.getParameter("personId76");
        long personId_21idTemp  = Long.parseLong(personId_21id);
        String state_22id=  request.getParameter("state78");
            java.lang.String state_22idTemp = null;
        if(!state_22id.equals("")){
         state_22idTemp  = state_22id;
        }
        String country_23id=  request.getParameter("country80");
            java.lang.String country_23idTemp = null;
        if(!country_23id.equals("")){
         country_23idTemp  = country_23id;
        }
        String city_24id=  request.getParameter("city82");
            java.lang.String city_24idTemp = null;
        if(!city_24id.equals("")){
         city_24idTemp  = city_24id;
        }
        String street_25id=  request.getParameter("street84");
            java.lang.String street_25idTemp = null;
        if(!street_25id.equals("")){
         street_25idTemp  = street_25id;
        }
        String id_26id=  request.getParameter("id86");
        long id_26idTemp  = Long.parseLong(id_26id);
        %>
        <jsp:useBean id="video1dto1Address_19id" scope="session" class="video.dto.Address" />
        <%
        video1dto1Address_19id.setZip(zip_20idTemp);
        video1dto1Address_19id.setPersonId(personId_21idTemp);
        video1dto1Address_19id.setState(state_22idTemp);
        video1dto1Address_19id.setCountry(country_23idTemp);
        video1dto1Address_19id.setCity(city_24idTemp);
        video1dto1Address_19id.setStreet(street_25idTemp);
        video1dto1Address_19id.setId(id_26idTemp);
        java.lang.String updatePersonAccount37mtemp = sampleServiceProxyid.updatePersonAccount(video1dto1Person_3id,video1dto1Account_11id,video1dto1Address_19id);
if(updatePersonAccount37mtemp == null){
%>
<%=updatePersonAccount37mtemp %>
<%
}else{
        String tempResultreturnp38 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonAccount37mtemp));
        %>
        <%= tempResultreturnp38 %>
        <%
}
break;
case 88:
        gotMethod = true;
        String username_27id=  request.getParameter("username91");
            java.lang.String username_27idTemp = null;
        if(!username_27id.equals("")){
         username_27idTemp  = username_27id;
        }
        boolean isUsernameExisted88mtemp = sampleServiceProxyid.isUsernameExisted(username_27idTemp);
        String tempResultreturnp89 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(isUsernameExisted88mtemp));
        %>
        <%= tempResultreturnp89 %>
        <%
break;
case 93:
        gotMethod = true;
        video.dto.Movie[] listMovies93mtemp = sampleServiceProxyid.listMovies();
if(listMovies93mtemp == null){
%>
<%=listMovies93mtemp %>
<%
}else{
        String tempreturnp94 = null;
        if(listMovies93mtemp != null){
        java.util.List listreturnp94= java.util.Arrays.asList(listMovies93mtemp);
        tempreturnp94 = listreturnp94.toString();
        }
        %>
        <%=tempreturnp94%>
        <%
}
break;
case 96:
        gotMethod = true;
        String movieId_28id=  request.getParameter("movieId99");
        int movieId_28idTemp  = Integer.parseInt(movieId_28id);
        String personId_29id=  request.getParameter("personId101");
        int personId_29idTemp  = Integer.parseInt(personId_29id);
        java.lang.String issueMovie96mtemp = sampleServiceProxyid.issueMovie(movieId_28idTemp,personId_29idTemp);
if(issueMovie96mtemp == null){
%>
<%=issueMovie96mtemp %>
<%
}else{
        String tempResultreturnp97 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(issueMovie96mtemp));
        %>
        <%= tempResultreturnp97 %>
        <%
}
break;
case 103:
        gotMethod = true;
        String movieId_30id=  request.getParameter("movieId106");
        int movieId_30idTemp  = Integer.parseInt(movieId_30id);
        String personId_31id=  request.getParameter("personId108");
        int personId_31idTemp  = Integer.parseInt(personId_31id);
        java.lang.String submitMovie103mtemp = sampleServiceProxyid.submitMovie(movieId_30idTemp,personId_31idTemp);
if(submitMovie103mtemp == null){
%>
<%=submitMovie103mtemp %>
<%
}else{
        String tempResultreturnp104 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitMovie103mtemp));
        %>
        <%= tempResultreturnp104 %>
        <%
}
break;
case 110:
        gotMethod = true;
        String registration_33id=  request.getParameter("registration115");
            java.util.Calendar registration_33idTemp = null;
        if(!registration_33id.equals("")){
        java.text.DateFormat dateFormatregistration115 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration115  = dateFormatregistration115.parse(registration_33id);
         registration_33idTemp = new java.util.GregorianCalendar();
        registration_33idTemp.setTime(dateTempregistration115);
        }
        String password_34id=  request.getParameter("password117");
            java.lang.String password_34idTemp = null;
        if(!password_34id.equals("")){
         password_34idTemp  = password_34id;
        }
        String lastName_35id=  request.getParameter("lastName119");
            java.lang.String lastName_35idTemp = null;
        if(!lastName_35id.equals("")){
         lastName_35idTemp  = lastName_35id;
        }
        String firstName_36id=  request.getParameter("firstName121");
            java.lang.String firstName_36idTemp = null;
        if(!firstName_36id.equals("")){
         firstName_36idTemp  = firstName_36id;
        }
        String last_login_37id=  request.getParameter("last_login123");
            java.util.Calendar last_login_37idTemp = null;
        if(!last_login_37id.equals("")){
        java.text.DateFormat dateFormatlast_login123 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login123  = dateFormatlast_login123.parse(last_login_37id);
         last_login_37idTemp = new java.util.GregorianCalendar();
        last_login_37idTemp.setTime(dateTemplast_login123);
        }
        String username_38id=  request.getParameter("username125");
            java.lang.String username_38idTemp = null;
        if(!username_38id.equals("")){
         username_38idTemp  = username_38id;
        }
        String id_39id=  request.getParameter("id127");
        long id_39idTemp  = Long.parseLong(id_39id);
        %>
        <jsp:useBean id="video1dto1Person_32id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_32id.setRegistration(registration_33idTemp);
        video1dto1Person_32id.setPassword(password_34idTemp);
        video1dto1Person_32id.setLastName(lastName_35idTemp);
        video1dto1Person_32id.setFirstName(firstName_36idTemp);
        video1dto1Person_32id.setLast_login(last_login_37idTemp);
        video1dto1Person_32id.setUsername(username_38idTemp);
        video1dto1Person_32id.setId(id_39idTemp);
        String accountType_40id=  request.getParameter("accountType129");
        int accountType_40idTemp  = Integer.parseInt(accountType_40id);
        java.lang.String signUp110mtemp = sampleServiceProxyid.signUp(video1dto1Person_32id,accountType_40idTemp);
if(signUp110mtemp == null){
%>
<%=signUp110mtemp %>
<%
}else{
        String tempResultreturnp111 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp110mtemp));
        %>
        <%= tempResultreturnp111 %>
        <%
}
break;
case 131:
        gotMethod = true;
        String username_41id=  request.getParameter("username134");
            java.lang.String username_41idTemp = null;
        if(!username_41id.equals("")){
         username_41idTemp  = username_41id;
        }
        String pwd_42id=  request.getParameter("pwd136");
            java.lang.String pwd_42idTemp = null;
        if(!pwd_42id.equals("")){
         pwd_42idTemp  = pwd_42id;
        }
        java.lang.String logon131mtemp = sampleServiceProxyid.logon(username_41idTemp,pwd_42idTemp);
if(logon131mtemp == null){
%>
<%=logon131mtemp %>
<%
}else{
        String tempResultreturnp132 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logon131mtemp));
        %>
        <%= tempResultreturnp132 %>
        <%
}
break;
case 138:
        gotMethod = true;
        String username_43id=  request.getParameter("username155");
            java.lang.String username_43idTemp = null;
        if(!username_43id.equals("")){
         username_43idTemp  = username_43id;
        }
        video.dto.Person getPerson138mtemp = sampleServiceProxyid.getPerson(username_43idTemp);
if(getPerson138mtemp == null){
%>
<%=getPerson138mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">registration:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.util.Calendar typeregistration141 = getPerson138mtemp.getRegistration();
        java.text.DateFormat dateFormatregistration141 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration141 = typeregistration141.getTime();
        String tempResultregistration141 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration141.format(dateregistration141));
        %>
        <%= tempResultregistration141 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.lang.String typepassword143 = getPerson138mtemp.getPassword();
        String tempResultpassword143 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword143));
        %>
        <%= tempResultpassword143 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.lang.String typelastName145 = getPerson138mtemp.getLastName();
        String tempResultlastName145 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName145));
        %>
        <%= tempResultlastName145 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.lang.String typefirstName147 = getPerson138mtemp.getFirstName();
        String tempResultfirstName147 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName147));
        %>
        <%= tempResultfirstName147 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.util.Calendar typelast_login149 = getPerson138mtemp.getLast_login();
        java.text.DateFormat dateFormatlast_login149 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login149 = typelast_login149.getTime();
        String tempResultlast_login149 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login149.format(datelast_login149));
        %>
        <%= tempResultlast_login149 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD>
<%
if(getPerson138mtemp != null){
java.lang.String typeusername151 = getPerson138mtemp.getUsername();
        String tempResultusername151 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername151));
        %>
        <%= tempResultusername151 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getPerson138mtemp != null){
%>
<%=getPerson138mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 157:
        gotMethod = true;
        String userId_44id=  request.getParameter("userId174");
        long userId_44idTemp  = Long.parseLong(userId_44id);
        video.dto.Account getAccount157mtemp = sampleServiceProxyid.getAccount(userId_44idTemp);
if(getAccount157mtemp == null){
%>
<%=getAccount157mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">ssn:</TD>
<TD>
<%
if(getAccount157mtemp != null){
java.lang.String typessn160 = getAccount157mtemp.getSsn();
        String tempResultssn160 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn160));
        %>
        <%= tempResultssn160 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getOutstandingMovies()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getMonthlyFee()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getBalance()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getUserType()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAccount157mtemp != null){
%>
<%=getAccount157mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 176:
        gotMethod = true;
        String personId_45id=  request.getParameter("personId179");
        int personId_45idTemp  = Integer.parseInt(personId_45id);
        java.lang.String deletePerson176mtemp = sampleServiceProxyid.deletePerson(personId_45idTemp);
if(deletePerson176mtemp == null){
%>
<%=deletePerson176mtemp %>
<%
}else{
        String tempResultreturnp177 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deletePerson176mtemp));
        %>
        <%= tempResultreturnp177 %>
        <%
}
break;
case 181:
        gotMethod = true;
        String personId_46id=  request.getParameter("personId204");
        int personId_46idTemp  = Integer.parseInt(personId_46id);
        video.dto.PersonInfo displayPerson181mtemp = sampleServiceProxyid.displayPerson(personId_46idTemp);
if(displayPerson181mtemp == null){
%>
<%=displayPerson181mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">person:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">registration:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typeregistration186 = tebece0.getRegistration();
        java.text.DateFormat dateFormatregistration186 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration186 = typeregistration186.getTime();
        String tempResultregistration186 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration186.format(dateregistration186));
        %>
        <%= tempResultregistration186 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">password:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.lang.String typepassword188 = tebece0.getPassword();
        String tempResultpassword188 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword188));
        %>
        <%= tempResultpassword188 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.lang.String typelastName190 = tebece0.getLastName();
        String tempResultlastName190 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName190));
        %>
        <%= tempResultlastName190 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.lang.String typefirstName192 = tebece0.getFirstName();
        String tempResultfirstName192 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName192));
        %>
        <%= tempResultfirstName192 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typelast_login194 = tebece0.getLast_login();
        java.text.DateFormat dateFormatlast_login194 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login194 = typelast_login194.getTime();
        String tempResultlast_login194 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login194.format(datelast_login194));
        %>
        <%= tempResultlast_login194 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
java.lang.String typeusername196 = tebece0.getUsername();
        String tempResultusername196 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername196));
        %>
        <%= tempResultusername196 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Person tebece0=displayPerson181mtemp.getPerson();
if(tebece0 != null){
%>
<%=tebece0.getId()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listActualRentMovie:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Movie[] typelistActualRentMovie200 = displayPerson181mtemp.getListActualRentMovie();
        String templistActualRentMovie200 = null;
        if(typelistActualRentMovie200 != null){
        java.util.List listlistActualRentMovie200= java.util.Arrays.asList(typelistActualRentMovie200);
        templistActualRentMovie200 = listlistActualRentMovie200.toString();
        }
        %>
        <%=templistActualRentMovie200%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(displayPerson181mtemp != null){
video.dto.Movie[] typelistRentMovie202 = displayPerson181mtemp.getListRentMovie();
        String templistRentMovie202 = null;
        if(typelistRentMovie202 != null){
        java.util.List listlistRentMovie202= java.util.Arrays.asList(typelistRentMovie202);
        templistRentMovie202 = listlistRentMovie202.toString();
        }
        %>
        <%=templistRentMovie202%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 206:
        gotMethod = true;
        String id_47id=  request.getParameter("id209");
        long id_47idTemp  = Long.parseLong(id_47id);
        String firstName_48id=  request.getParameter("firstName211");
            java.lang.String firstName_48idTemp = null;
        if(!firstName_48id.equals("")){
         firstName_48idTemp  = firstName_48id;
        }
        String lastName_49id=  request.getParameter("lastName213");
            java.lang.String lastName_49idTemp = null;
        if(!lastName_49id.equals("")){
         lastName_49idTemp  = lastName_49id;
        }
        String username_50id=  request.getParameter("username215");
            java.lang.String username_50idTemp = null;
        if(!username_50id.equals("")){
         username_50idTemp  = username_50id;
        }
        String registration_51id=  request.getParameter("registration217");
            java.util.Calendar registration_51idTemp = null;
        if(!registration_51id.equals("")){
        java.text.DateFormat dateFormatregistration217 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration217  = dateFormatregistration217.parse(registration_51id);
         registration_51idTemp = new java.util.GregorianCalendar();
        registration_51idTemp.setTime(dateTempregistration217);
        }
        String last_Login_52id=  request.getParameter("last_Login219");
            java.util.Calendar last_Login_52idTemp = null;
        if(!last_Login_52id.equals("")){
        java.text.DateFormat dateFormatlast_Login219 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_Login219  = dateFormatlast_Login219.parse(last_Login_52id);
         last_Login_52idTemp = new java.util.GregorianCalendar();
        last_Login_52idTemp.setTime(dateTemplast_Login219);
        }
        video.dto.Person[] find_Persons206mtemp = sampleServiceProxyid.find_Persons(id_47idTemp,firstName_48idTemp,lastName_49idTemp,username_50idTemp,registration_51idTemp,last_Login_52idTemp);
if(find_Persons206mtemp == null){
%>
<%=find_Persons206mtemp %>
<%
}else{
        String tempreturnp207 = null;
        if(find_Persons206mtemp != null){
        java.util.List listreturnp207= java.util.Arrays.asList(find_Persons206mtemp);
        tempreturnp207 = listreturnp207.toString();
        }
        %>
        <%=tempreturnp207%>
        <%
}
break;
case 221:
        gotMethod = true;
        String movieId_53id=  request.getParameter("movieId240");
        int movieId_53idTemp  = Integer.parseInt(movieId_53id);
        video.dto.MovieInfo displayMovie221mtemp = sampleServiceProxyid.displayMovie(movieId_53idTemp);
if(displayMovie221mtemp == null){
%>
<%=displayMovie221mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">movie:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">banner:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
java.lang.String typebanner226 = tebece0.getBanner();
        String tempResultbanner226 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typebanner226));
        %>
        <%= tempResultbanner226 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">nbAvailable:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
%>
<%=tebece0.getNbAvailable()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">name:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
java.lang.String typename230 = tebece0.getName();
        String tempResultname230 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typename230));
        %>
        <%= tempResultname230 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">rentAmount:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
%>
<%=tebece0.getRentAmount()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">releaseDate:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
java.lang.String typereleaseDate234 = tebece0.getReleaseDate();
        String tempResultreleaseDate234 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typereleaseDate234));
        %>
        <%= tempResultreleaseDate234 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Movie tebece0=displayMovie221mtemp.getMovie();
if(tebece0 != null){
%>
<%=tebece0.getId()
%><%}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listPerson:</TD>
<TD>
<%
if(displayMovie221mtemp != null){
video.dto.Person[] typelistPerson238 = displayMovie221mtemp.getListPerson();
        String templistPerson238 = null;
        if(typelistPerson238 != null){
        java.util.List listlistPerson238= java.util.Arrays.asList(typelistPerson238);
        templistPerson238 = listlistPerson238.toString();
        }
        %>
        <%=templistPerson238%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 242:
        gotMethod = true;
        String id_54id=  request.getParameter("id245");
        long id_54idTemp  = Long.parseLong(id_54id);
        String name_55id=  request.getParameter("name247");
            java.lang.String name_55idTemp = null;
        if(!name_55id.equals("")){
         name_55idTemp  = name_55id;
        }
        String banner_56id=  request.getParameter("banner249");
            java.lang.String banner_56idTemp = null;
        if(!banner_56id.equals("")){
         banner_56idTemp  = banner_56id;
        }
        String release_57id=  request.getParameter("release251");
            java.lang.String release_57idTemp = null;
        if(!release_57id.equals("")){
         release_57idTemp  = release_57id;
        }
        String rentalPrice_58id=  request.getParameter("rentalPrice253");
        double rentalPrice_58idTemp  = Double.parseDouble(rentalPrice_58id);
        String category_59id=  request.getParameter("category255");
        int category_59idTemp  = Integer.parseInt(category_59id);
        String isAvailable_60id=  request.getParameter("isAvailable257");
        boolean isAvailable_60idTemp  = Boolean.valueOf(isAvailable_60id).booleanValue();
        video.dto.Movie[] findMovies242mtemp = sampleServiceProxyid.findMovies(id_54idTemp,name_55idTemp,banner_56idTemp,release_57idTemp,rentalPrice_58idTemp,category_59idTemp,isAvailable_60idTemp);
if(findMovies242mtemp == null){
%>
<%=findMovies242mtemp %>
<%
}else{
        String tempreturnp243 = null;
        if(findMovies242mtemp != null){
        java.util.List listreturnp243= java.util.Arrays.asList(findMovies242mtemp);
        tempreturnp243 = listreturnp243.toString();
        }
        %>
        <%=tempreturnp243%>
        <%
}
break;
}
} catch (Exception e) { 
%>
exception: <%= e %>
<%
return;
}
if(!gotMethod){
%>
result: N/A
<%
}
%>
</BODY>
</HTML>