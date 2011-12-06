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
        int userId_1idTemp  = Integer.parseInt(userId_1id);
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
        String username_2id=  request.getParameter("username35");
            java.lang.String username_2idTemp = null;
        if(!username_2id.equals("")){
         username_2idTemp  = username_2id;
        }
        boolean isUsernameExisted32mtemp = sampleServiceProxyid.isUsernameExisted(username_2idTemp);
        String tempResultreturnp33 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(isUsernameExisted32mtemp));
        %>
        <%= tempResultreturnp33 %>
        <%
break;
case 37:
        gotMethod = true;
        String personId_3id=  request.getParameter("personId60");
        int personId_3idTemp  = Integer.parseInt(personId_3id);
        video.dto.PersonInfo displayPerson37mtemp = sampleServiceProxyid.displayPerson(personId_3idTemp);
if(displayPerson37mtemp == null){
%>
<%=displayPerson37mtemp %>
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
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typeregistration42 = tebece0.getRegistration();
        java.text.DateFormat dateFormatregistration42 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration42 = typeregistration42.getTime();
        String tempResultregistration42 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration42.format(dateregistration42));
        %>
        <%= tempResultregistration42 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">password:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.lang.String typepassword44 = tebece0.getPassword();
        String tempResultpassword44 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword44));
        %>
        <%= tempResultpassword44 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.lang.String typelastName46 = tebece0.getLastName();
        String tempResultlastName46 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName46));
        %>
        <%= tempResultlastName46 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.lang.String typefirstName48 = tebece0.getFirstName();
        String tempResultfirstName48 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName48));
        %>
        <%= tempResultfirstName48 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typelast_login50 = tebece0.getLast_login();
        java.text.DateFormat dateFormatlast_login50 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login50 = typelast_login50.getTime();
        String tempResultlast_login50 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login50.format(datelast_login50));
        %>
        <%= tempResultlast_login50 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
