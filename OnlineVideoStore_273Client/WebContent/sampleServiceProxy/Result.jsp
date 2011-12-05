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
        String id_3id=  request.getParameter("id40");
        long id_3idTemp  = Long.parseLong(id_3id);
        String firstName_4id=  request.getParameter("firstName42");
            java.lang.String firstName_4idTemp = null;
        if(!firstName_4id.equals("")){
         firstName_4idTemp  = firstName_4id;
        }
        String lastName_5id=  request.getParameter("lastName44");
            java.lang.String lastName_5idTemp = null;
        if(!lastName_5id.equals("")){
         lastName_5idTemp  = lastName_5id;
        }
        String username_6id=  request.getParameter("username46");
            java.lang.String username_6idTemp = null;
        if(!username_6id.equals("")){
         username_6idTemp  = username_6id;
        }
        String registration_7id=  request.getParameter("registration48");
            java.util.Calendar registration_7idTemp = null;
        if(!registration_7id.equals("")){
        java.text.DateFormat dateFormatregistration48 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration48  = dateFormatregistration48.parse(registration_7id);
         registration_7idTemp = new java.util.GregorianCalendar();
        registration_7idTemp.setTime(dateTempregistration48);
        }
        String last_Login_8id=  request.getParameter("last_Login50");
            java.util.Calendar last_Login_8idTemp = null;
        if(!last_Login_8id.equals("")){
        java.text.DateFormat dateFormatlast_Login50 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_Login50  = dateFormatlast_Login50.parse(last_Login_8id);
         last_Login_8idTemp = new java.util.GregorianCalendar();
        last_Login_8idTemp.setTime(dateTemplast_Login50);
        }
        video.dto.Person[] find_Persons37mtemp = sampleServiceProxyid.find_Persons(id_3idTemp,firstName_4idTemp,lastName_5idTemp,username_6idTemp,registration_7idTemp,last_Login_8idTemp);
if(find_Persons37mtemp == null){
%>
<%=find_Persons37mtemp %>
<%
}else{
        String tempreturnp38 = null;
        if(find_Persons37mtemp != null){
        java.util.List listreturnp38= java.util.Arrays.asList(find_Persons37mtemp);
        tempreturnp38 = listreturnp38.toString();
        }
        %>
        <%=tempreturnp38%>
        <%
}
break;
case 52:
        gotMethod = true;
        String personId_9id=  request.getParameter("personId55");
        int personId_9idTemp  = Integer.parseInt(personId_9id);
        java.lang.String deletePerson52mtemp = sampleServiceProxyid.deletePerson(personId_9idTemp);
if(deletePerson52mtemp == null){
%>
<%=deletePerson52mtemp %>
<%
}else{
        String tempResultreturnp53 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(deletePerson52mtemp));
        %>
        <%= tempResultreturnp53 %>
        <%
}
break;
case 57:
        gotMethod = true;
        String movieId_10id=  request.getParameter("movieId76");
        int movieId_10idTemp  = Integer.parseInt(movieId_10id);
        video.dto.MovieInfo displayMovie57mtemp = sampleServiceProxyid.displayMovie(movieId_10idTemp);
if(displayMovie57mtemp == null){
%>
<%=displayMovie57mtemp %>
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
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
if(tebece0 != null){
java.lang.String typebanner62 = tebece0.getBanner();
        String tempResultbanner62 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typebanner62));
        %>
        <%= tempResultbanner62 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">nbAvailable:</TD>
<TD>
<%
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
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
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
if(tebece0 != null){
java.lang.String typename66 = tebece0.getName();
        String tempResultname66 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typename66));
        %>
        <%= tempResultname66 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">rentAmount:</TD>
