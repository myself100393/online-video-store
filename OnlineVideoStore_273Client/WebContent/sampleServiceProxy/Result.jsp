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
        String username_3id=  request.getParameter("username40");
            java.lang.String username_3idTemp = null;
        if(!username_3id.equals("")){
         username_3idTemp  = username_3id;
        }
        boolean isUsernameExisted37mtemp = sampleServiceProxyid.isUsernameExisted(username_3idTemp);
        String tempResultreturnp38 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(isUsernameExisted37mtemp));
        %>
        <%= tempResultreturnp38 %>
        <%
break;
case 42:
        gotMethod = true;
        String personId_4id=  request.getParameter("personId65");
        int personId_4idTemp  = Integer.parseInt(personId_4id);
        video.dto.PersonInfo displayPerson42mtemp = sampleServiceProxyid.displayPerson(personId_4idTemp);
if(displayPerson42mtemp == null){
%>
<%=displayPerson42mtemp %>
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
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typeregistration47 = tebece0.getRegistration();
        java.text.DateFormat dateFormatregistration47 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration47 = typeregistration47.getTime();
        String tempResultregistration47 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration47.format(dateregistration47));
        %>
        <%= tempResultregistration47 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">password:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.lang.String typepassword49 = tebece0.getPassword();
        String tempResultpassword49 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword49));
        %>
        <%= tempResultpassword49 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.lang.String typelastName51 = tebece0.getLastName();
        String tempResultlastName51 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName51));
        %>
        <%= tempResultlastName51 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.lang.String typefirstName53 = tebece0.getFirstName();
        String tempResultfirstName53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName53));
        %>
        <%= tempResultfirstName53 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typelast_login55 = tebece0.getLast_login();
        java.text.DateFormat dateFormatlast_login55 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login55 = typelast_login55.getTime();
        String tempResultlast_login55 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login55.format(datelast_login55));
        %>
        <%= tempResultlast_login55 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