if(tebece0 != null){
java.lang.String typeusername52 = tebece0.getUsername();
        String tempResultusername52 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername52));
        %>
        <%= tempResultusername52 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Person tebece0=displayPerson37mtemp.getPerson();
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
if(displayPerson37mtemp != null){
video.dto.Movie[] typelistActualRentMovie56 = displayPerson37mtemp.getListActualRentMovie();
        String templistActualRentMovie56 = null;
        if(typelistActualRentMovie56 != null){
        java.util.List listlistActualRentMovie56= java.util.Arrays.asList(typelistActualRentMovie56);
        templistActualRentMovie56 = listlistActualRentMovie56.toString();
        }
        %>
        <%=templistActualRentMovie56%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(displayPerson37mtemp != null){
video.dto.Movie[] typelistRentMovie58 = displayPerson37mtemp.getListRentMovie();
        String templistRentMovie58 = null;
        if(typelistRentMovie58 != null){
        java.util.List listlistRentMovie58= java.util.Arrays.asList(typelistRentMovie58);
        templistRentMovie58 = listlistRentMovie58.toString();
        }
        %>
        <%=templistRentMovie58%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 62:
        gotMethod = true;
        String registration_5id=  request.getParameter("registration67");
            java.util.Calendar registration_5idTemp = null;
        if(!registration_5id.equals("")){
        java.text.DateFormat dateFormatregistration67 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration67  = dateFormatregistration67.parse(registration_5id);
         registration_5idTemp = new java.util.GregorianCalendar();
        registration_5idTemp.setTime(dateTempregistration67);
        }
        String password_6id=  request.getParameter("password69");
            java.lang.String password_6idTemp = null;
        if(!password_6id.equals("")){
         password_6idTemp  = password_6id;
        }
        String lastName_7id=  request.getParameter("lastName71");
            java.lang.String lastName_7idTemp = null;
        if(!lastName_7id.equals("")){
         lastName_7idTemp  = lastName_7id;
        }
        String firstName_8id=  request.getParameter("firstName73");
            java.lang.String firstName_8idTemp = null;
        if(!firstName_8id.equals("")){
         firstName_8idTemp  = firstName_8id;
        }
        String last_login_9id=  request.getParameter("last_login75");
            java.util.Calendar last_login_9idTemp = null;
        if(!last_login_9id.equals("")){
        java.text.DateFormat dateFormatlast_login75 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login75  = dateFormatlast_login75.parse(last_login_9id);
         last_login_9idTemp = new java.util.GregorianCalendar();
        last_login_9idTemp.setTime(dateTemplast_login75);
        }
        String username_10id=  request.getParameter("username77");
            java.lang.String username_10idTemp = null;
        if(!username_10id.equals("")){
         username_10idTemp  = username_10id;
        }
        String id_11id=  request.getParameter("id79");
        int id_11idTemp  = Integer.parseInt(id_11id);
        %>
        <jsp:useBean id="video1dto1Person_4id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_4id.setRegistration(registration_5idTemp);
        video1dto1Person_4id.setPassword(password_6idTemp);
        video1dto1Person_4id.setLastName(lastName_7idTemp);
        video1dto1Person_4id.setFirstName(firstName_8idTemp);
        video1dto1Person_4id.setLast_login(last_login_9idTemp);
        video1dto1Person_4id.setUsername(username_10idTemp);
        video1dto1Person_4id.setId(id_11idTemp);
        String ssn_13id=  request.getParameter("ssn83");
            java.lang.String ssn_13idTemp = null;
        if(!ssn_13id.equals("")){
         ssn_13idTemp  = ssn_13id;
        }
        String outstandingMovies_14id=  request.getParameter("outstandingMovies85");
        int outstandingMovies_14idTemp  = Integer.parseInt(outstandingMovies_14id);
        String personId_15id=  request.getParameter("personId87");
        int personId_15idTemp  = Integer.parseInt(personId_15id);
        String monthlyFee_16id=  request.getParameter("monthlyFee89");
        double monthlyFee_16idTemp  = Double.parseDouble(monthlyFee_16id);
        String balance_17id=  request.getParameter("balance91");
        double balance_17idTemp  = Double.parseDouble(balance_17id);
        String userType_18id=  request.getParameter("userType93");
        int userType_18idTemp  = Integer.parseInt(userType_18id);
        String id_19id=  request.getParameter("id95");
        int id_19idTemp  = Integer.parseInt(id_19id);
        %>
        <jsp:useBean id="video1dto1Account_12id" scope="session" class="video.dto.Account" />
        <%
        video1dto1Account_12id.setSsn(ssn_13idTemp);
        video1dto1Account_12id.setOutstandingMovies(outstandingMovies_14idTemp);
        video1dto1Account_12id.setPersonId(personId_15idTemp);
        video1dto1Account_12id.setMonthlyFee(monthlyFee_16idTemp);
        video1dto1Account_12id.setBalance(balance_17idTemp);
        video1dto1Account_12id.setUserType(userType_18idTemp);
        video1dto1Account_12id.setId(id_19idTemp);
        String zip_21id=  request.getParameter("zip99");
            java.lang.String zip_21idTemp = null;
        if(!zip_21id.equals("")){
         zip_21idTemp  = zip_21id;
        }
        String personId_22id=  request.getParameter("personId101");
        int personId_22idTemp  = Integer.parseInt(personId_22id);
        String state_23id=  request.getParameter("state103");
            java.lang.String state_23idTemp = null;
        if(!state_23id.equals("")){
         state_23idTemp  = state_23id;
        }
        String country_24id=  request.getParameter("country105");
            java.lang.String country_24idTemp = null;
        if(!country_24id.equals("")){
         country_24idTemp  = country_24id;
        }
        String city_25id=  request.getParameter("city107");
            java.lang.String city_25idTemp = null;
        if(!city_25id.equals("")){
         city_25idTemp  = city_25id;
        }
        String street_26id=  request.getParameter("street109");
            java.lang.String street_26idTemp = null;
        if(!street_26id.equals("")){
         street_26idTemp  = street_26id;
        }
        String id_27id=  request.getParameter("id111");
        int id_27idTemp  = Integer.parseInt(id_27id);
        %>
        <jsp:useBean id="video1dto1Address_20id" scope="session" class="video.dto.Address" />
        <%
        video1dto1Address_20id.setZip(zip_21idTemp);
        video1dto1Address_20id.setPersonId(personId_22idTemp);
        video1dto1Address_20id.setState(state_23idTemp);
        video1dto1Address_20id.setCountry(country_24idTemp);
        video1dto1Address_20id.setCity(city_25idTemp);
        video1dto1Address_20id.setStreet(street_26idTemp);
        video1dto1Address_20id.setId(id_27idTemp);
        java.lang.String updatePersonAccount62mtemp = sampleServiceProxyid.updatePersonAccount(video1dto1Person_4id,video1dto1Account_12id,video1dto1Address_20id);
if(updatePersonAccount62mtemp == null){
%>
<%=updatePersonAccount62mtemp %>
<%
}else{
        String tempResultreturnp63 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonAccount62mtemp));
        %>
        <%= tempResultreturnp63 %>
        <%
}
break;
case 113:
        gotMethod = true;
        String username_28id=  request.getParameter("username116");
            java.lang.String username_28idTemp = null;
        if(!username_28id.equals("")){
         username_28idTemp  = username_28id;
        }
        String pwd_29id=  request.getParameter("pwd118");
            java.lang.String pwd_29idTemp = null;
        if(!pwd_29id.equals("")){
         pwd_29idTemp  = pwd_29id;
        }
        java.lang.String logon113mtemp = sampleServiceProxyid.logon(username_28idTemp,pwd_29idTemp);