<TD>
<%
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
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
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
if(tebece0 != null){
java.lang.String typereleaseDate70 = tebece0.getReleaseDate();
        String tempResultreleaseDate70 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typereleaseDate70));
        %>
        <%= tempResultreleaseDate70 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayMovie57mtemp != null){
video.dto.Movie tebece0=displayMovie57mtemp.getMovie();
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
if(displayMovie57mtemp != null){
video.dto.Person[] typelistPerson74 = displayMovie57mtemp.getListPerson();
        String templistPerson74 = null;
        if(typelistPerson74 != null){
        java.util.List listlistPerson74= java.util.Arrays.asList(typelistPerson74);
        templistPerson74 = listlistPerson74.toString();
        }
        %>
        <%=templistPerson74%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 78:
        gotMethod = true;
        String id_11id=  request.getParameter("id81");
        long id_11idTemp  = Long.parseLong(id_11id);
        String name_12id=  request.getParameter("name83");
            java.lang.String name_12idTemp = null;
        if(!name_12id.equals("")){
         name_12idTemp  = name_12id;
        }
        String banner_13id=  request.getParameter("banner85");
            java.lang.String banner_13idTemp = null;
        if(!banner_13id.equals("")){
         banner_13idTemp  = banner_13id;
        }
        String release_14id=  request.getParameter("release87");
            java.lang.String release_14idTemp = null;
        if(!release_14id.equals("")){
         release_14idTemp  = release_14id;
        }
        String rentalPrice_15id=  request.getParameter("rentalPrice89");
        double rentalPrice_15idTemp  = Double.parseDouble(rentalPrice_15id);
        String category_16id=  request.getParameter("category91");
        int category_16idTemp  = Integer.parseInt(category_16id);
        String isAvailable_17id=  request.getParameter("isAvailable93");
        boolean isAvailable_17idTemp  = Boolean.valueOf(isAvailable_17id).booleanValue();
        video.dto.Movie[] findMovies78mtemp = sampleServiceProxyid.findMovies(id_11idTemp,name_12idTemp,banner_13idTemp,release_14idTemp,rentalPrice_15idTemp,category_16idTemp,isAvailable_17idTemp);
if(findMovies78mtemp == null){
%>
<%=findMovies78mtemp %>
<%
}else{
        String tempreturnp79 = null;
        if(findMovies78mtemp != null){
        java.util.List listreturnp79= java.util.Arrays.asList(findMovies78mtemp);
        tempreturnp79 = listreturnp79.toString();
        }
        %>
        <%=tempreturnp79%>
        <%
}
break;
case 95:
        gotMethod = true;
        video.dto.Movie[] listMovies95mtemp = sampleServiceProxyid.listMovies();
if(listMovies95mtemp == null){
%>
<%=listMovies95mtemp %>
<%
}else{
        String tempreturnp96 = null;
        if(listMovies95mtemp != null){
        java.util.List listreturnp96= java.util.Arrays.asList(listMovies95mtemp);
        tempreturnp96 = listreturnp96.toString();
        }
        %>
        <%=tempreturnp96%>
        <%
}
break;
case 98:
        gotMethod = true;
        String movieId_18id=  request.getParameter("movieId101");
        int movieId_18idTemp  = Integer.parseInt(movieId_18id);
        String personId_19id=  request.getParameter("personId103");
        int personId_19idTemp  = Integer.parseInt(personId_19id);
        java.lang.String issueMovie98mtemp = sampleServiceProxyid.issueMovie(movieId_18idTemp,personId_19idTemp);
if(issueMovie98mtemp == null){
%>
<%=issueMovie98mtemp %>
<%
}else{
        String tempResultreturnp99 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(issueMovie98mtemp));
        %>
        <%= tempResultreturnp99 %>
        <%
}
break;
case 105:
        gotMethod = true;
        String movieId_20id=  request.getParameter("movieId108");
        int movieId_20idTemp  = Integer.parseInt(movieId_20id);
        String personId_21id=  request.getParameter("personId110");
        int personId_21idTemp  = Integer.parseInt(personId_21id);
        java.lang.String submitMovie105mtemp = sampleServiceProxyid.submitMovie(movieId_20idTemp,personId_21idTemp);
if(submitMovie105mtemp == null){
%>
<%=submitMovie105mtemp %>
<%
}else{
        String tempResultreturnp106 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(submitMovie105mtemp));
        %>
        <%= tempResultreturnp106 %>
        <%
}
break;
case 112:
        gotMethod = true;
        String userId_22id=  request.getParameter("userId129");
        long userId_22idTemp  = Long.parseLong(userId_22id);
        video.dto.Account getAccount112mtemp = sampleServiceProxyid.getAccount(userId_22idTemp);
