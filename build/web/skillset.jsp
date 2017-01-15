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
    <title>Personal Information</title>
    <script language="javascript" type="text/javascript" >
      
        function addRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[1].cloneNode(true);
            var len = x.rows.length;
            var inp1;
            new_row.cells[0].innerHTML=len;
            for(var i=1;i<new_row.cells.length-1;i++){
                inp1=new_row.cells[i].getElementsByTagName('input')[0];
                inp1.id+=len;
                inp1.name+=len;
                inp1.value='';
                inp1=null;
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

    </script>
    
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    
    <style type="text/css">
      html{
        height: 100%;
        background: url("grad.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
        overflow: scroll;
      }  
      body{
        height: 100%;
        margin: 0;
        font-family: 'Raleway', sans-serif;
      }
      
      .div{
        height: 100%;
        position: fixed;
        width: 210px;
        top: 0;
        border-right: 1px solid black;
        display: table;
        vertical-align: middle;
        overflow: hidden;
        background: url("grad.jpg");
      }
      
      .ul{
        list-style-type: none;
        padding: 0;
        display: table-cell;
        vertical-align: middle;
      }
      
      .ul li a{
        text-decoration: none;
        padding: 10px 10px;
        display: block;
        color: #000;
        font-size: 20px;
        word-break: break-all;
      }
      
      .active {
        background-color: #4CAF50;
        color: white;
        cursor: default;
      }
      
      .ul li a:hover:not(.active){
        background: #555;
        color: white;
      }
      
      .content{
        padding: 10px;
        margin-left: 210px;
      }
            
      .ig{
        height: 15px;
        width: 15px;
      }
      
      .ig:hover{
        box-shadow: 5px 5px 10px 0 rgba(0,0,0,0.24), 5px 5px 10px 0 rgba(0,0,0,0.19);
      }

      .row{
        display: table-row;
      }
      
      label{
        display: block;
        width: 250px;
        margin-bottom: 10px;
      }
      
      input:hover:not(.ig),input:focus{
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
        cursor: text;
      }

      .button{
        background-color: #4CAF50;
        border-left:1px solid black;
        border-bottom:1px solid black;
        border-top: 4px solid black;
        border-right: 4px solid black;
        color: #000;
        text-align: center;
        font-size: 28px;
        padding: auto;
        width: 120px;
        height: 50px;
        transition: all 0.5s;
        cursor: pointer;
        margin-left: -11px;
        margin-bottom: -1px;
        border-top-right-radius: 5px;
        transition-duration: 0.4s;
        display: block;
      }

      .button span {
        cursor: pointer;
        display: inline-block;
        position: relative;
        transition: 0.5s;
      }

      .button span:after {
        content: '\00bb';
        position: absolute;
        opacity: 0;
        top: 0;
        right: -20px;
        transition: 0.5s;
      }

      .button:hover span {
        padding-right: 25px;
        opacity: 0.7;
      }

      .button:hover span:after {
        opacity: 1;
        right: 0;
      }

      form{
        margin: 0 auto;
        background: linear-gradient(141deg, #0fb8ad 0%, #1fc8db 51%, #2cb5e8 75%);
        border: 10px solid black;
        padding: 10px;
        overflow-y: scroll;
        height: 900px;
        display: table;
        width: 1100px;
      }
            
      .icon{
        width: 80%;
        font-size: 20px;
        font-weight: bold;
      }/*

*/      .icon > img{
        width: 28px;
      }

      .icon > span{
        float: left;
      }

      .icon img:hover{
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
      }
      
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
                <li><a href="events.jsp">Events</a></li>
                <li><a href="work_semi.jsp">Workshop/Seminar Details</a></li>
                <li><a href="monographs.jsp">Monographs</a></li>
                <li><a href="proposaldetails.jsp">Proposal Details</a></li>
                <li><a href="membershipdetails.jsp">Membership Details</a></li>
              </ul>
            </div>
        </div>
        
        <div class="content">
            <form method="POST" action="MainServlet">
                <div style="display: table-cell;vertical-align: middle;">
                    <div class="divic">

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
                                        <input type="text" name="<%="admission"+tmp %>" id="<%="admission"+tmp %>" maxlength = "4" value="<%=pname[4] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="completion"+tmp %>" id="<%="completion"+tmp %>" maxlength = "4" value="<%=pname[5] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="class"+tmp %>" id="<%="class"+tmp %>" value="<%=pname[6] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="percentage"+tmp %>" id="<%="percentage"+tmp %>" value="<%=pname[7] %>"/>
                                    </td>
                                    <td>
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'qualification')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" class="center" value = "Add more" onclick = "addRow('qualification')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div class="divic">

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
                                    <td>
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'interest')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" />
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('interest')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>

                    </div>
                    
                    <input type="hidden" name="tb2" />

                    <div class="divic">

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
                                        <input type="text" name="<%="academicYearTo"+tmp %>" id="<%="academicYearFrom"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="academicYearFrom"+tmp %>" id="<%="academicYearTo"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="sem"+tmp %>" id="<%="sem"+tmp %>" maxlength = "1" value="<%=pname[2] %>"/>
                                    </td>
                                    <td><input type="text" name="<%="subName"+tmp %>" id="<%="subName"+tmp %>" value="<%=pname[3] %>"/></td>
                                    <td><input type="text" name="<%="year"+tmp %>" id="<%="year"+tmp %>" maxlength = "4" value="<%=pname[4] %>"/></td>
                                    <td><input type="text" name="<%="dept"+tmp %>" id="<%="dept"+tmp %>" value="<%=pname[5] %>"/></td>
                                    <td><input type="text" name="<%="sec"+tmp %>" id="<%="sec"+tmp %>" maxlength  = "1" value="<%=pname[6] %>"/></td>
                                    <td><input type="text" name="<%="passPercent"+tmp %>" id="<%="passPercent"+tmp %>" value="<%=pname[7] %>"/></td>
                                    <td><input type = "button" value = "Delete" onclick = "deleteRow(this,'subjects')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('subjects')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                                </center>
                        </div>
                        
                    </div>
                    
                    <input type="hidden" name="tb3" />
                    
                    <div class="divic">

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
                                    <td> 
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'industable')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> 
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>    
                                <input type = "button" value = "Add more" onclick = "addRow('industable')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>

                    </div>

                    <input type="hidden" name="tb4" />
                    
                    <div class="divic">

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
                                    <td>
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'teaching_exp')" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" />
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('teaching_exp')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
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