if(logon113mtemp == null){
%>
<%=logon113mtemp %>
<%
}else{
        String tempResultreturnp114 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logon113mtemp));
        %>
        <%= tempResultreturnp114 %>
        <%
}
break;
case 120:
        gotMethod = true;
        String username_30id=  request.getParameter("username137");
            java.lang.String username_30idTemp = null;
        if(!username_30id.equals("")){
         username_30idTemp  = username_30id;
        }
        video.dto.Person getPerson120mtemp = sampleServiceProxyid.getPerson(username_30idTemp);
if(getPerson120mtemp == null){
%>
<%=getPerson120mtemp %>
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
if(getPerson120mtemp != null){
java.util.Calendar typeregistration123 = getPerson120mtemp.getRegistration();
        java.text.DateFormat dateFormatregistration123 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration123 = typeregistration123.getTime();
        String tempResultregistration123 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration123.format(dateregistration123));
        %>
        <%= tempResultregistration123 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getPerson120mtemp != null){
java.lang.String typepassword125 = getPerson120mtemp.getPassword();
        String tempResultpassword125 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword125));
        %>
        <%= tempResultpassword125 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(getPerson120mtemp != null){
java.lang.String typelastName127 = getPerson120mtemp.getLastName();
        String tempResultlastName127 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName127));
        %>
        <%= tempResultlastName127 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(getPerson120mtemp != null){
java.lang.String typefirstName129 = getPerson120mtemp.getFirstName();
        String tempResultfirstName129 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName129));
        %>
        <%= tempResultfirstName129 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(getPerson120mtemp != null){
java.util.Calendar typelast_login131 = getPerson120mtemp.getLast_login();
        java.text.DateFormat dateFormatlast_login131 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login131 = typelast_login131.getTime();
        String tempResultlast_login131 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login131.format(datelast_login131));
        %>
        <%= tempResultlast_login131 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD>