if(getAccount112mtemp == null){
%>
<%=getAccount112mtemp %>
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
if(getAccount112mtemp != null){
java.lang.String typessn115 = getAccount112mtemp.getSsn();
        String tempResultssn115 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typessn115));
        %>
        <%= tempResultssn115 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">outstandingMovies:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getOutstandingMovies()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">personId:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getPersonId()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">monthlyFee:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getMonthlyFee()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">balance:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getBalance()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">userType:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getUserType()
%><%}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getAccount112mtemp != null){
%>
<%=getAccount112mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 131:
        gotMethod = true;
        String registration_24id=  request.getParameter("registration136");
            java.util.Calendar registration_24idTemp = null;
        if(!registration_24id.equals("")){
        java.text.DateFormat dateFormatregistration136 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration136  = dateFormatregistration136.parse(registration_24id);
         registration_24idTemp = new java.util.GregorianCalendar();
        registration_24idTemp.setTime(dateTempregistration136);
        }
        String password_25id=  request.getParameter("password138");
            java.lang.String password_25idTemp = null;
        if(!password_25id.equals("")){
         password_25idTemp  = password_25id;
        }
        String lastName_26id=  request.getParameter("lastName140");
            java.lang.String lastName_26idTemp = null;
        if(!lastName_26id.equals("")){
         lastName_26idTemp  = lastName_26id;
        }
        String firstName_27id=  request.getParameter("firstName142");
            java.lang.String firstName_27idTemp = null;
        if(!firstName_27id.equals("")){
         firstName_27idTemp  = firstName_27id;
        }
        String last_login_28id=  request.getParameter("last_login144");
            java.util.Calendar last_login_28idTemp = null;
        if(!last_login_28id.equals("")){
        java.text.DateFormat dateFormatlast_login144 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login144  = dateFormatlast_login144.parse(last_login_28id);
         last_login_28idTemp = new java.util.GregorianCalendar();
        last_login_28idTemp.setTime(dateTemplast_login144);
        }
        String username_29id=  request.getParameter("username146");
            java.lang.String username_29idTemp = null;
        if(!username_29id.equals("")){
         username_29idTemp  = username_29id;
        }
        String id_30id=  request.getParameter("id148");
        long id_30idTemp  = Long.parseLong(id_30id);
        %>
        <jsp:useBean id="video1dto1Person_23id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_23id.setRegistration(registration_24idTemp);
        video1dto1Person_23id.setPassword(password_25idTemp);
        video1dto1Person_23id.setLastName(lastName_26idTemp);
        video1dto1Person_23id.setFirstName(firstName_27idTemp);
        video1dto1Person_23id.setLast_login(last_login_28idTemp);
        video1dto1Person_23id.setUsername(username_29idTemp);
        video1dto1Person_23id.setId(id_30idTemp);
        String accountType_31id=  request.getParameter("accountType150");
        int accountType_31idTemp  = Integer.parseInt(accountType_31id);
        java.lang.String signUp131mtemp = sampleServiceProxyid.signUp(video1dto1Person_23id,accountType_31idTemp);
if(signUp131mtemp == null){
%>
<%=signUp131mtemp %>
<%
}else{
        String tempResultreturnp132 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(signUp131mtemp));
        %>
        <%= tempResultreturnp132 %>
        <%
}
break;
case 152:
        gotMethod = true;
        String username_32id=  request.getParameter("username169");
            java.lang.String username_32idTemp = null;
        if(!username_32id.equals("")){
         username_32idTemp  = username_32id;
        }
        video.dto.Person getPerson152mtemp = sampleServiceProxyid.getPerson(username_32idTemp);
