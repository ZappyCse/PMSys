<%-- 
    Document   : skillset
    Created on : 12 Dec, 2016, 8:14:39 AM
    Author     : Arun
--%>

<%@page import="com.zappy.pmsys.beans.SelfAppraisal"%>
<%@page import="com.zappy.pmsys.beans.Responsibilities"%>
<%@page import="com.zappy.pmsys.beans.MembershipDetails"%>
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
        <title>Additional Information</title>
        <script src="js/common.js" type="text/javascript"></script>
        <script language="javascript" type="text/javascript" >
                      
            function check(){
                var x=document.getElementById('responsibilities');
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
                return true;
            }
            
        </script>
        
        <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
        <link href="CSS/common.css" rel="stylesheet" type="text/css"/>
    </head>
    
    <%  
        TeachingFaculty faculty=(TeachingFaculty)new Administrator().getUser((String)request.getSession().getAttribute("facultyId"));
        List<MembershipDetails> membershipDetailses=faculty.getMembershipDetails();
        if(membershipDetailses==null)
           membershipDetailses=new ArrayList<>();
        List<Responsibilities> responsibilitieses=faculty.getResponsibilities();
        if(responsibilitieses==null)
            responsibilitieses=new ArrayList<>();
        List<SelfAppraisal> selfAppraisals=faculty.getSelfAppraisals();
        if(selfAppraisals==null)
            selfAppraisals=new ArrayList<>();
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
            <a class="active">Additional Information</a>
            <a href="events.jsp">Events</a>
            <a href="publications.jsp">Publications</a>
        </div>
        
        <div class="content" id="fm">
            <span id="navbut" onclick="openNav()">&#9776;</span>
            <form method="POST" action="MainServlet" onsubmit="return check()">
                <div id="maindiv" >
                    <div class="divic">
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('memdet',this)">
                            <span class="icon">Membership Details</span>
                        </div>


                        <div id="memdet">
                            <table id = "membership" class="table">

                                <thead>
                                    <th>S.No</th>
                                    <th>Membership ID</th>
                                    <th>Organization</th>
                                </thead>
                                
                                <%
                                    MembershipDetails membershipDetails;
                                    size=membershipDetailses.size();
                                    System.out.println(size);
                                    while(index<size||size==0){
                                        
                                        if(size==0){
                                            membershipDetails=new MembershipDetails();
                                            size=-1;
                                        }
                                        else{
                                            membershipDetails=(MembershipDetails)membershipDetailses.get(index);
                                        }
                                        System.out.println("hai");
                                        pname=membershipDetails.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="strengths"+tmp %>" id="<%="strengths"+tmp %>" value="<%=pname[0] %>" />
                                    </td>
                                    <td>
                                        <input type="text" name="<%="weaknesses"+tmp %>" id="<%="weaknesses"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'membership')"  />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('membership')" class="addcell"/>
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('res',this)">
                            <span class="icon">Responsibilities</span>
                        </div>

                        <div  id="res">

                            <table  id = "responsibilities" class="table">
                                <thead>
                                    <th rowspan="2">S.No</th>
                                    <th rowspan="2">Work Details</th>
                                    <th rowspan="2">Work Allotted By</th>
                                    <th rowspan="2">From Date</th>
                                    <th rowspan="2">To Date</th>
                                    <th rowspan="2">Duration</th>
                                    <th rowspan="2">Type</th>
                                </thead>
                                <%
                                    Responsibilities responsibilities;
                                    size=responsibilitieses.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            responsibilities=new Responsibilities();
                                            size=-1;
                                        }
                                        else{
                                            responsibilities=(Responsibilities)responsibilitieses.get(index);
                                        }
                                    pname=responsibilities.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td> 
                                    <td>
                                        <input type="text" name="<%="workdetails"+tmp %>" id="<%="workdetails"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="alottedby"+tmp %>" id="<%="alottedby"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="resfromdate"+tmp %>" id="<%="resfromdate"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <input type="date" name="<%="restodate"+tmp %>" id="<%="restodate"+tmp %>" value="<%=pname[3] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" readonly="readonly" name="<%="resduration"+tmp %>" id="<%="resduration"+tmp %>" value="<%=pname[4] %>"/>
                                    </td>
                                    <td>
                                        <select name="<%="restype"+tmp %>" id="<%="restype"+tmp %>">
                                            <option selected="selected" value=""></option>
                                            <option value="C" <% if(pname[5].equals("C")){ %>selected="selected"<% } %>>College</option>
                                            <option value="D" <% if(pname[5].equals("D")){ %>selected="selected"<% } %>>Department</option>
                                        </select>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'responsibilities')"  />
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('responsibilities')" class="addcell"/>
                            </center>
                        </div>

                    </div>
                    
                    <input type="hidden" name="tb2" />

                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('selfapp',this)">
                            <span class="icon">Self Appraisal</span>
                        </div>

                        <div id="selfapp">
                            <table id = "selfappraisal" class="table">
                                <thead>
                                    <th>S.No</th>
                                    <th>Strengths</th>
                                    <th>Weaknesses</th>
                                </thead>
                                <%
                                    SelfAppraisal selfAppraisal;
                                    size=selfAppraisals.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            selfAppraisal=new SelfAppraisal();
                                            size=-1;
                                        }
                                        else{
                                            selfAppraisal=(SelfAppraisal)selfAppraisals.get(index);
                                        }
                                        pname=selfAppraisal.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="selfstrengths"+tmp %>" id="<%="selfstrengths"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="selfweaknesses"+tmp %>" id="<%="selfweaknesses"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td class="delcell"><input type = "button" value = "Delete" onclick = "deleteRow(this,'selfappraisal')"  /> </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('selfappraisal')" class="addcell"/>
                                </center>
                        </div>
                        
                    </div>
                    
                    <input type="hidden" name="action" value="additionalinformation"/>
                    <button class="button">
                    <span>Save</span>
                </button>
                </div>
                </div>
            </form>
        </div>
    </body>
</html>