<%
if(getPerson120mtemp != null){
java.lang.String typeusername133 = getPerson120mtemp.getUsername();
        String tempResultusername133 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername133));
        %>
        <%= tempResultusername133 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getPerson120mtemp != null){
%>
<%=getPerson120mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 139:
        gotMethod = true;
        String personId_31id=  request.getParameter("personId170");
        int personId_31idTemp  = Integer.parseInt(personId_31id);
        String month_32id=  request.getParameter("month172");
        int month_32idTemp  = Integer.parseInt(month_32id);
        String year_33id=  request.getParameter("year174");
        int year_33idTemp  = Integer.parseInt(year_33id);
        video.dto.Bill generateBill139mtemp = sampleServiceProxyid.generateBill(personId_31idTemp,month_32idTemp,year_33idTemp);
if(generateBill139mtemp == null){
%>
<%=generateBill139mtemp %>
<%
}else{
%>
<TABLE>
<TR>
<TD COLSPAN="3" ALIGN="LEFT">returnp:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovie:</TD>
<TD>
<%
if(generateBill139mtemp != null){
%>
<%=generateBill139mtemp.getOutstandingMovie()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personInfo:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">person:</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">registration:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.util.Calendar typeregistration148 = tebece1.getRegistration();
        java.text.DateFormat dateFormatregistration148 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration148 = typeregistration148.getTime();
        String tempResultregistration148 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration148.format(dateregistration148));
        %>
        <%= tempResultregistration148 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">password:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typepassword150 = tebece1.getPassword();
        String tempResultpassword150 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword150));
        %>
        <%= tempResultpassword150 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typelastName152 = tebece1.getLastName();
        String tempResultlastName152 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName152));
        %>
        <%= tempResultlastName152 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typefirstName154 = tebece1.getFirstName();
        String tempResultfirstName154 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName154));
        %>
        <%= tempResultfirstName154 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.util.Calendar typelast_login156 = tebece1.getLast_login();
        java.text.DateFormat dateFormatlast_login156 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login156 = typelast_login156.getTime();
        String tempResultlast_login156 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login156.format(datelast_login156));
        %>
        <%= tempResultlast_login156 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">username:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typeusername158 = tebece1.getUsername();
        String tempResultusername158 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername158));
        %>
        <%= tempResultusername158 %>
        <%
}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="0" ALIGN="LEFT">id:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
%>
<%=tebece1.getId()
%><%}}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">listActualRentMovie:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Movie[] typelistActualRentMovie162 = tebece0.getListActualRentMovie();
        String templistActualRentMovie162 = null;
        if(typelistActualRentMovie162 != null){
        java.util.List listlistActualRentMovie162= java.util.Arrays.asList(typelistActualRentMovie162);
        templistActualRentMovie162 = listlistActualRentMovie162.toString();
        }
        %>
        <%=templistActualRentMovie162%>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(generateBill139mtemp != null){
video.dto.PersonInfo tebece0=generateBill139mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Movie[] typelistRentMovie164 = tebece0.getListRentMovie();
        String templistRentMovie164 = null;
        if(typelistRentMovie164 != null){
        java.util.List listlistRentMovie164= java.util.Arrays.asList(typelistRentMovie164);
        templistRentMovie164 = listlistRentMovie164.toString();
        }
        %>
        <%=templistRentMovie164%>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">month:</TD>
<TD>
<%
if(generateBill139mtemp != null){
%>
<%=generateBill139mtemp.getMonth()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlySubscription:</TD>
<TD>
<%
if(generateBill139mtemp != null){
%>
<%=generateBill139mtemp.getMonthlySubscription()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 176:
        gotMethod = true;
        String userId_34id=  request.getParameter("userId193");
        int userId_34idTemp  = Integer.parseInt(userId_34id);
        video.dto.Account getAccount176mtemp = sampleServiceProxyid.getAccount(userId_34idTemp);
if(getAccount176mtemp == null){
%>
<%=getAccount176mtemp %>
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
if(getAccount176mtemp != null){
java.lang.String typessn179 = getAccount176mtemp.getSsn();
        String tempResultssn179 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn179));
        %>
        <%= tempResultssn179 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getOutstandingMovies()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getMonthlyFee()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getBalance()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getUserType()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAccount176mtemp != null){
%>
<%=getAccount176mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 195:
        gotMethod = true;
        String personId_35id=  request.getParameter("personId198");
        int personId_35idTemp  = Integer.parseInt(personId_35id);
        java.lang.String deletePerson195mtemp = sampleServiceProxyid.deletePerson(personId_35idTemp);
if(deletePerson195mtemp == null){
%>
<%=deletePerson195mtemp %>
<%
}else{
        String tempResultreturnp196 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deletePerson195mtemp));
        %>
        <%= tempResultreturnp196 %>
        <%
}
break;
case 200:
        gotMethod = true;
        String id_36id=  request.getParameter("id203");
        int id_36idTemp  = Integer.parseInt(id_36id);
        String firstName_37id=  request.getParameter("firstName205");
            java.lang.String firstName_37idTemp = null;
        if(!firstName_37id.equals("")){
         firstName_37idTemp  = firstName_37id;
        }
        String lastName_38id=  request.getParameter("lastName207");
            java.lang.String lastName_38idTemp = null;
        if(!lastName_38id.equals("")){
         lastName_38idTemp  = lastName_38id;
        }
        String username_39id=  request.getParameter("username209");
            java.lang.String username_39idTemp = null;
        if(!username_39id.equals("")){
         username_39idTemp  = username_39id;
        }
        String registration_40id=  request.getParameter("registration211");
            java.util.Calendar registration_40idTemp = null;
        if(!registration_40id.equals("")){
        java.text.DateFormat dateFormatregistration211 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration211  = dateFormatregistration211.parse(registration_40id);
         registration_40idTemp = new java.util.GregorianCalendar();
        registration_40idTemp.setTime(dateTempregistration211);
        }
        String last_Login_41id=  request.getParameter("last_Login213");
            java.util.Calendar last_Login_41idTemp = null;
        if(!last_Login_41id.equals("")){
        java.text.DateFormat dateFormatlast_Login213 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_Login213  = dateFormatlast_Login213.parse(last_Login_41id);
         last_Login_41idTemp = new java.util.GregorianCalendar();
        last_Login_41idTemp.setTime(dateTemplast_Login213);
        }
        video.dto.Person[] find_Persons200mtemp = sampleServiceProxyid.find_Persons(id_36idTemp,firstName_37idTemp,lastName_38idTemp,username_39idTemp,registration_40idTemp,last_Login_41idTemp);
if(find_Persons200mtemp == null){
%>
<%=find_Persons200mtemp %>
<%
}else{
        String tempreturnp201 = null;
        if(find_Persons200mtemp != null){
        java.util.List listreturnp201= java.util.Arrays.asList(find_Persons200mtemp);
        tempreturnp201 = listreturnp201.toString();
        }
        %>
        <%=tempreturnp201%>
        <%
}
break;
case 215:
        gotMethod = true;
        String movieId_42id=  request.getParameter("movieId234");
        int movieId_42idTemp  = Integer.parseInt(movieId_42id);
        video.dto.MovieInfo displayMovie215mtemp = sampleServiceProxyid.displayMovie(movieId_42idTemp);
if(displayMovie215mtemp == null){
%>
<%=displayMovie215mtemp %>
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
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
if(tebece0 != null){
java.lang.String typebanner220 = tebece0.getBanner();
        String tempResultbanner220 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typebanner220));
        %>
        <%= tempResultbanner220 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">nbAvailable:</TD>
<TD>
<%
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
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
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
if(tebece0 != null){
java.lang.String typename224 = tebece0.getName();
        String tempResultname224 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typename224));
        %>
        <%= tempResultname224 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">rentAmount:</TD>