if(tebece0 != null){
java.lang.String typeusername57 = tebece0.getUsername();
        String tempResultusername57 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername57));
        %>
        <%= tempResultusername57 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Person tebece0=displayPerson42mtemp.getPerson();
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
if(displayPerson42mtemp != null){
video.dto.Movie[] typelistActualRentMovie61 = displayPerson42mtemp.getListActualRentMovie();
        String templistActualRentMovie61 = null;
        if(typelistActualRentMovie61 != null){
        java.util.List listlistActualRentMovie61= java.util.Arrays.asList(typelistActualRentMovie61);
        templistActualRentMovie61 = listlistActualRentMovie61.toString();
        }
        %>
        <%=templistActualRentMovie61%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(displayPerson42mtemp != null){
video.dto.Movie[] typelistRentMovie63 = displayPerson42mtemp.getListRentMovie();
        String templistRentMovie63 = null;
        if(typelistRentMovie63 != null){
        java.util.List listlistRentMovie63= java.util.Arrays.asList(typelistRentMovie63);
        templistRentMovie63 = listlistRentMovie63.toString();
        }
        %>
        <%=templistRentMovie63%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 67:
        gotMethod = true;
        String registration_6id=  request.getParameter("registration72");
            java.util.Calendar registration_6idTemp = null;
        if(!registration_6id.equals("")){
        java.text.DateFormat dateFormatregistration72 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration72  = dateFormatregistration72.parse(registration_6id);
         registration_6idTemp = new java.util.GregorianCalendar();
        registration_6idTemp.setTime(dateTempregistration72);
        }
        String password_7id=  request.getParameter("password74");
            java.lang.String password_7idTemp = null;
        if(!password_7id.equals("")){
         password_7idTemp  = password_7id;
        }
        String lastName_8id=  request.getParameter("lastName76");
            java.lang.String lastName_8idTemp = null;
        if(!lastName_8id.equals("")){
         lastName_8idTemp  = lastName_8id;
        }
        String firstName_9id=  request.getParameter("firstName78");
            java.lang.String firstName_9idTemp = null;
        if(!firstName_9id.equals("")){
         firstName_9idTemp  = firstName_9id;
        }
        String last_login_10id=  request.getParameter("last_login80");
            java.util.Calendar last_login_10idTemp = null;
        if(!last_login_10id.equals("")){
        java.text.DateFormat dateFormatlast_login80 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login80  = dateFormatlast_login80.parse(last_login_10id);
         last_login_10idTemp = new java.util.GregorianCalendar();
        last_login_10idTemp.setTime(dateTemplast_login80);
        }
        String username_11id=  request.getParameter("username82");
            java.lang.String username_11idTemp = null;
        if(!username_11id.equals("")){
         username_11idTemp  = username_11id;
        }
        String id_12id=  request.getParameter("id84");
        int id_12idTemp  = Integer.parseInt(id_12id);
        %>
        <jsp:useBean id="video1dto1Person_5id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_5id.setRegistration(registration_6idTemp);
        video1dto1Person_5id.setPassword(password_7idTemp);
        video1dto1Person_5id.setLastName(lastName_8idTemp);
        video1dto1Person_5id.setFirstName(firstName_9idTemp);
        video1dto1Person_5id.setLast_login(last_login_10idTemp);
        video1dto1Person_5id.setUsername(username_11idTemp);
        video1dto1Person_5id.setId(id_12idTemp);
        String ssn_14id=  request.getParameter("ssn88");
            java.lang.String ssn_14idTemp = null;
        if(!ssn_14id.equals("")){
         ssn_14idTemp  = ssn_14id;
        }
        String outstandingMovies_15id=  request.getParameter("outstandingMovies90");
        int outstandingMovies_15idTemp  = Integer.parseInt(outstandingMovies_15id);
        String personId_16id=  request.getParameter("personId92");
        int personId_16idTemp  = Integer.parseInt(personId_16id);
        String monthlyFee_17id=  request.getParameter("monthlyFee94");
        double monthlyFee_17idTemp  = Double.parseDouble(monthlyFee_17id);
        String balance_18id=  request.getParameter("balance96");
        double balance_18idTemp  = Double.parseDouble(balance_18id);
        String userType_19id=  request.getParameter("userType98");
        int userType_19idTemp  = Integer.parseInt(userType_19id);
        String id_20id=  request.getParameter("id100");
        int id_20idTemp  = Integer.parseInt(id_20id);
        %>
        <jsp:useBean id="video1dto1Account_13id" scope="session" class="video.dto.Account" />
        <%
        video1dto1Account_13id.setSsn(ssn_14idTemp);
        video1dto1Account_13id.setOutstandingMovies(outstandingMovies_15idTemp);
        video1dto1Account_13id.setPersonId(personId_16idTemp);
        video1dto1Account_13id.setMonthlyFee(monthlyFee_17idTemp);
        video1dto1Account_13id.setBalance(balance_18idTemp);
        video1dto1Account_13id.setUserType(userType_19idTemp);
        video1dto1Account_13id.setId(id_20idTemp);
        String zip_22id=  request.getParameter("zip104");
            java.lang.String zip_22idTemp = null;
        if(!zip_22id.equals("")){
         zip_22idTemp  = zip_22id;
        }
        String personId_23id=  request.getParameter("personId106");
        int personId_23idTemp  = Integer.parseInt(personId_23id);
        String state_24id=  request.getParameter("state108");
            java.lang.String state_24idTemp = null;
        if(!state_24id.equals("")){
         state_24idTemp  = state_24id;
        }
        String country_25id=  request.getParameter("country110");
            java.lang.String country_25idTemp = null;
        if(!country_25id.equals("")){
         country_25idTemp  = country_25id;
        }
        String city_26id=  request.getParameter("city112");
            java.lang.String city_26idTemp = null;
        if(!city_26id.equals("")){
         city_26idTemp  = city_26id;
        }
        String street_27id=  request.getParameter("street114");
            java.lang.String street_27idTemp = null;
        if(!street_27id.equals("")){
         street_27idTemp  = street_27id;
        }
        String id_28id=  request.getParameter("id116");
        int id_28idTemp  = Integer.parseInt(id_28id);
        %>
        <jsp:useBean id="video1dto1Address_21id" scope="session" class="video.dto.Address" />
        <%
        video1dto1Address_21id.setZip(zip_22idTemp);
        video1dto1Address_21id.setPersonId(personId_23idTemp);
        video1dto1Address_21id.setState(state_24idTemp);
        video1dto1Address_21id.setCountry(country_25idTemp);
        video1dto1Address_21id.setCity(city_26idTemp);
        video1dto1Address_21id.setStreet(street_27idTemp);
        video1dto1Address_21id.setId(id_28idTemp);
        java.lang.String updatePersonAccount67mtemp = sampleServiceProxyid.updatePersonAccount(video1dto1Person_5id,video1dto1Account_13id,video1dto1Address_21id);
if(updatePersonAccount67mtemp == null){
%>
<%=updatePersonAccount67mtemp %>
<%
}else{
        String tempResultreturnp68 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonAccount67mtemp));
        %>
        <%= tempResultreturnp68 %>
        <%
}
break;
case 118:
        gotMethod = true;
        String userId_29id=  request.getParameter("userId135");
        int userId_29idTemp  = Integer.parseInt(userId_29id);
        video.dto.Account getAccount118mtemp = sampleServiceProxyid.getAccount(userId_29idTemp);