if(getPerson152mtemp == null){
%>
<%=getPerson152mtemp %>
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
if(getPerson152mtemp != null){
java.util.Calendar typeregistration155 = getPerson152mtemp.getRegistration();
        java.text.DateFormat dateFormatregistration155 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration155 = typeregistration155.getTime();
        String tempResultregistration155 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration155.format(dateregistration155));
        %>
        <%= tempResultregistration155 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">password:</TD>
<TD>
<%
if(getPerson152mtemp != null){
java.lang.String typepassword157 = getPerson152mtemp.getPassword();
        String tempResultpassword157 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword157));
        %>
        <%= tempResultpassword157 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(getPerson152mtemp != null){
java.lang.String typelastName159 = getPerson152mtemp.getLastName();
        String tempResultlastName159 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName159));
        %>
        <%= tempResultlastName159 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(getPerson152mtemp != null){
java.lang.String typefirstName161 = getPerson152mtemp.getFirstName();
        String tempResultfirstName161 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName161));
        %>
        <%= tempResultfirstName161 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(getPerson152mtemp != null){
java.util.Calendar typelast_login163 = getPerson152mtemp.getLast_login();
        java.text.DateFormat dateFormatlast_login163 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login163 = typelast_login163.getTime();
        String tempResultlast_login163 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login163.format(datelast_login163));
        %>
        <%= tempResultlast_login163 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">username:</TD>
<TD>
<%
if(getPerson152mtemp != null){
java.lang.String typeusername165 = getPerson152mtemp.getUsername();
        String tempResultusername165 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername165));
        %>
        <%= tempResultusername165 %>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">id:</TD>
<TD>
<%
if(getPerson152mtemp != null){
%>
<%=getPerson152mtemp.getId()
%><%}%>
</TD>
</TABLE>
<%
}
break;
case 171:
        gotMethod = true;
        String username_33id=  request.getParameter("username174");
            java.lang.String username_33idTemp = null;
        if(!username_33id.equals("")){
         username_33idTemp  = username_33id;
        }
        String pwd_34id=  request.getParameter("pwd176");
            java.lang.String pwd_34idTemp = null;
        if(!pwd_34id.equals("")){
         pwd_34idTemp  = pwd_34id;
        }
        java.lang.String logon171mtemp = sampleServiceProxyid.logon(username_33idTemp,pwd_34idTemp);
if(logon171mtemp == null){
%>
<%=logon171mtemp %>
<%
}else{
        String tempResultreturnp172 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(logon171mtemp));
        %>
        <%= tempResultreturnp172 %>
        <%
}
break;
case 178:
        gotMethod = true;
        String username_35id=  request.getParameter("username181");
            java.lang.String username_35idTemp = null;
        if(!username_35id.equals("")){
         username_35idTemp  = username_35id;
        }
        boolean isUsernameExisted178mtemp = sampleServiceProxyid.isUsernameExisted(username_35idTemp);
        String tempResultreturnp179 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(isUsernameExisted178mtemp));
        %>
        <%= tempResultreturnp179 %>
        <%
break;
case 183:
        gotMethod = true;
        String personId_36id=  request.getParameter("personId206");
        int personId_36idTemp  = Integer.parseInt(personId_36id);
        video.dto.PersonInfo displayPerson183mtemp = sampleServiceProxyid.displayPerson(personId_36idTemp);
if(displayPerson183mtemp == null){
%>
<%=displayPerson183mtemp %>
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
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typeregistration188 = tebece0.getRegistration();
        java.text.DateFormat dateFormatregistration188 = java.text.DateFormat.getDateInstance();
        java.util.Date dateregistration188 = typeregistration188.getTime();
        String tempResultregistration188 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatregistration188.format(dateregistration188));
        %>
        <%= tempResultregistration188 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">password:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.lang.String typepassword190 = tebece0.getPassword();
        String tempResultpassword190 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typepassword190));
        %>
        <%= tempResultpassword190 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">lastName:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.lang.String typelastName192 = tebece0.getLastName();
        String tempResultlastName192 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typelastName192));
        %>
        <%= tempResultlastName192 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">firstName:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.lang.String typefirstName194 = tebece0.getFirstName();
        String tempResultfirstName194 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typefirstName194));
        %>
        <%= tempResultfirstName194 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">last_login:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.util.Calendar typelast_login196 = tebece0.getLast_login();
        java.text.DateFormat dateFormatlast_login196 = java.text.DateFormat.getDateInstance();
        java.util.Date datelast_login196 = typelast_login196.getTime();
        String tempResultlast_login196 = org.eclipse.jst.ws.util.JspUtils.markup(dateFormatlast_login196.format(datelast_login196));
        %>
        <%= tempResultlast_login196 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">username:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