<TD>
<%
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
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
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
if(tebece0 != null){
java.util.Calendar typereleaseDate228 = tebece0.getReleaseDate();
        java.text.DateFormat dateFormatreleaseDate228 = java.text.DateFormat.getDateInstance();
        java.util.Date datereleaseDate228 = typereleaseDate228.getTime();
        String tempResultreleaseDate228 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatreleaseDate228.format(datereleaseDate228));
        %>
        <%= tempResultreleaseDate228 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayMovie215mtemp != null){
video.dto.Movie tebece0=displayMovie215mtemp.getMovie();
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
if(displayMovie215mtemp != null){
video.dto.Person[] typelistPerson232 = displayMovie215mtemp.getListPerson();
        String templistPerson232 = null;
        if(typelistPerson232 != null){
        java.util.List listlistPerson232= java.util.Arrays.asList(typelistPerson232);
        templistPerson232 = listlistPerson232.toString();
        }
        %>
        <%=templistPerson232%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 236:
        gotMethod = true;
        String id_43id=  request.getParameter("id239");
        int id_43idTemp  = Integer.parseInt(id_43id);
        String name_44id=  request.getParameter("name241");
            java.lang.String name_44idTemp = null;
        if(!name_44id.equals("")){
         name_44idTemp  = name_44id;
        }
        String banner_45id=  request.getParameter("banner243");
            java.lang.String banner_45idTemp = null;
        if(!banner_45id.equals("")){
         banner_45idTemp  = banner_45id;
        }
        String release_46id=  request.getParameter("release245");
            java.util.Calendar release_46idTemp = null;
        if(!release_46id.equals("")){
        java.text.DateFormat dateFormatrelease245 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemprelease245  = dateFormatrelease245.parse(release_46id);
         release_46idTemp = new java.util.GregorianCalendar();
        release_46idTemp.setTime(dateTemprelease245);
        }
        String rentalPrice_47id=  request.getParameter("rentalPrice247");
        double rentalPrice_47idTemp  = Double.parseDouble(rentalPrice_47id);
        String category_48id=  request.getParameter("category249");
        int category_48idTemp  = Integer.parseInt(category_48id);
        String isAvailable_49id=  request.getParameter("isAvailable251");
        boolean isAvailable_49idTemp  = Boolean.valueOf(isAvailable_49id).booleanValue();
        video.dto.Movie[] findMovies236mtemp = sampleServiceProxyid.findMovies(id_43idTemp,name_44idTemp,banner_45idTemp,release_46idTemp,rentalPrice_47idTemp,category_48idTemp,isAvailable_49idTemp);
if(findMovies236mtemp == null){
%>
<%=findMovies236mtemp %>
<%
}else{
        String tempreturnp237 = null;
        if(findMovies236mtemp != null){
        java.util.List listreturnp237= java.util.Arrays.asList(findMovies236mtemp);
        tempreturnp237 = listreturnp237.toString();
        }
        %>
        <%=tempreturnp237%>
        <%
}
break;
case 253:
        gotMethod = true;
        String movieId_50id=  request.getParameter("movieId256");
        int movieId_50idTemp  = Integer.parseInt(movieId_50id);
        String personId_51id=  request.getParameter("personId258");
        int personId_51idTemp  = Integer.parseInt(personId_51id);
        java.lang.String issueMovie253mtemp = sampleServiceProxyid.issueMovie(movieId_50idTemp,personId_51idTemp);
if(issueMovie253mtemp == null){
%>
<%=issueMovie253mtemp %>
<%
}else{
        String tempResultreturnp254 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(issueMovie253mtemp));
        %>
        <%= tempResultreturnp254 %>
        <%
}
break;
case 260:
        gotMethod = true;
        video.dto.Movie[] listMovies260mtemp = sampleServiceProxyid.listMovies();
if(listMovies260mtemp == null){
%>
<%=listMovies260mtemp %>
<%
}else{
        String tempreturnp261 = null;
        if(listMovies260mtemp != null){
        java.util.List listreturnp261= java.util.Arrays.asList(listMovies260mtemp);
        tempreturnp261 = listreturnp261.toString();
        }
        %>
        <%=tempreturnp261%>
        <%
}
break;
case 263:
        gotMethod = true;
        String movieId_52id=  request.getParameter("movieId266");
            java.lang.String movieId_52idTemp = null;
        if(!movieId_52id.equals("")){
         movieId_52idTemp  = movieId_52id;
        }
        java.lang.String deleteMovie263mtemp = sampleServiceProxyid.deleteMovie(movieId_52idTemp);
if(deleteMovie263mtemp == null){
%>
<%=deleteMovie263mtemp %>
<%
}else{
        String tempResultreturnp264 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deleteMovie263mtemp));
        %>
        <%= tempResultreturnp264 %>
        <%
}
break;
case 268:
        gotMethod = true;
        String movieId_53id=  request.getParameter("movieId271");
        int movieId_53idTemp  = Integer.parseInt(movieId_53id);
        String personId_54id=  request.getParameter("personId273");
        int personId_54idTemp  = Integer.parseInt(personId_54id);
        java.lang.String submitMovie268mtemp = sampleServiceProxyid.submitMovie(movieId_53idTemp,personId_54idTemp);