if(getAccount118mtemp == null){
%>
<%=getAccount118mtemp %>
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
if(getAccount118mtemp != null){
java.lang.String typessn121 = getAccount118mtemp.getSsn();
        String tempResultssn121 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn121));
        %>
        <%= tempResultssn121 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getOutstandingMovies()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getMonthlyFee()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getBalance()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getUserType()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAccount118mtemp != null){
%>
<%=getAccount118mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 137:
        gotMethod = true;
        String username_30id=  request.getParameter("username154");
            java.lang.String username_30idTemp = null;
        if(!username_30id.equals("")){
         username_30idTemp  = username_30id;
        }
        video.dto.Person getPerson137mtemp = sampleServiceProxyid.getPerson(username_30idTemp);
if(getPerson137mtemp == null){
%>
<%=getPerson137mtemp %>
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
if(getPerson137mtemp != null){
java.util.Calendar typeregistration140 = getPerson137mtemp.getRegistration();
        java.text.DateFormat dateFormatregistration140 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration140 = typeregistration140.getTime();
        String tempResultregistration140 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration140.format(dateregistration140));
        %>
        <%= tempResultregistration140 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getPerson137mtemp != null){
java.lang.String typepassword142 = getPerson137mtemp.getPassword();
        String tempResultpassword142 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword142));
        %>
        <%= tempResultpassword142 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(getPerson137mtemp != null){
java.lang.String typelastName144 = getPerson137mtemp.getLastName();
        String tempResultlastName144 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName144));
        %>
        <%= tempResultlastName144 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(getPerson137mtemp != null){
java.lang.String typefirstName146 = getPerson137mtemp.getFirstName();
        String tempResultfirstName146 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName146));
        %>
        <%= tempResultfirstName146 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(getPerson137mtemp != null){
java.util.Calendar typelast_login148 = getPerson137mtemp.getLast_login();
        java.text.DateFormat dateFormatlast_login148 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login148 = typelast_login148.getTime();
        String tempResultlast_login148 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login148.format(datelast_login148));
        %>
        <%= tempResultlast_login148 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD>
