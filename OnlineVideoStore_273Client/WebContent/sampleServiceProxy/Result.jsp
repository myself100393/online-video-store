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
        String personId_3id=  request.getParameter("personId40");
        int personId_3idTemp  = Integer.parseInt(personId_3id);
        java.lang.String deletePerson37mtemp = sampleServiceProxyid.deletePerson(personId_3idTemp);
if(deletePerson37mtemp == null){
%>
<%=deletePerson37mtemp %>
<%
}else{
        String tempResultreturnp38 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deletePerson37mtemp));
        %>
        <%= tempResultreturnp38 %>
        <%
}
break;
case 42:
        gotMethod = true;
        String username_4id=  request.getParameter("username59");
            java.lang.String username_4idTemp = null;
        if(!username_4id.equals("")){
         username_4idTemp  = username_4id;
        }
        video.dto.Person getPerson42mtemp = sampleServiceProxyid.getPerson(username_4idTemp);
if(getPerson42mtemp == null){
%>
<%=getPerson42mtemp %>
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
if(getPerson42mtemp != null){
java.lang.String typeregistration45 = getPerson42mtemp.getRegistration();
        String tempResultregistration45 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeregistration45));
        %>
        <%= tempResultregistration45 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getPerson42mtemp != null){
java.lang.String typepassword47 = getPerson42mtemp.getPassword();
        String tempResultpassword47 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword47));
        %>
        <%= tempResultpassword47 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(getPerson42mtemp != null){
java.lang.String typelastName49 = getPerson42mtemp.getLastName();
        String tempResultlastName49 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName49));
        %>
        <%= tempResultlastName49 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(getPerson42mtemp != null){
java.lang.String typefirstName51 = getPerson42mtemp.getFirstName();
        String tempResultfirstName51 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName51));
        %>
        <%= tempResultfirstName51 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(getPerson42mtemp != null){
java.lang.String typelast_login53 = getPerson42mtemp.getLast_login();
        String tempResultlast_login53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelast_login53));
        %>
        <%= tempResultlast_login53 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD>
<%
if(getPerson42mtemp != null){
java.lang.String typeusername55 = getPerson42mtemp.getUsername();
        String tempResultusername55 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername55));
        %>
        <%= tempResultusername55 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getPerson42mtemp != null){
%>
<%=getPerson42mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 61:
        gotMethod = true;
        String userId_5id=  request.getParameter("userId78");
        int userId_5idTemp  = Integer.parseInt(userId_5id);
        video.dto.Account getAccount61mtemp = sampleServiceProxyid.getAccount(userId_5idTemp);
if(getAccount61mtemp == null){
%>
<%=getAccount61mtemp %>
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
if(getAccount61mtemp != null){
java.lang.String typessn64 = getAccount61mtemp.getSsn();
        String tempResultssn64 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn64));
        %>
        <%= tempResultssn64 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getOutstandingMovies()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getMonthlyFee()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getBalance()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getUserType()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAccount61mtemp != null){
%>
<%=getAccount61mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 80:
        gotMethod = true;
        String username_6id=  request.getParameter("username83");
            java.lang.String username_6idTemp = null;
        if(!username_6id.equals("")){
         username_6idTemp  = username_6id;
        }
        String pwd_7id=  request.getParameter("pwd85");
            java.lang.String pwd_7idTemp = null;
        if(!pwd_7id.equals("")){
         pwd_7idTemp  = pwd_7id;
        }
        java.lang.String logon80mtemp = sampleServiceProxyid.logon(username_6idTemp,pwd_7idTemp);
if(logon80mtemp == null){
%>
<%=logon80mtemp %>
<%
}else{
        String tempResultreturnp81 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logon80mtemp));
        %>
        <%= tempResultreturnp81 %>
        <%
}
break;
case 87:
        gotMethod = true;
        String name_8id=  request.getParameter("name90");
            java.lang.String name_8idTemp = null;
        if(!name_8id.equals("")){
         name_8idTemp  = name_8id;
        }
        String banner_9id=  request.getParameter("banner92");
            java.lang.String banner_9idTemp = null;
        if(!banner_9id.equals("")){
         banner_9idTemp  = banner_9id;
        }
        String release_10id=  request.getParameter("release94");
            java.util.Calendar release_10idTemp = null;
        if(!release_10id.equals("")){
        java.text.DateFormat dateFormatrelease94 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemprelease94  = dateFormatrelease94.parse(release_10id);
         release_10idTemp = new java.util.GregorianCalendar();
        release_10idTemp.setTime(dateTemprelease94);
        }
        String rentalPrice_11id=  request.getParameter("rentalPrice96");
        double rentalPrice_11idTemp  = Double.parseDouble(rentalPrice_11id);
        String category_12id=  request.getParameter("category98");
        int category_12idTemp  = Integer.parseInt(category_12id);
        String isAvailable_13id=  request.getParameter("isAvailable100");
        boolean isAvailable_13idTemp  = Boolean.valueOf(isAvailable_13id).booleanValue();
        video.dto.Movie[] findMovies87mtemp = sampleServiceProxyid.findMovies(name_8idTemp,banner_9idTemp,release_10idTemp,rentalPrice_11idTemp,category_12idTemp,isAvailable_13idTemp);