if(submitMovie268mtemp == null){
%>
<%=submitMovie268mtemp %>
<%
}else{
        String tempResultreturnp269 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitMovie268mtemp));
        %>
        <%= tempResultreturnp269 %>
        <%
}
break;
case 275:
        gotMethod = true;
        String banner_56id=  request.getParameter("banner280");
            java.lang.String banner_56idTemp = null;
        if(!banner_56id.equals("")){
         banner_56idTemp  = banner_56id;
        }
        String nbAvailable_57id=  request.getParameter("nbAvailable282");
        int nbAvailable_57idTemp  = Integer.parseInt(nbAvailable_57id);
        String name_58id=  request.getParameter("name284");
            java.lang.String name_58idTemp = null;
        if(!name_58id.equals("")){
         name_58idTemp  = name_58id;
        }
        String rentAmount_59id=  request.getParameter("rentAmount286");
        double rentAmount_59idTemp  = Double.parseDouble(rentAmount_59id);
        String releaseDate_60id=  request.getParameter("releaseDate288");
            java.util.Calendar releaseDate_60idTemp = null;
        if(!releaseDate_60id.equals("")){
        java.text.DateFormat dateFormatreleaseDate288 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempreleaseDate288  = dateFormatreleaseDate288.parse(releaseDate_60id);
         releaseDate_60idTemp = new java.util.GregorianCalendar();
        releaseDate_60idTemp.setTime(dateTempreleaseDate288);
        }
        String id_61id=  request.getParameter("id290");
        int id_61idTemp  = Integer.parseInt(id_61id);
        %>
        <jsp:useBean id="video1dto1Movie_55id" scope="session" class="video.dto.Movie" />
        <%
        video1dto1Movie_55id.setBanner(banner_56idTemp);
        video1dto1Movie_55id.setNbAvailable(nbAvailable_57idTemp);
        video1dto1Movie_55id.setName(name_58idTemp);
        video1dto1Movie_55id.setRentAmount(rentAmount_59idTemp);
        video1dto1Movie_55id.setReleaseDate(releaseDate_60idTemp);
        video1dto1Movie_55id.setId(id_61idTemp);
        java.lang.String addMovie275mtemp = sampleServiceProxyid.addMovie(video1dto1Movie_55id);