<%
if(getPerson137mtemp != null){
java.lang.String typeusername150 = getPerson137mtemp.getUsername();
        String tempResultusername150 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername150));
        %>
        <%= tempResultusername150 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getPerson137mtemp != null){
%>
<%=getPerson137mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 156:
        gotMethod = true;
        String personId_31id=  request.getParameter("personId159");
        int personId_31idTemp  = Integer.parseInt(personId_31id);
        java.lang.String deletePerson156mtemp = sampleServiceProxyid.deletePerson(personId_31idTemp);
if(deletePerson156mtemp == null){
%>
<%=deletePerson156mtemp %>
<%
}else{
        String tempResultreturnp157 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deletePerson156mtemp));
        %>
        <%= tempResultreturnp157 %>
        <%
}
break;
case 161:
        gotMethod = true;
        String id_32id=  request.getParameter("id164");
        int id_32idTemp  = Integer.parseInt(id_32id);
        String firstName_33id=  request.getParameter("firstName166");
            java.lang.String firstName_33idTemp = null;
        if(!firstName_33id.equals("")){
         firstName_33idTemp  = firstName_33id;
        }
        String lastName_34id=  request.getParameter("lastName168");
            java.lang.String lastName_34idTemp = null;
        if(!lastName_34id.equals("")){
         lastName_34idTemp  = lastName_34id;
        }
        String username_35id=  request.getParameter("username170");
            java.lang.String username_35idTemp = null;
        if(!username_35id.equals("")){
         username_35idTemp  = username_35id;
        }
        String registration_36id=  request.getParameter("registration172");
            java.util.Calendar registration_36idTemp = null;
        if(!registration_36id.equals("")){
        java.text.DateFormat dateFormatregistration172 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration172  = dateFormatregistration172.parse(registration_36id);
         registration_36idTemp = new java.util.GregorianCalendar();
        registration_36idTemp.setTime(dateTempregistration172);
        }
        String last_Login_37id=  request.getParameter("last_Login174");
            java.util.Calendar last_Login_37idTemp = null;
        if(!last_Login_37id.equals("")){
        java.text.DateFormat dateFormatlast_Login174 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_Login174  = dateFormatlast_Login174.parse(last_Login_37id);
         last_Login_37idTemp = new java.util.GregorianCalendar();
        last_Login_37idTemp.setTime(dateTemplast_Login174);
        }
        video.dto.Person[] find_Persons161mtemp = sampleServiceProxyid.find_Persons(id_32idTemp,firstName_33idTemp,lastName_34idTemp,username_35idTemp,registration_36idTemp,last_Login_37idTemp);
if(find_Persons161mtemp == null){
%>
<%=find_Persons161mtemp %>
<%
}else{
        String tempreturnp162 = null;
        if(find_Persons161mtemp != null){
        java.util.List listreturnp162= java.util.Arrays.asList(find_Persons161mtemp);
        tempreturnp162 = listreturnp162.toString();
        }
        %>
        <%=tempreturnp162%>
        <%
}
break;
case 176:
        gotMethod = true;
        String movieId_38id=  request.getParameter("movieId195");
        int movieId_38idTemp  = Integer.parseInt(movieId_38id);
        video.dto.MovieInfo displayMovie176mtemp = sampleServiceProxyid.displayMovie(movieId_38idTemp);
if(displayMovie176mtemp == null){
%>
<%=displayMovie176mtemp %>
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
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
if(tebece0 != null){
java.lang.String typebanner181 = tebece0.getBanner();
        String tempResultbanner181 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typebanner181));
        %>
        <%= tempResultbanner181 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">nbAvailable:</TD>
<TD>
<%
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
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
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
if(tebece0 != null){
java.lang.String typename185 = tebece0.getName();
        String tempResultname185 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typename185));
        %>
        <%= tempResultname185 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">rentAmount:</TD>
