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
    <script language="javascript" type="text/javascript" >
      
        function addRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[1].cloneNode(true);
            var len = x.rows.length;
            var inp1;
            new_row.cells[0].innerHTML=len;
            for(var i=1;i<new_row.cells.length-1;i++){
                if(new_row.cells[i].getElementsByTagName('input').length>0){
                    inp1=new_row.cells[i].getElementsByTagName('input')[0];
                    inp1.id+=len;
                    inp1.name+=len;
                    inp1.value='';
                    inp1=null;
                }
                else if(new_row.cells[i].getElementsByTagName('select').length>0){
                    inp1=new_row.cells[i].getElementsByTagName('select')[0];
                    inp1.id+=len;
                    inp1.name+=len;
                    inp1.value='';
                    inp1=null;
                }
            }
            x.appendChild( new_row );
        }

        function deleteRow(r,tableId) {
            var x = document.getElementById(tableId);
            if(x.rows.length == 2) {
              addRow(tableId);
            }
            var i = r.parentNode.parentNode.rowIndex;
            x.deleteRow(i);
            setSNO(tableId);
        }
        
        function setSNO(tableId) {
            var myTable = document.getElementById(tableId);
            var row_count = myTable.rows.length;
            for(var i = 1; i <= row_count; i++) {
              myTable.rows[i].cells[0].innerHTML = i;
            }
        }
        function hide(t,t1){
            document.getElementById(t).style.display="none";
            t1.setAttribute("src","add.png");
            t1.setAttribute("onclick","unhide('"+t+"',this)");    
        }

        function unhide(t,t1){
          document.getElementById(t).style.display="inline-block";
          t1.setAttribute("src","rem.png");
          t1.setAttribute("onclick","hide('"+t+"',this)");
        }
        
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
      
      .table{
          border-collapse: collapse;
          font-size: 15px;
      }
      
      .table th{
          padding: 5px;
          border: 1px solid black;
      }
      
      .table td{
          padding: 10px;
          border: 1px solid black;
      }
      
      .table input{
          width: 100%;
          height: 30px;
      }
           
      .divic{
          padding: 10px;
      }
          
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
        
        <div class="div">
            <div class="row">
              <ul class="ul">
                <li><a href="home.jsp">Home</a></li>
                <li><a href="personalInformation.jsp">Personal Info</a></li>
                <li><a href="skillset.jsp">Skill Set</a></li>
                <li><a href="additionalInformation.jsp">Additional Information</a></li>
                <li><a class="active">Events</a></li>
                <li><a href="publications.jsp">Publications</a></li>
              </ul>
            </div>
        </div>
        
        <div class="content" id="fm">
            <form method="POST" action="MainServlet" onsubmit="return check()">
                <div style="display: table-cell;vertical-align: middle;">
                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('eventsatt',this)">
                            <span class="icon">Events Attended</span>
                        </div>


                        <div id="eventsatt" style="display:none;width: 100%;">
                            <table id = "eventsattended" class="table" style="margin: 0 auto;">

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
                                    <td>
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'eventsattended')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" class="center" value = "Add more" onclick = "addRow('eventsattended')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('orgprg',this)">
                            <span class="icon">Events Organized</span>
                        </div>

                        <div id="orgprg" style="display:none;width: 100%;">
                            <table id = "orgprgdetails" class="table" style="margin: 0 auto;">
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
                                    <td><input type = "button" value = "Delete" onclick = "deleteRow(this,'orgprgdetails')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('orgprgdetails')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                                </center>
                        </div>
                    </div>
                    <input type="hidden" name="action" value="events"/>
                    <button class="button">
                    <span>Save</span>
                </button>
                </div>
                
            </form>
        </div>
    </body>
</html>