if(addMovie275mtemp == null){
%>
<%=addMovie275mtemp %>
<%
}else{
        String tempResultreturnp276 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(addMovie275mtemp));
        %>
        <%= tempResultreturnp276 %>
        <%
}
break;
case 292:
        gotMethod = true;
        String banner_63id=  request.getParameter("banner297");
            java.lang.String banner_63idTemp = null;
        if(!banner_63id.equals("")){
         banner_63idTemp  = banner_63id;
        }
        String nbAvailable_64id=  request.getParameter("nbAvailable299");
        int nbAvailable_64idTemp  = Integer.parseInt(nbAvailable_64id);
        String name_65id=  request.getParameter("name301");
            java.lang.String name_65idTemp = null;
        if(!name_65id.equals("")){
         name_65idTemp  = name_65id;
        }
        String rentAmount_66id=  request.getParameter("rentAmount303");
        double rentAmount_66idTemp  = Double.parseDouble(rentAmount_66id);
        String releaseDate_67id=  request.getParameter("releaseDate305");
            java.util.Calendar releaseDate_67idTemp = null;
        if(!releaseDate_67id.equals("")){
        java.text.DateFormat dateFormatreleaseDate305 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempreleaseDate305  = dateFormatreleaseDate305.parse(releaseDate_67id);
         releaseDate_67idTemp = new java.util.GregorianCalendar();
        releaseDate_67idTemp.setTime(dateTempreleaseDate305);
        }
        String id_68id=  request.getParameter("id307");
        int id_68idTemp  = Integer.parseInt(id_68id);
        %>
        <jsp:useBean id="video1dto1Movie_62id" scope="session" class="video.dto.Movie" />
        <%
        video1dto1Movie_62id.setBanner(banner_63idTemp);
        video1dto1Movie_62id.setNbAvailable(nbAvailable_64idTemp);
        video1dto1Movie_62id.setName(name_65idTemp);
        video1dto1Movie_62id.setRentAmount(rentAmount_66idTemp);
        video1dto1Movie_62id.setReleaseDate(releaseDate_67idTemp);
        video1dto1Movie_62id.setId(id_68idTemp);
        java.lang.String updateMovie292mtemp = sampleServiceProxyid.updateMovie(video1dto1Movie_62id);