<TD>
<%
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
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
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
if(tebece0 != null){
java.util.Calendar typereleaseDate189 = tebece0.getReleaseDate();
        java.text.DateFormat dateFormatreleaseDate189 = java.text.DateFormat.getDateInstance();
        java.util.Date datereleaseDate189 = typereleaseDate189.getTime();
        String tempResultreleaseDate189 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatreleaseDate189.format(datereleaseDate189));
        %>
        <%= tempResultreleaseDate189 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayMovie176mtemp != null){
video.dto.Movie tebece0=displayMovie176mtemp.getMovie();
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
if(displayMovie176mtemp != null){
video.dto.Person[] typelistPerson193 = displayMovie176mtemp.getListPerson();
        String templistPerson193 = null;
        if(typelistPerson193 != null){
        java.util.List listlistPerson193= java.util.Arrays.asList(typelistPerson193);
        templistPerson193 = listlistPerson193.toString();
        }
        %>
        <%=templistPerson193%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 197:
        gotMethod = true;
        String username_39id=  request.getParameter("username200");
            java.lang.String username_39idTemp = null;
        if(!username_39id.equals("")){
         username_39idTemp  = username_39id;
        }
        String pwd_40id=  request.getParameter("pwd202");
            java.lang.String pwd_40idTemp = null;
        if(!pwd_40id.equals("")){
         pwd_40idTemp  = pwd_40id;
        }
        java.lang.String logon197mtemp = sampleServiceProxyid.logon(username_39idTemp,pwd_40idTemp);
if(logon197mtemp == null){
%>
<%=logon197mtemp %>
<%
}else{
        String tempResultreturnp198 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logon197mtemp));
        %>
        <%= tempResultreturnp198 %>
        <%
}
break;
case 204:
        gotMethod = true;
        video.dto.Movie[] listMovies204mtemp = sampleServiceProxyid.listMovies();
if(listMovies204mtemp == null){
%>
<%=listMovies204mtemp %>
<%
}else{
        String tempreturnp205 = null;
        if(listMovies204mtemp != null){
        java.util.List listreturnp205= java.util.Arrays.asList(listMovies204mtemp);
        tempreturnp205 = listreturnp205.toString();
        }
        %>
        <%=tempreturnp205%>
        <%
}
break;
case 207:
        gotMethod = true;
        String movieId_41id=  request.getParameter("movieId210");
        int movieId_41idTemp  = Integer.parseInt(movieId_41id);
        String personId_42id=  request.getParameter("personId212");
        int personId_42idTemp  = Integer.parseInt(personId_42id);
        java.lang.String issueMovie207mtemp = sampleServiceProxyid.issueMovie(movieId_41idTemp,personId_42idTemp);
if(issueMovie207mtemp == null){
%>
<%=issueMovie207mtemp %>
<%
}else{
        String tempResultreturnp208 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(issueMovie207mtemp));
        %>
        <%= tempResultreturnp208 %>
        <%
}
break;
case 214:
        gotMethod = true;
        String banner_44id=  request.getParameter("banner219");
            java.lang.String banner_44idTemp = null;
        if(!banner_44id.equals("")){
         banner_44idTemp  = banner_44id;
        }
        String nbAvailable_45id=  request.getParameter("nbAvailable221");
        int nbAvailable_45idTemp  = Integer.parseInt(nbAvailable_45id);
        String name_46id=  request.getParameter("name223");
            java.lang.String name_46idTemp = null;
        if(!name_46id.equals("")){
         name_46idTemp  = name_46id;
        }
        String rentAmount_47id=  request.getParameter("rentAmount225");
        double rentAmount_47idTemp  = Double.parseDouble(rentAmount_47id);
        String releaseDate_48id=  request.getParameter("releaseDate227");
            java.util.Calendar releaseDate_48idTemp = null;
        if(!releaseDate_48id.equals("")){
        java.text.DateFormat dateFormatreleaseDate227 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempreleaseDate227  = dateFormatreleaseDate227.parse(releaseDate_48id);
         releaseDate_48idTemp = new java.util.GregorianCalendar();
        releaseDate_48idTemp.setTime(dateTempreleaseDate227);
        }
        String id_49id=  request.getParameter("id229");
        int id_49idTemp  = Integer.parseInt(id_49id);
        %>
        <jsp:useBean id="video1dto1Movie_43id" scope="session" class="video.dto.Movie" />
        <%
        video1dto1Movie_43id.setBanner(banner_44idTemp);
        video1dto1Movie_43id.setNbAvailable(nbAvailable_45idTemp);
        video1dto1Movie_43id.setName(name_46idTemp);
        video1dto1Movie_43id.setRentAmount(rentAmount_47idTemp);
        video1dto1Movie_43id.setReleaseDate(releaseDate_48idTemp);
        video1dto1Movie_43id.setId(id_49idTemp);
        java.lang.String addMovie214mtemp = sampleServiceProxyid.addMovie(video1dto1Movie_43id);