if(findMovies87mtemp == null){
%>
<%=findMovies87mtemp %>
<%
}else{
        String tempreturnp88 = null;
        if(findMovies87mtemp != null){
        java.util.List listreturnp88= java.util.Arrays.asList(findMovies87mtemp);
        tempreturnp88 = listreturnp88.toString();
        }
        %>
        <%=tempreturnp88%>
        <%
}
break;
case 102:
        gotMethod = true;
        video.dto.Movie[] listMovies102mtemp = sampleServiceProxyid.listMovies();
if(listMovies102mtemp == null){
%>
<%=listMovies102mtemp %>
<%
}else{
        String tempreturnp103 = null;
        if(listMovies102mtemp != null){
        java.util.List listreturnp103= java.util.Arrays.asList(listMovies102mtemp);
        tempreturnp103 = listreturnp103.toString();
        }
        %>
        <%=tempreturnp103%>
        <%
}
break;
case 105:
        gotMethod = true;
        String movieId_14id=  request.getParameter("movieId108");
        int movieId_14idTemp  = Integer.parseInt(movieId_14id);
        String personId_15id=  request.getParameter("personId110");
        int personId_15idTemp  = Integer.parseInt(personId_15id);
        java.lang.String issueMovie105mtemp = sampleServiceProxyid.issueMovie(movieId_14idTemp,personId_15idTemp);
if(issueMovie105mtemp == null){
%>
<%=issueMovie105mtemp %>
<%
}else{
        String tempResultreturnp106 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(issueMovie105mtemp));
        %>
        <%= tempResultreturnp106 %>
        <%
}
break;
case 112:
        gotMethod = true;
        String movieId_16id=  request.getParameter("movieId115");
        int movieId_16idTemp  = Integer.parseInt(movieId_16id);
        String personId_17id=  request.getParameter("personId117");
        int personId_17idTemp  = Integer.parseInt(personId_17id);
        java.lang.String submitMovie112mtemp = sampleServiceProxyid.submitMovie(movieId_16idTemp,personId_17idTemp);