if(tebece0 != null){
java.lang.String typeusername198 = tebece0.getUsername();
        String tempResultusername198 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(typeusername198));
        %>
        <%= tempResultusername198 %>
        <%
}}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD WIDTH="5%"></TD>
<TD COLSPAN="1" ALIGN="LEFT">id:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Person tebece0=displayPerson183mtemp.getPerson();
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
if(displayPerson183mtemp != null){
video.dto.Movie[] typelistActualRentMovie202 = displayPerson183mtemp.getListActualRentMovie();
        String templistActualRentMovie202 = null;
        if(typelistActualRentMovie202 != null){
        java.util.List listlistActualRentMovie202= java.util.Arrays.asList(typelistActualRentMovie202);
        templistActualRentMovie202 = listlistActualRentMovie202.toString();
        }
        %>
        <%=templistActualRentMovie202%>
        <%
}%>
</TD>
<TR>
<TD WIDTH="5%"></TD>
<TD COLSPAN="2" ALIGN="LEFT">listRentMovie:</TD>
<TD>
<%
if(displayPerson183mtemp != null){
video.dto.Movie[] typelistRentMovie204 = displayPerson183mtemp.getListRentMovie();
        String templistRentMovie204 = null;
        if(typelistRentMovie204 != null){
        java.util.List listlistRentMovie204= java.util.Arrays.asList(typelistRentMovie204);
        templistRentMovie204 = listlistRentMovie204.toString();
        }
        %>
        <%=templistRentMovie204%>
        <%
}%>
</TD>
</TABLE>
<%
}
break;
case 208:
        gotMethod = true;
        String registration_38id=  request.getParameter("registration213");
            java.util.Calendar registration_38idTemp = null;
        if(!registration_38id.equals("")){
        java.text.DateFormat dateFormatregistration213 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTempregistration213  = dateFormatregistration213.parse(registration_38id);
         registration_38idTemp = new java.util.GregorianCalendar();
        registration_38idTemp.setTime(dateTempregistration213);
        }
        String password_39id=  request.getParameter("password215");
            java.lang.String password_39idTemp = null;
        if(!password_39id.equals("")){
         password_39idTemp  = password_39id;
        }
        String lastName_40id=  request.getParameter("lastName217");
            java.lang.String lastName_40idTemp = null;
        if(!lastName_40id.equals("")){
         lastName_40idTemp  = lastName_40id;
        }
        String firstName_41id=  request.getParameter("firstName219");
            java.lang.String firstName_41idTemp = null;
        if(!firstName_41id.equals("")){
         firstName_41idTemp  = firstName_41id;
        }
        String last_login_42id=  request.getParameter("last_login221");
            java.util.Calendar last_login_42idTemp = null;
        if(!last_login_42id.equals("")){
        java.text.DateFormat dateFormatlast_login221 = java.text.DateFormat.getDateInstance();
        java.util.Date dateTemplast_login221  = dateFormatlast_login221.parse(last_login_42id);
         last_login_42idTemp = new java.util.GregorianCalendar();
        last_login_42idTemp.setTime(dateTemplast_login221);
        }
        String username_43id=  request.getParameter("username223");
            java.lang.String username_43idTemp = null;
        if(!username_43id.equals("")){
         username_43idTemp  = username_43id;
        }
        String id_44id=  request.getParameter("id225");
        long id_44idTemp  = Long.parseLong(id_44id);
        %>
        <jsp:useBean id="video1dto1Person_37id" scope="session" class="video.dto.Person" />
        <%
        video1dto1Person_37id.setRegistration(registration_38idTemp);
        video1dto1Person_37id.setPassword(password_39idTemp);
        video1dto1Person_37id.setLastName(lastName_40idTemp);
        video1dto1Person_37id.setFirstName(firstName_41idTemp);
        video1dto1Person_37id.setLast_login(last_login_42idTemp);
        video1dto1Person_37id.setUsername(username_43idTemp);
        video1dto1Person_37id.setId(id_44idTemp);
        String ssn_46id=  request.getParameter("ssn229");
            java.lang.String ssn_46idTemp = null;
        if(!ssn_46id.equals("")){
         ssn_46idTemp  = ssn_46id;
        }
        String outstandingMovies_47id=  request.getParameter("outstandingMovies231");
        int outstandingMovies_47idTemp  = Integer.parseInt(outstandingMovies_47id);
        String personId_48id=  request.getParameter("personId233");
        long personId_48idTemp  = Long.parseLong(personId_48id);
        String monthlyFee_49id=  request.getParameter("monthlyFee235");
        double monthlyFee_49idTemp  = Double.parseDouble(monthlyFee_49id);
        String balance_50id=  request.getParameter("balance237");
        double balance_50idTemp  = Double.parseDouble(balance_50id);
        String userType_51id=  request.getParameter("userType239");
        int userType_51idTemp  = Integer.parseInt(userType_51id);
        String id_52id=  request.getParameter("id241");
        long id_52idTemp  = Long.parseLong(id_52id);
        %>
        <jsp:useBean id="video1dto1Account_45id" scope="session" class="video.dto.Account" />
        <%
        video1dto1Account_45id.setSsn(ssn_46idTemp);
        video1dto1Account_45id.setOutstandingMovies(outstandingMovies_47idTemp);
        video1dto1Account_45id.setPersonId(personId_48idTemp);
        video1dto1Account_45id.setMonthlyFee(monthlyFee_49idTemp);
        video1dto1Account_45id.setBalance(balance_50idTemp);
        video1dto1Account_45id.setUserType(userType_51idTemp);
        video1dto1Account_45id.setId(id_52idTemp);
        String zip_54id=  request.getParameter("zip245");
            java.lang.String zip_54idTemp = null;
        if(!zip_54id.equals("")){
         zip_54idTemp  = zip_54id;
        }
        String personId_55id=  request.getParameter("personId247");
        long personId_55idTemp  = Long.parseLong(personId_55id);
        String state_56id=  request.getParameter("state249");
            java.lang.String state_56idTemp = null;
        if(!state_56id.equals("")){
         state_56idTemp  = state_56id;
        }
        String country_57id=  request.getParameter("country251");
            java.lang.String country_57idTemp = null;
        if(!country_57id.equals("")){
         country_57idTemp  = country_57id;
        }
        String city_58id=  request.getParameter("city253");
            java.lang.String city_58idTemp = null;
        if(!city_58id.equals("")){
         city_58idTemp  = city_58id;
        }
        String street_59id=  request.getParameter("street255");
            java.lang.String street_59idTemp = null;
        if(!street_59id.equals("")){
         street_59idTemp  = street_59id;
        }
        String id_60id=  request.getParameter("id257");
        long id_60idTemp  = Long.parseLong(id_60id);
        %>
        <jsp:useBean id="video1dto1Address_53id" scope="session" class="video.dto.Address" />
        <%
        video1dto1Address_53id.setZip(zip_54idTemp);
        video1dto1Address_53id.setPersonId(personId_55idTemp);
        video1dto1Address_53id.setState(state_56idTemp);
        video1dto1Address_53id.setCountry(country_57idTemp);
        video1dto1Address_53id.setCity(city_58idTemp);
        video1dto1Address_53id.setStreet(street_59idTemp);
        video1dto1Address_53id.setId(id_60idTemp);
        java.lang.String updatePersonAccount208mtemp = sampleServiceProxyid.updatePersonAccount(video1dto1Person_37id,video1dto1Account_45id,video1dto1Address_53id);
if(updatePersonAccount208mtemp == null){
%>
<%=updatePersonAccount208mtemp %>
<%
}else{
        String tempResultreturnp209 = org.eclipse.jst.ws.util.JspUtils.markup(String.valueOf(updatePersonAccount208mtemp));
        %>
        <%= tempResultreturnp209 %>
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