if(addMovie214mtemp == null){
%>
<%=addMovie214mtemp %>
<%
}else{
        String tempResultreturnp215 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(addMovie214mtemp));
        %>
        <%= tempResultreturnp215 %>
        <%
}
break;
case 231:
        gotMethod = true;
        String movieId_50id=  request.getParameter("movieId234");
        int movieId_50idTemp  = Integer.parseInt(movieId_50id);
        String personId_51id=  request.getParameter("personId236");
        int personId_51idTemp  = Integer.parseInt(personId_51id);
        java.lang.String submitMovie231mtemp = sampleServiceProxyid.submitMovie(movieId_50idTemp,personId_51idTemp);
if(submitMovie231mtemp == null){
%>
<%=submitMovie231mtemp %>
<%
}else{
        String tempResultreturnp232 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitMovie231mtemp));
        %>
        <%= tempResultreturnp232 %>
        <%
}
break;
case 238:
        gotMethod = true;
        String banner_53id=  request.getParameter("banner243");
            java.lang.String banner_53idTemp = null;
        if(!banner_53id.equals("")){
         banner_53idTemp  = banner_53id;
        }
        String nbAvailable_54id=  request.getParameter("nbAvailable245");
        int nbAvailable_54idTemp  = Integer.parseInt(nbAvailable_54id);
        String name_55id=  request.getParameter("name247");
            java.lang.String name_55idTemp = null;
        if(!name_55id.equals("")){
         name_55idTemp  = name_55id;
        }
        String rentAmount_56id=  request.getParameter("rentAmount249");
        double rentAmount_56idTemp  = Double.parseDouble(rentAmount_56id);
        String releaseDate_57id=  request.getParameter("releaseDate251");
            java.util.Calendar releaseDate_57idTemp = null;
        if(!releaseDate_57id.equals("")){
        java.text.DateFormat dateFormatreleaseDate251 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempreleaseDate251  = dateFormatreleaseDate251.parse(releaseDate_57id);
         releaseDate_57idTemp = new java.util.GregorianCalendar();
        releaseDate_57idTemp.setTime(dateTempreleaseDate251);
        }
        String id_58id=  request.getParameter("id253");
        int id_58idTemp  = Integer.parseInt(id_58id);
        %>
        <jsp:useBean id="video1dto1Movie_52id" scope="session" class="video.dto.Movie" />
        <%
        video1dto1Movie_52id.setBanner(banner_53idTemp);
        video1dto1Movie_52id.setNbAvailable(nbAvailable_54idTemp);
        video1dto1Movie_52id.setName(name_55idTemp);
        video1dto1Movie_52id.setRentAmount(rentAmount_56idTemp);
        video1dto1Movie_52id.setReleaseDate(releaseDate_57idTemp);
        video1dto1Movie_52id.setId(id_58idTemp);
        java.lang.String updateMovie238mtemp = sampleServiceProxyid.updateMovie(video1dto1Movie_52id);
if(updateMovie238mtemp == null){
%>
<%=updateMovie238mtemp %>
<%
}else{
        String tempResultreturnp239 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updateMovie238mtemp));
        %>
        <%= tempResultreturnp239 %>
        <%
}
break;
case 255:
        gotMethod = true;
        String movieId_59id=  request.getParameter("movieId258");
            java.lang.String movieId_59idTemp = null;
        if(!movieId_59id.equals("")){
         movieId_59idTemp  = movieId_59id;
        }
        java.lang.String deleteMovie255mtemp = sampleServiceProxyid.deleteMovie(movieId_59idTemp);