if(submitMovie112mtemp == null){
%>
<%=submitMovie112mtemp %>
<%
}else{
        String tempResultreturnp113 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitMovie112mtemp));
        %>
        <%= tempResultreturnp113 %>
        <%
}
break;
case 119:
        gotMethod = true;
        String registration_19id=  request.getParameter("registration124");
            java.lang.String registration_19idTemp = null;
        if(!registration_19id.equals("")){
         registration_19idTemp  = registration_19id;
        }
        String password_20id=  request.getParameter("password126");
            java.lang.String password_20idTemp = null;
        if(!password_20id.equals("")){
         password_20idTemp  = password_20id;
        }
        String lastName_21id=  request.getParameter("lastName128");
            java.lang.String lastName_21idTemp = null;
        if(!lastName_21id.equals("")){
         lastName_21idTemp  = lastName_21id;
        }
        String firstName_22id=  request.getParameter("firstName130");
            java.lang.String firstName_22idTemp = null;
        if(!firstName_22id.equals("")){
         firstName_22idTemp  = firstName_22id;
        }
        String last_login_23id=  request.getParameter("last_login132");
            java.lang.String last_login_23idTemp = null;
        if(!last_login_23id.equals("")){
         last_login_23idTemp  = last_login_23id;
        }
        String username_24id=  request.getParameter("username134");
            java.lang.String username_24idTemp = null;
        if(!username_24id.equals("")){
         username_24idTemp  = username_24id;
        }
        String id_25id=  request.getParameter("id136");
        int id_25idTemp  = Integer.parseInt(id_25id);
        %>
        <jsp:useBean id="video1dto1Person_18id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_18id.setRegistration(registration_19idTemp);
        video1dto1Person_18id.setPassword(password_20idTemp);
        video1dto1Person_18id.setLastName(lastName_21idTemp);
        video1dto1Person_18id.setFirstName(firstName_22idTemp);
        video1dto1Person_18id.setLast_login(last_login_23idTemp);
        video1dto1Person_18id.setUsername(username_24idTemp);
        video1dto1Person_18id.setId(id_25idTemp);
        String accountType_26id=  request.getParameter("accountType138");
        int accountType_26idTemp  = Integer.parseInt(accountType_26id);
        java.lang.String signUp119mtemp = sampleServiceProxyid.signUp(video1dto1Person_18id,accountType_26idTemp);
