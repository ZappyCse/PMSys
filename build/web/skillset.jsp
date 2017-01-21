<%-- 
    Document   : skillset
    Created on : 12 Dec, 2016, 8:14:39 AM
    Author     : Arun
--%>

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
    <title>Skill Set</title>
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
            var x=document.getElementById('qualification');
            var val;
            var val1;
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[5].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[6].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        if(val.value>val1.value){
                            alert('Year of admission should be less than year of completion');
                            val.style.background='pink';
                            val1.style.background='pink';
                            return false;
                        }
                    }
                }
                val.style.background='white';
                val1.style.background='white';
            }
            
            x=document.getElementById('subjects');
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[1].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[2].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        if(val.value>val1.value){
                            alert('From Year should be less than To Year');
                            val.style.background='pink';
                            val1.style.background='pink';
                            return false;
                        }
                    }
                }
                val.style.background='white';
                val1.style.background='white';
            }
            
            x=document.getElementById('industable');
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[4].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[5].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        if(new Date(val.value).getTime()>new Date(val1.value).getTime()){
                            alert('From Date should be less than To Date');
                            val.style.background='pink';
                            val1.style.background='pink';
                            return false;
                        }
                    }
                }
                val.style.background='white';
                val1.style.background='white';
            }
            
            x=document.getElementById('teaching_exp');
            for(var i=1;i<x.rows.length;i++){
                val=x.rows[i].cells[4].getElementsByTagName('input')[0];
                val1=x.rows[i].cells[5].getElementsByTagName('input')[0];
                if(val.value!=''){
                    if(val1.value!=''){
                        if(new Date(val.value).getTime()>new Date(val1.value).getTime()){
                            alert('From Date should be less than To Date');
                            val.style.background='pink';
                            val1.style.background='pink';
                            return false;
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
        List<Qualification> qualifications=faculty.getQualification();
        if(qualifications==null)
           qualifications=new ArrayList<>();
        List<AreaOfInterest> areaOfInterests=faculty.getAreaOfInterest();
        if(areaOfInterests==null)
            areaOfInterests=new ArrayList<>();
        List<HandledSubjects> handledSubjectses=faculty.getHandledSubjects();
        if(handledSubjectses==null)
            handledSubjectses=new ArrayList<>();
        List<Industry> industrys=faculty.getIndustry();
        if(industrys==null)
            industrys=new ArrayList<>();
        List<Experience> experiences=faculty.getExperience();
        if(experiences==null)
            experiences=new ArrayList<>();
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
                <li><a class="active">Skill Set</a></li>
                <li><a href="additionalInformation.jsp">Additional Information</a></li>
                <li><a href="events.jsp">Events</a></li>
                <li><a href="publications.jsp">Publications</a></li>
              </ul>
            </div>
        </div>
        
        <div class="content" id="fm">
            <form method="POST" action="MainServlet" onsubmit="return check()">
                <div id="maindiv">
                    <div  class="divic">
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('eduqua',this)">
                            <span class="icon">Educational Qualification</span>
                        </div>


                        <div id="eduqua" style="display:none;width: 100%;">
                            <table id = "qualification" class="table" style="margin: 0 auto;">

                                <thead>
                                    <th rowspan="2">S.No</th>
                                    <th rowspan="2">Name of the Degree</th>
                                    <th rowspan="2">Specialization</th>
                                    <th rowspan="2">Name of the Institution/University</th>
                                    <th rowspan="2">Name of the University</th>
                                    <th rowspan="2">Year of Admission</th>
                                    <th rowspan="2">Year of Completion</th>
                                    <th rowspan="2">Class of Marks</th>
                                    <th rowspan="2">Percentage of Marks</th>
                                </thead>
                                
                                <%
                                    Qualification qualification;
                                    size=qualifications.size();
                                    while(index<size||size==0){
                                        if(size==0){
                                            qualification=new Qualification();
                                            size=-1;
                                        }
                                        else{
                                            qualification=(Qualification)qualifications.get(index);
                                        }
                                        pname=qualification.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="degree"+tmp %>" id="<%="degree"+tmp %>" value="<%=pname[0] %>" />
                                    </td>
                                    <td>
                                        <input type="text" name="<%="specialization"+tmp %>" id="<%="specialization"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="institute"+tmp %>" id="<%="institute"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="university"+tmp %>" id="<%="university"+tmp %>" value="<%=pname[3] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" name="<%="admission"+tmp %>" onkeypress="if(this.value.length==4)return false;" id="<%="admission"+tmp %>" min="1000" max="9999" value="<%=pname[4] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" name="<%="completion"+tmp %>" onkeypress="if(this.value.length==4)return false;" id="<%="completion"+tmp %>" min="1000" max="9999" maxlength = "4" value="<%=pname[5] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="class"+tmp %>" id="<%="class"+tmp %>" value="<%=pname[6] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" name="<%="percentage"+tmp %>" step="any" onkeypress="if(this.value.length==5)return false;" min="0" max="100" id="<%="percentage"+tmp %>" value="<%=pname[7] %>"/>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'qualification')" />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('qualification')"  class="addcell"/>
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div >

                        <div class="icon">
                            <img src="add.png" onclick="unhide('int',this)">
                            <span class="icon">Area Of Interest</span>
                        </div>

                        <div  id="int" style="display: none;width: 100%;">

                            <table  id = "interest" class="table" style="margin: 0 auto;">
                                <thead>
                                <th>S.No</th>
                                <th>Area Of Interest</th>
                                </thead>
                                <%
                                    AreaOfInterest areaOfInterest;
                                    size=areaOfInterests.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            areaOfInterest=new AreaOfInterest();
                                            size=-1;
                                        }
                                        else{
                                            areaOfInterest=(AreaOfInterest)areaOfInterests.get(index);
                                        }
                                        
                                %>
                                <tr>
                                    <td><%=index+1 %></td> 
                                    <td>
                                        <input type="text" name="<%="areas"+tmp %>" id="<%="areas"+tmp %>" value="<%=areaOfInterest.getAll() %>"/>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'interest')"/>
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('interest')" class="addcell" />
                            </center>
                        </div>

                    </div>
                    
                    <input type="hidden" name="tb2" />

                    <div >

                        <div class="icon">
                            <img src="add.png" onclick="unhide('subhan',this)">
                            <span class="icon">Subjects Handled</span>
                        </div>

                        <div id="subhan" style="display:none;width: 100%;">
                            <table id = "subjects" class="table" style="margin: 0 auto;">
                                <thead>
                                    <th>S.No</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Semester</th>
                                    <th>Subject Name</th>
                                    <th>Year</th>
                                    <th>Department</th>
                                    <th>Section</th>
                                    <th>Pass Percent</th>
                                </thead>
                                <%
                                    HandledSubjects handledSubjects;
                                    size=handledSubjectses.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            handledSubjects=new HandledSubjects();
                                            size=-1;
                                        }
                                        else{
                                            handledSubjects=(HandledSubjects)handledSubjectses.get(index);
                                        }
                                        pname=handledSubjects.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="number" id="<%="year"+tmp %>" min="1000" max="9999" name="<%="academicYearTo"+tmp %>" onkeypress="if(this.value.length==4)return false;" id="<%="academicYearFrom"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" id="<%="year"+tmp %>" min="1000" max="9999" name="<%="academicYearFrom"+tmp %>" onkeypress="if(this.value.length==4)return false;" id="<%="academicYearTo"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <select name="<%="sem"+tmp %>" id="<%="sem"+tmp %>">
                                            <option selected="selected" value=""></option>
                                            <option value="O" <% if(pname[2].equals("O")){ %>selected="selected"<% } %>>ODD</option>
                                            <option value="E" <% if(pname[2].equals("E")){ %>selected="selected"<% } %>>EVEN</option>
                                        </select>
                                    </td>
                                    <td><input type="text" name="<%="subName"+tmp %>" id="<%="subName"+tmp %>" value="<%=pname[3] %>"/></td>
                                    <td><input type="number" name="<%="year"+tmp %>" onkeypress="if(this.value.length==4)return false;" id="<%="year"+tmp %>" min="1000" max="9999" value="<%=pname[4] %>"/></td>
                                    <td><input type="text" name="<%="dept"+tmp %>" id="<%="dept"+tmp %>" value="<%=pname[5] %>"/></td>
                                    <td><input type="text" name="<%="sec"+tmp %>" id="<%="sec"+tmp %>" value="<%=pname[6] %>"/></td>
                                    <td><input type="number" step="any" onkeypress="if(this.value.length==5)return false;" name="<%="passPercent"+tmp %>" min="0" max="100" id="<%="passPercent"+tmp %>" value="<%=pname[7] %>"/></td>
                                    <td class="delcell"><input type = "button" value = "Delete" onclick = "deleteRow(this,'subjects')" /> </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('subjects')" class="addcell" />
                                </center>
                        </div>
                        
                    </div>
                    
                    <input type="hidden" name="tb3" />
                    
                    <div >

                        <div class="icon">
                            <img src="add.png" onclick="unhide('inexp',this)">
                            <span class="icon">Industry Experience</span>
                        </div>

                        <div id="inexp" style="display:none;width: 100%;">
                            <table id = "industable" class="table" style="margin: 0 auto;">
                                <thead>
                                    <th rowspan="2">s.no</th>
                                    <th rowspan="2">Organization </th>
                                    <th rowspan="2">Designation</th>
                                    <th rowspan="2">Nature of Work</th>
                                    <th rowspan="2">From Date</th>
                                    <th rowspan="2">To Date</th>
                                </thead>
                                <%
                                    Industry industry;
                                    size=industrys.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            industry=new Industry();
                                            size=-1;
                                        }
                                        else{
                                            industry=(Industry)industrys.get(index);
                                        }
                                        pname=industry.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td> 
                                        <input type = "text" name="<%="inorganisation"+tmp %>" id = "<%="inorganisation"+tmp %>" value="<%=pname[0] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "text" name="<%="indesignation"+tmp %>" id = "<%="indesignation"+tmp %>" value="<%=pname[1] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "text" name="<%="innatureofwork"+tmp %>" id="<%="innatureofwork"+tmp %>" value="<%=pname[2] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "date" name="<%="infrom"+tmp %>" id = "<%="infrom"+tmp %>" value="<%=pname[3] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "date" name="<%="into"+tmp %>" id ="<%="into"+tmp %>" value="<%=pname[4] %>"/> 
                                    </td>
                                    <td class="delcell"> 
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'industable')"/> 
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>    
                                <input type = "button" value = "Add more" onclick = "addRow('industable')" class="addcell" />
                            </center>
                        </div>

                    </div>

                    <input type="hidden" name="tb4" />
                    
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('teaexp',this)">
                            <span class="icon">Teaching Experience</span>
                        </div>

                        <div id="teaexp" style="display:none;width: 100%;">

                            <table id = "teaching_exp" class="table" style="margin: 0 auto;">
                                <thead>
                                    <th rowspan="2">s.no</th>
                                    <th rowspan="2">Name of the Institution </th>
                                    <th rowspan="2">Designation</th>
                                    <th rowspan="2">Nature of Work</th>
                                    <th rowspan="2">From Date</th>
                                    <th rowspan="2">To Date</th>
                                </thead>
                                <%
                                    Experience experience;
                                    size=experiences.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            experience=new Experience();
                                            size=-1;
                                        }
                                        else{
                                            experience=(Experience)experiences.get(index);
                                        }
                                        pname=experience.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="teainstitute"+tmp %>" id="<%="teainstitute"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="teadesignation"+tmp %>" id="<%="teadesignation"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="teawork"+tmp %>" id="<%="teawork"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="teafrom"+tmp %>" id="<%="teafrom"+tmp %>" value="<%=pname[3] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="teato"+tmp %>" id="<%="teato"+tmp %>" value="<%=pname[4] %>"/>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'teaching_exp')"/>
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('teaching_exp')" class="addcell" />
                            </center>
                        </div>
                    </div>
                    </div>
                    <input type="hidden" name="action" value="skillset"/>
                    <button class="button">
                    <span>Save</span>
                </button>
                </div>
                
            </form>
        </div>
    </body>
</html>