if(deleteMovie255mtemp == null){
%>
<%=deleteMovie255mtemp %>
<%
}else{
        String tempResultreturnp256 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deleteMovie255mtemp));
        %>
        <%= tempResultreturnp256 %>
        <%
}
break;
case 260:
        gotMethod = true;
        String registration_61id=  request.getParameter("registration265");
            java.util.Calendar registration_61idTemp = null;
        if(!registration_61id.equals("")){
        java.text.DateFormat dateFormatregistration265 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration265  = dateFormatregistration265.parse(registration_61id);
         registration_61idTemp = new java.util.GregorianCalendar();
        registration_61idTemp.setTime(dateTempregistration265);
        }
        String password_62id=  request.getParameter("password267");
            java.lang.String password_62idTemp = null;
        if(!password_62id.equals("")){
         password_62idTemp  = password_62id;
        }
        String lastName_63id=  request.getParameter("lastName269");
            java.lang.String lastName_63idTemp = null;
        if(!lastName_63id.equals("")){
         lastName_63idTemp  = lastName_63id;
        }
        String firstName_64id=  request.getParameter("firstName271");
            java.lang.String firstName_64idTemp = null;
        if(!firstName_64id.equals("")){
         firstName_64idTemp  = firstName_64id;
        }
        String last_login_65id=  request.getParameter("last_login273");
            java.util.Calendar last_login_65idTemp = null;
        if(!last_login_65id.equals("")){
        java.text.DateFormat dateFormatlast_login273 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login273  = dateFormatlast_login273.parse(last_login_65id);
         last_login_65idTemp = new java.util.GregorianCalendar();
        last_login_65idTemp.setTime(dateTemplast_login273);
        }
        String username_66id=  request.getParameter("username275");
            java.lang.String username_66idTemp = null;
        if(!username_66id.equals("")){
         username_66idTemp  = username_66id;
        }
        String id_67id=  request.getParameter("id277");
        int id_67idTemp  = Integer.parseInt(id_67id);
        %>
        <jsp:useBean id="video1dto1Person_60id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_60id.setRegistration(registration_61idTemp);
        video1dto1Person_60id.setPassword(password_62idTemp);
        video1dto1Person_60id.setLastName(lastName_63idTemp);
        video1dto1Person_60id.setFirstName(firstName_64idTemp);
        video1dto1Person_60id.setLast_login(last_login_65idTemp);
        video1dto1Person_60id.setUsername(username_66idTemp);
        video1dto1Person_60id.setId(id_67idTemp);
        String accountType_68id=  request.getParameter("accountType279");
        int accountType_68idTemp  = Integer.parseInt(accountType_68id);
        java.lang.String signUp260mtemp = sampleServiceProxyid.signUp(video1dto1Person_60id,accountType_68idTemp);
if(signUp260mtemp == null){
%>
<%=signUp260mtemp %>
<%
}else{
        String tempResultreturnp261 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp260mtemp));
        %>
        <%= tempResultreturnp261 %>
        <%
}
break;
case 281:
        gotMethod = true;
        String id_69id=  request.getParameter("id284");
        int id_69idTemp  = Integer.parseInt(id_69id);
        String name_70id=  request.getParameter("name286");
            java.lang.String name_70idTemp = null;
        if(!name_70id.equals("")){
         name_70idTemp  = name_70id;
        }
        String banner_71id=  request.getParameter("banner288");
            java.lang.String banner_71idTemp = null;
        if(!banner_71id.equals("")){
         banner_71idTemp  = banner_71id;
        }
        String release_72id=  request.getParameter("release290");
            java.util.Calendar release_72idTemp = null;
        if(!release_72id.equals("")){
        java.text.DateFormat dateFormatrelease290 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemprelease290  = dateFormatrelease290.parse(release_72id);
         release_72idTemp = new java.util.GregorianCalendar();
        release_72idTemp.setTime(dateTemprelease290);
        }
        String rentalPrice_73id=  request.getParameter("rentalPrice292");
        double rentalPrice_73idTemp  = Double.parseDouble(rentalPrice_73id);
        String category_74id=  request.getParameter("category294");
        int category_74idTemp  = Integer.parseInt(category_74id);
        String isAvailable_75id=  request.getParameter("isAvailable296");
        boolean isAvailable_75idTemp  = Boolean.valueOf(isAvailable_75id).booleanValue();
        video.dto.Movie[] findMovies281mtemp = sampleServiceProxyid.findMovies(id_69idTemp,name_70idTemp,banner_71idTemp,release_72idTemp,rentalPrice_73idTemp,category_74idTemp,isAvailable_75idTemp);