if(signUp119mtemp == null){
%>
<%=signUp119mtemp %>
<%
}else{
        String tempResultreturnp120 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp119mtemp));
        %>
        <%= tempResultreturnp120 %>
        <%
}
break;
case 140:
        gotMethod = true;
        String registration_28id=  request.getParameter("registration145");
            java.lang.String registration_28idTemp = null;
        if(!registration_28id.equals("")){
         registration_28idTemp  = registration_28id;
        }
        String password_29id=  request.getParameter("password147");
            java.lang.String password_29idTemp = null;
        if(!password_29id.equals("")){
         password_29idTemp  = password_29id;
        }
        String lastName_30id=  request.getParameter("lastName149");
            java.lang.String lastName_30idTemp = null;
        if(!lastName_30id.equals("")){
         lastName_30idTemp  = lastName_30id;
        }
        String firstName_31id=  request.getParameter("firstName151");
            java.lang.String firstName_31idTemp = null;
        if(!firstName_31id.equals("")){
         firstName_31idTemp  = firstName_31id;
        }
        String last_login_32id=  request.getParameter("last_login153");
            java.lang.String last_login_32idTemp = null;
        if(!last_login_32id.equals("")){
         last_login_32idTemp  = last_login_32id;
        }
        String username_33id=  request.getParameter("username155");
            java.lang.String username_33idTemp = null;
        if(!username_33id.equals("")){
         username_33idTemp  = username_33id;
        }
        String id_34id=  request.getParameter("id157");
        int id_34idTemp  = Integer.parseInt(id_34id);
        %>
        <jsp:useBean id="video1dto1Person_27id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_27id.setRegistration(registration_28idTemp);
        video1dto1Person_27id.setPassword(password_29idTemp);
        video1dto1Person_27id.setLastName(lastName_30idTemp);
        video1dto1Person_27id.setFirstName(firstName_31idTemp);
        video1dto1Person_27id.setLast_login(last_login_32idTemp);
        video1dto1Person_27id.setUsername(username_33idTemp);
        video1dto1Person_27id.setId(id_34idTemp);
        String ssn_36id=  request.getParameter("ssn161");
            java.lang.String ssn_36idTemp = null;
        if(!ssn_36id.equals("")){
         ssn_36idTemp  = ssn_36id;
        }
        String outstandingMovies_37id=  request.getParameter("outstandingMovies163");
        int outstandingMovies_37idTemp  = Integer.parseInt(outstandingMovies_37id);
        String personId_38id=  request.getParameter("personId165");
        int personId_38idTemp  = Integer.parseInt(personId_38id);
        String monthlyFee_39id=  request.getParameter("monthlyFee167");
        double monthlyFee_39idTemp  = Double.parseDouble(monthlyFee_39id);
        String balance_40id=  request.getParameter("balance169");
        double balance_40idTemp  = Double.parseDouble(balance_40id);
        String userType_41id=  request.getParameter("userType171");
        int userType_41idTemp  = Integer.parseInt(userType_41id);
        String id_42id=  request.getParameter("id173");
        int id_42idTemp  = Integer.parseInt(id_42id);
        %>
        <jsp:useBean id="video1dto1Account_35id" scope="session" class="video.dto.Account" />
        <%
        video1dto1Account_35id.setSsn(ssn_36idTemp);
        video1dto1Account_35id.setOutstandingMovies(outstandingMovies_37idTemp);
        video1dto1Account_35id.setPersonId(personId_38idTemp);
        video1dto1Account_35id.setMonthlyFee(monthlyFee_39idTemp);
        video1dto1Account_35id.setBalance(balance_40idTemp);
        video1dto1Account_35id.setUserType(userType_41idTemp);
        video1dto1Account_35id.setId(id_42idTemp);
        String zip_44id=  request.getParameter("zip177");
            java.lang.String zip_44idTemp = null;
        if(!zip_44id.equals("")){
         zip_44idTemp  = zip_44id;
        }
        String personId_45id=  request.getParameter("personId179");
        int personId_45idTemp  = Integer.parseInt(personId_45id);
        String state_46id=  request.getParameter("state181");
            java.lang.String state_46idTemp = null;
        if(!state_46id.equals("")){
         state_46idTemp  = state_46id;
        }
        String country_47id=  request.getParameter("country183");
            java.lang.String country_47idTemp = null;
        if(!country_47id.equals("")){
         country_47idTemp  = country_47id;
        }
        String city_48id=  request.getParameter("city185");
            java.lang.String city_48idTemp = null;
        if(!city_48id.equals("")){
         city_48idTemp  = city_48id;
        }
        String street_49id=  request.getParameter("street187");
            java.lang.String street_49idTemp = null;
        if(!street_49id.equals("")){
         street_49idTemp  = street_49id;
        }
        String id_50id=  request.getParameter("id189");
        int id_50idTemp  = Integer.parseInt(id_50id);
        %>
        <jsp:useBean id="video1dto1Address_43id" scope="session" class="video.dto.Address" />
        <%
        video1dto1Address_43id.setZip(zip_44idTemp);
        video1dto1Address_43id.setPersonId(personId_45idTemp);
        video1dto1Address_43id.setState(state_46idTemp);
        video1dto1Address_43id.setCountry(country_47idTemp);
        video1dto1Address_43id.setCity(city_48idTemp);
        video1dto1Address_43id.setStreet(street_49idTemp);
        video1dto1Address_43id.setId(id_50idTemp);
        java.lang.String updatePersonAccount140mtemp = sampleServiceProxyid.updatePersonAccount(video1dto1Person_27id,video1dto1Account_35id,video1dto1Address_43id);
if(updatePersonAccount140mtemp == null){
%>
<%=updatePersonAccount140mtemp %>
<%
}else{
        String tempResultreturnp141 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonAccount140mtemp));
        %>
        <%= tempResultreturnp141 %>
        <%
}
break;
case 191:
        gotMethod = true;
        String username_51id=  request.getParameter("username194");
            java.lang.String username_51idTemp = null;
        if(!username_51id.equals("")){
         username_51idTemp  = username_51id;
        }
        boolean isUsernameExisted191mtemp = sampleServiceProxyid.isUsernameExisted(username_51idTemp);
        String tempResultreturnp192 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(isUsernameExisted191mtemp));
        %>
        <%= tempResultreturnp192 %>
        <%
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