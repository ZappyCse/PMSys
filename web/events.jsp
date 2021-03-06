<%-- 
    Document   : skillset
    Created on : 12 Dec, 2016, 8:14:39 AM
    Author     : Arun
--%>

<%@page import="com.zappy.pmsys.beans.OrganizedProgramDetails"%>
<%@page import="com.zappy.pmsys.beans.WorkshopSeminarDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.zappy.pmsys.beans.Experience"%>
<%@page import="com.zappy.pmsys.beans.Industry"%>
<%@page import="com.zappy.pmsys.beans.HandledSubjects"%>
<%@page import="com.zappy.pmsys.beans.AreaOfInterest"%>
<%@page import="java.util.List"%>
<%@page import="com.zappy.pmsys.beans.TeachingFaculty"%>
<%@page import="com.zappy.pmsys.beans.Qualification"%>
<%@page import="com.zappy.pmsys.admin.Administrator"%>
<%@page import="com.zappy.pmsys.beans.Faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Events</title>
    <script src="js/common.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript" >
      
        function check(){
            var x=document.getElementById('eventsattended');
            var val;
            var val1;
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[3].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[4].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        var d1=new Date(val.value);
                        var d2=new Date(val1.value);
                        if(d1.getTime()>d2.getTime()){
                            alert('From Date should be less than To Date');
                            val.style.background='pink';
                            val1.style.background='pink';
                            x.rows[i].cells[5].getElementsByTagName('input')[0].value='';
                            return false;
                        }
                        else{
                            x.rows[i].cells[5].getElementsByTagName('input')[0].value=(d2.getTime()-d1.getTime())/(24*60*60*1000)+1;
                        }
                    }
                }
                val.style.background='white';
                val1.style.background='white';
            }
            
            x=document.getElementById('orgprgdetails');
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[4].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[5].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        var d1=new Date(val.value);
                        var d2=new Date(val1.value);
                        if(d1.getTime()>d2.getTime()){
                            alert('From Date should be less than To Date');
                            val.style.background='pink';
                            val1.style.background='pink';
                            x.rows[i].cells[6].getElementsByTagName('input')[0].value='';
                            return false;
                        }
                        else{
                            x.rows[i].cells[6].getElementsByTagName('input')[0].value=(d2.getTime()-d1.getTime())/(24*60*60*1000)+1;
                        }
                    }
                }
                val.style.background='white';
                val1.style.background='white';
            }
            
            return true;
        }
    </script>
    
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="CSS/common.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
         
    </style>
    </head>
    
    <%  TeachingFaculty faculty=(TeachingFaculty)new Administrator().getUser((String)request.getSession().getAttribute("facultyId"));
        List<WorkshopSeminarDetails> workshopSeminarDetailses=faculty.getWorkshopSeminarDetails();
        if(workshopSeminarDetailses==null)
           workshopSeminarDetailses=new ArrayList<>();
        List<OrganizedProgramDetails> organizedProgramDetailses=faculty.getOrganizedProgramDetails();
        if(organizedProgramDetailses==null)
            organizedProgramDetailses=new ArrayList<>();
        String pname[];
        int index=0;
        int size=0;
        String tmp="";
        %>
    
    <body>
        
        <div id="mySidenav" class="div">
            <a class="closebtn" onclick="closeNav()">&times;</a>
            <a href="home.jsp">Home</a>
            <a href="personalInformation.jsp">Personal Info</a>
            <a href="skillset.jsp">Skill Set</a>
            <a href="additionalInformation.jsp">Additional Information</a>
            <a class="active">Events</a>
            <a href="publications.jsp">Publications</a>
        </div>
        
        <div class="content" id="fm">
            <span id="navbut" onclick="openNav()">&#9776;</span>
            <form method="POST" action="MainServlet" onsubmit="return check()">
                <div id="maindiv">
                    <div class="divic">
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('eventsatt',this)">
                            <span class="icon">Events Attended</span>
                        </div>


                        <div id="eventsatt">
                            <table id = "eventsattended" class="table">

                                <thead>
                                    <th rowspan="2">S.No</th>
                                    <th rowspan="2">Programme Name</th>
                                    <th rowspan="2">Organized By</th>
                                    <th rowspan="2">From Date</th>
                                    <th rowspan="2">To Date</th>
                                    <th rowspan="2">Duration</th>
                                    <th rowspan="2">Region</th>
                                    <th rowspan="2">Event Type</th>
                                </thead>
                                
                                <%
                                    WorkshopSeminarDetails workshopSeminarDetails;
                                    size=workshopSeminarDetailses.size();
                                    while(index<size||size==0){
                                        if(size==0){
                                            workshopSeminarDetails=new WorkshopSeminarDetails();
                                            size=-1;
                                        }
                                        else{
                                            workshopSeminarDetails=(WorkshopSeminarDetails)workshopSeminarDetailses.get(index);
                                        }
                                        pname=workshopSeminarDetails.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="attpname"+tmp %>" id="<%="attpname"+tmp %>" value="<%=pname[0] %>" />
                                    </td>
                                    <td>
                                        <input type="text" name="<%="attorg"+tmp %>" id="<%="attorg"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="attfrom"+tmp %>" id="<%="attfrom"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="attto"+tmp %>" id="<%="attto"+tmp %>" value="<%=pname[3] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" readonly name="<%="attduration"+tmp %>" id="<%="attduration"+tmp %>" value="<%=pname[4] %>"/>
                                    </td>
                                    <td>
                                        <select name="<%="attregion"+tmp %>" id="<%="attregion"+tmp %>" >
                                            <option value='' selected="selected"></option>
                                            <option value="N" <% if(pname[5].equals("N")) {%>selected="selected"<% } %>>National</option>
                                            <option value="I" <% if(pname[5].equals("I")) {%>selected="selected"<% } %>>International</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="<%="attrtype"+tmp %>" id="<%="attrtype"+tmp %>">
                                            <option value='' selected="selected"></option>
                                            <option value="W" <% if(pname[6].equals("W")) {%>selected="selected"<% } %>>Workshop</option>
                                            <option value="S" <% if(pname[6].equals("S")) {%>selected="selected"<% } %>>Seminar</option>
                                            <option value="F" <% if(pname[6].equals("F")) {%>selected="selected"<% } %>>FDTP</option>
                                            <option value="C" <% if(pname[6].equals("C")) {%>selected="selected"<% } %>>Conference</option>
                                        </select>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'eventsattended')"  />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('eventsattended')" class="addcell" />
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('orgprg',this)">
                            <span class="icon">Events Organized</span>
                        </div>

                        <div id="orgprg">
                            <table id = "orgprgdetails" class="table">
                                <thead>
                                    <th>S.No</th>
                                    <th>Program Name</th>
                                    <th>Sponsored By</th>
                                    <th>Acted As</th>
                                    <th>From Date</th>
                                    <th>To Date</th>
                                    <th>Duration</th>
                                    <th>Convener</th>
                                    <th>Region</th>
                                    <th>Event Type</th>
                                </thead>
                                <%
                                    OrganizedProgramDetails organizedProgramDetails;
                                    size=organizedProgramDetailses.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            organizedProgramDetails=new OrganizedProgramDetails();
                                            size=-1;
                                        }
                                        else{
                                            organizedProgramDetails=(OrganizedProgramDetails)organizedProgramDetailses.get(index);
                                        }
                                        pname=organizedProgramDetails.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="orgprgname"+tmp %>" id="<%="orgprgname"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="orgsponsby"+tmp %>" id="<%="orgsponsby"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="orgactedas"+tmp %>" id="<%="orgactedas"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td><input type="date" name="<%="orgfromdate"+tmp %>" id="<%="orgfromdate"+tmp %>" value="<%=pname[3] %>"/></td>
                                    <td><input type="date" name="<%="orgtodate"+tmp %>" id="<%="orgtodate"+tmp %>" value="<%=pname[4] %>"/></td>
                                    <td><input type="number" readonly="readonly" name="<%="orgduration"+tmp %>" id="<%="orgduration"+tmp %>" value="<%=pname[5] %>"/></td>
                                    <td><input type="text" name="<%="orgconvener"+tmp %>" id="<%="orgconvener"+tmp %>" value="<%=pname[6] %>"/></td>
                                    <td>
                                        <select name="<%="orgregion"+tmp %>" id="<%="orgregion"+tmp %>" >
                                            <option value=''></option>
                                            <option value="N" <% if(pname[7].equals("N")) {%>selected="selected"<% } %>>National</option>
                                            <option value="I" <% if(pname[7].equals("I")) {%>selected="selected"<% } %>>International</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="<%="orgrtype"+tmp %>" id="<%="orgrtype"+tmp %>">
                                            <option value=''></option>
                                            <option value="W" <% if(pname[8].equals("W")) {%>selected="selected"<% } %>>Workshop</option>
                                            <option value="S" <% if(pname[8].equals("S")) {%>selected="selected"<% } %>>Seminar</option>
                                            <option value="F" <% if(pname[8].equals("F")) {%>selected="selected"<% } %>>FDTP</option>
                                            <option value="C" <% if(pname[8].equals("C")) {%>selected="selected"<% } %>>Conference</option>
                                        </select>
                                    </td>
                                    <td class="delcell"><input type = "button" value = "Delete" onclick = "deleteRow(this,'orgprgdetails')"  /> </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('orgprgdetails')" class="addcell" />
                                </center>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="events"/>
                    <button class="button">
                    <span>Save</span>
                </button>
                </div>
                </div>
            </form>
        </div>
    </body>
</html>