if(findMovies281mtemp == null){
%>
<%=findMovies281mtemp %>
<%
}else{
        String tempreturnp282 = null;
        if(findMovies281mtemp != null){
        java.util.List listreturnp282= java.util.Arrays.asList(findMovies281mtemp);
        tempreturnp282 = listreturnp282.toString();
        }
        %>
        <%=tempreturnp282%>
        <%
}
break;
case 298:
        gotMethod = true;
        String personId_76id=  request.getParameter("personId329");
        int personId_76idTemp  = Integer.parseInt(personId_76id);
        String month_77id=  request.getParameter("month331");
        int month_77idTemp  = Integer.parseInt(month_77id);
        String year_78id=  request.getParameter("year333");
        int year_78idTemp  = Integer.parseInt(year_78id);
        video.dto.Bill generateBill298mtemp = sampleServiceProxyid.generateBill(personId_76idTemp,month_77idTemp,year_78idTemp);
if(generateBill298mtemp == null){
%>
<%=generateBill298mtemp %>
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
if(generateBill298mtemp != null){
%>
<%=generateBill298mtemp.getOutstandingMovie()
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.util.Calendar typeregistration307 = tebece1.getRegistration();
        java.text.DateFormat dateFormatregistration307 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration307 = typeregistration307.getTime();
        String tempResultregistration307 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration307.format(dateregistration307));
        %>
        <%= tempResultregistration307 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typepassword309 = tebece1.getPassword();
        String tempResultpassword309 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword309));
        %>
        <%= tempResultpassword309 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typelastName311 = tebece1.getLastName();
        String tempResultlastName311 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName311));
        %>
        <%= tempResultlastName311 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typefirstName313 = tebece1.getFirstName();
        String tempResultfirstName313 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName313));
        %>
        <%= tempResultfirstName313 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.util.Calendar typelast_login315 = tebece1.getLast_login();
        java.text.DateFormat dateFormatlast_login315 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login315 = typelast_login315.getTime();
        String tempResultlast_login315 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login315.format(datelast_login315));
        %>
        <%= tempResultlast_login315 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Person tebece1=tebece0.getPerson();
if(tebece1 != null){
java.lang.String typeusername317 = tebece1.getUsername();
        String tempResultusername317 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername317));
        %>
        <%= tempResultusername317 %>
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
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
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Movie[] typelistActualRentMovie321 = tebece0.getListActualRentMovie();
        String templistActualRentMovie321 = null;
        if(typelistActualRentMovie321 != null){
        java.util.List listlistActualRentMovie321= java.util.Arrays.asList(typelistActualRentMovie321);
        templistActualRentMovie321 = listlistActualRentMovie321.toString();
        }
        %>
        <%=templistActualRentMovie321%>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(generateBill298mtemp != null){
video.dto.PersonInfo tebece0=generateBill298mtemp.getPersonInfo();
if(tebece0 != null){
video.dto.Movie[] typelistRentMovie323 = tebece0.getListRentMovie();
        String templistRentMovie323 = null;
        if(typelistRentMovie323 != null){
        java.util.List listlistRentMovie323= java.util.Arrays.asList(typelistRentMovie323);
        templistRentMovie323 = listlistRentMovie323.toString();
        }
        %>
        <%=templistRentMovie323%>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">month:</TD>
<TD>
<%
if(generateBill298mtemp != null){
%>
<%=generateBill298mtemp.getMonth()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlySubscription:</TD>
<TD>
<%
if(generateBill298mtemp != null){
%>
<%=generateBill298mtemp.getMonthlySubscription()
%><%}%>
</TD>
</TABLE>
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