if(updateMovie292mtemp == null){
%>
<%=updateMovie292mtemp %>
<%
}else{
        String tempResultreturnp293 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateMovie292mtemp));
        %>
        <%= tempResultreturnp293 %>
        <%
}
break;
case 309:
        gotMethod = true;
        String registration_70id=  request.getParameter("registration314");
            java.util.Calendar registration_70idTemp = null;
        if(!registration_70id.equals("")){
        java.text.DateFormat dateFormatregistration314 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration314  = dateFormatregistration314.parse(registration_70id);
         registration_70idTemp = new java.util.GregorianCalendar();
        registration_70idTemp.setTime(dateTempregistration314);
        }
        String password_71id=  request.getParameter("password316");
            java.lang.String password_71idTemp = null;
        if(!password_71id.equals("")){
         password_71idTemp  = password_71id;
        }
        String lastName_72id=  request.getParameter("lastName318");
            java.lang.String lastName_72idTemp = null;
        if(!lastName_72id.equals("")){
         lastName_72idTemp  = lastName_72id;
        }
        String firstName_73id=  request.getParameter("firstName320");
            java.lang.String firstName_73idTemp = null;
        if(!firstName_73id.equals("")){
         firstName_73idTemp  = firstName_73id;
        }
        String last_login_74id=  request.getParameter("last_login322");
            java.util.Calendar last_login_74idTemp = null;
        if(!last_login_74id.equals("")){
        java.text.DateFormat dateFormatlast_login322 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login322  = dateFormatlast_login322.parse(last_login_74id);
         last_login_74idTemp = new java.util.GregorianCalendar();
        last_login_74idTemp.setTime(dateTemplast_login322);
        }
        String username_75id=  request.getParameter("username324");
            java.lang.String username_75idTemp = null;
        if(!username_75id.equals("")){
         username_75idTemp  = username_75id;
        }
        String id_76id=  request.getParameter("id326");
        int id_76idTemp  = Integer.parseInt(id_76id);
        %>
        <jsp:useBean id="video1dto1Person_69id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_69id.setRegistration(registration_70idTemp);
        video1dto1Person_69id.setPassword(password_71idTemp);
        video1dto1Person_69id.setLastName(lastName_72idTemp);
        video1dto1Person_69id.setFirstName(firstName_73idTemp);
        video1dto1Person_69id.setLast_login(last_login_74idTemp);
        video1dto1Person_69id.setUsername(username_75idTemp);
        video1dto1Person_69id.setId(id_76idTemp);
        String accountType_77id=  request.getParameter("accountType328");
        int accountType_77idTemp  = Integer.parseInt(accountType_77id);
        java.lang.String signUp309mtemp = sampleServiceProxyid.signUp(video1dto1Person_69id,accountType_77idTemp);
if(signUp309mtemp == null){
%>
<%=signUp309mtemp %>
<%
}else{
        String tempResultreturnp310 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp309mtemp));
        %>
        <%= tempResultreturnp310 %>
        <%
}
break;
case 330:
        gotMethod = true;
        String userId_78id=  request.getParameter("userId333");
        int userId_78idTemp  = Integer.parseInt(userId_78id);
        java.lang.String logout330mtemp = sampleServiceProxyid.logout(userId_78idTemp);
if(logout330mtemp == null){
%>
<%=logout330mtemp %>
<%
}else{
        String tempResultreturnp331 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logout330mtemp));
        %>
        <%= tempResultreturnp331 %>
        <%
}
break;
case 335:
        gotMethod = true;
        video.dto.Person[] listSimpleMember335mtemp = sampleServiceProxyid.listSimpleMember();
if(listSimpleMember335mtemp == null){
%>
<%=listSimpleMember335mtemp %>
<%
}else{
        String tempreturnp336 = null;
        if(listSimpleMember335mtemp != null){
        java.util.List listreturnp336= java.util.Arrays.asList(listSimpleMember335mtemp);
        tempreturnp336 = listreturnp336.toString();
        }
        %>
        <%=tempreturnp336%>
        <%
}
break;
case 338:
        gotMethod = true;
        video.dto.Person[] listAllPersons338mtemp = sampleServiceProxyid.listAllPersons();
if(listAllPersons338mtemp == null){
%>
<%=listAllPersons338mtemp %>
<%
}else{
        String tempreturnp339 = null;
        if(listAllPersons338mtemp != null){
        java.util.List listreturnp339= java.util.Arrays.asList(listAllPersons338mtemp);
        tempreturnp339 = listreturnp339.toString();
        }
        %>
        <%=tempreturnp339%>
        <%
}
break;
case 341:
        gotMethod = true;
        video.dto.Person[] listPremiumMember341mtemp = sampleServiceProxyid.listPremiumMember();
if(listPremiumMember341mtemp == null){
%>
<%=listPremiumMember341mtemp %>
<%
}else{
        String tempreturnp342 = null;
        if(listPremiumMember341mtemp != null){
        java.util.List listreturnp342= java.util.Arrays.asList(listPremiumMember341mtemp);
        tempreturnp342 = listreturnp342.toString();
        }
        %>
        <%=tempreturnp342%>
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