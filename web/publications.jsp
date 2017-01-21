<%-- 
    Document   : skillset
    Created on : 12 Dec, 2016, 8:14:39 AM
    Author     : Arun
--%>

<%@page import="com.zappy.pmsys.beans.ProposalDetails"%>
<%@page import="com.zappy.pmsys.beans.Monographs"%>
<%@page import="com.zappy.pmsys.beans.JournalDetails"%>
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
    <title>Publications</title>
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
            var x=document.getElementById('proposals');
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
    <style type="text/css">
      
    </style>
    </head>
    
    <%  TeachingFaculty faculty=(TeachingFaculty)new Administrator().getUser((String)request.getSession().getAttribute("facultyId"));
        List<JournalDetails> journalDetailses=faculty.getJournalDetails();
        if(journalDetailses==null)
           journalDetailses=new ArrayList<>();
        List<Monographs> monographses=faculty.getMonographs();
        if(monographses==null)
            monographses=new ArrayList<>();
        List<ProposalDetails> proposalDetailses=faculty.getProposalDetails();
        if(proposalDetailses==null)
            proposalDetailses=new ArrayList<>();
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
                <li><a href="events.jsp">Events</a></li>
                <li><a class="active">Publications</a></li>
              </ul>
            </div>
        </div>
        
        <div class="content" id="fm">
            <form method="POST" action="MainServlet" onsubmit="return check()">
                <div id="maindiv">
                    <div class="divic">
                    <div>
                        
                        <div class="icon">
                            <img src="add.png" onclick="unhide('jour',this)">
                            <span class="icon">Journals / Conference Details</span>
                        </div>


                        <div id="jour" style="display:none;width: 100%;">
                            <table id = "journals" class="table" style="margin: 0 auto;">

                                <thead>
                                    <th rowspan="2">S.No</th>
                                    <th rowspan="2">Paper Title</th>
                                    <th rowspan="2">Coauthor Names</th>
                                    <th rowspan="2">Publisher / Journal Name</th>
                                    <th rowspan="2">Month of Publictaion</th>
                                    <th rowspan="2">Year of Publication</th>
                                    <th rowspan="2">DOI</th>
                                    <th rowspan="2">ISSN</th>
                                    <th rowspan="2">IF</th>
                                    <th rowspan="2">SJR</th>
                                    <th rowspan="2">Snip Number</th>
                                    <th rowspan="2">H index</th>
                                    <th rowspan="2">K index</th>
                                    <th rowspan="2">Region</th>
                                    <th rowspan="2">Publication Type</th>
                                </thead>
                                
                                <%
                                    JournalDetails journalDetails;
                                    size=journalDetailses.size();
                                    while(index<size||size==0){
                                        if(size==0){
                                            journalDetails=new JournalDetails();
                                            size=-1;
                                        }
                                        else{
                                            journalDetails=(JournalDetails)journalDetailses.get(index);
                                        }
                                        pname=journalDetails.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="jourtitle"+tmp %>" id="<%="jourtitle"+tmp %>" value="<%=pname[0] %>" />
                                    </td>
                                    <td>
                                        <input type="text" name="<%="jourconame"+tmp %>" id="<%="jourconame"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="jourpubname"+tmp %>" id="<%="jourpubname"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <select name="<%="jourmonth"+tmp %>" id="<%="jourmonth"+tmp %>" >
                                            <option value="" selected="selected"></option>
                                            <option value="1" <%if(pname[3].equals("1")){%>selected="selected"<%}%>>JAN</option>
                                            <option value="2" <%if(pname[3].equals("2")){%>selected="selected"<%}%>>FEB</option>
                                            <option value="3" <%if(pname[3].equals("3")){%>selected="selected"<%}%>>MAR</option>
                                            <option value="4" <%if(pname[3].equals("4")){%>selected="selected"<%}%>>APR</option>
                                            <option value="5" <%if(pname[3].equals("5")){%>selected="selected"<%}%>>MAY</option>
                                            <option value="6" <%if(pname[3].equals("6")){%>selected="selected"<%}%>>JUN</option>
                                            <option value="7" <%if(pname[3].equals("7")){%>selected="selected"<%}%>>JUL</option>
                                            <option value="8" <%if(pname[3].equals("8")){%>selected="selected"<%}%>>AUG</option>
                                            <option value="9" <%if(pname[3].equals("9")){%>selected="selected"<%}%>>SEP</option>
                                            <option value="10" <%if(pname[3].equals("10")){%>selected="selected"<%}%>>OCT</option>
                                            <option value="11" <%if(pname[3].equals("11")){%>selected="selected"<%}%>>NOV</option>
                                            <option value="12" <%if(pname[3].equals("12")){%>selected="selected"<%}%>>DEC</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" name="<%="jouryear"+tmp %>" id="<%="jouryear"+tmp %>" value="<%=pname[4] %>" min="1900" max="9999" onkeypress="if(this.value.length==4)return false;"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="jourdoi"+tmp %>" id="<%="jourdoi"+tmp %>" value="<%=pname[5] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="jourissn"+tmp %>" id="<%="jourissn"+tmp %>" value="<%=pname[6] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" step="any" name="<%="jourif"+tmp %>" id="<%="jourif"+tmp %>" value="<%=pname[7] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" step="any" name="<%="joursjr"+tmp %>" id="<%="joursjr"+tmp %>" value="<%=pname[8] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" step="any" name="<%="joursnip"+tmp %>" id="<%="joursnip"+tmp %>" value="<%=pname[9] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" step="any" name="<%="jourhindex"+tmp %>" id="<%="jourhindex"+tmp %>" value="<%=pname[10] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" step="any" name="<%="jourkindex"+tmp %>" id="<%="jourkindex"+tmp %>" value="<%=pname[11] %>"/>
                                    </td>
                                    <td>
                                        <select name="<%="jourregion"+tmp %>" id="<%="jourregion"+tmp %>" >
                                            <option value=""></option>
                                            <option value="N" <% if(pname[12].equals("N")){ %>selected="selected" <%}%>>National</option>
                                            <option value="I" <% if(pname[12].equals("I")){ %>selected="selected" <%}%>>International</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select name="<%="jourpublicationtype"+tmp %>" id="<%="jourpublicationtype"+tmp %>" >
                                            <option value=""></option>
                                            <option value="N" <% if(pname[13].equals("J")){ %>selected="selected" <%}%>>Journal</option>
                                            <option value="I" <% if(pname[13].equals("C")){ %>selected="selected" <%}%>>Conference</option>
                                        </select>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'journals')"  />
                                    </td>
                                    
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "addRow('journals')" class="addcell" />
                            </center>
                        </div>
                    </div>

                    <input type="hidden" name="tb1" />
                    
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('mono',this)">
                            <span class="icon" onclick="unhide('mono',this)">Monographs</span>
                        </div>

                        <div  id="mono" style="display: none;width: 100%;">

                            <table  id = "monographs" class="table" style="margin: 0 auto;">
                                <thead>
                                    <th>S.No</th>
                                    <th>Title</th>
                                    <th>Coauthor Name</th>
                                    <th>Publisher Name</th>
                                    <th>Year Of Publication</th>
                                    <th>Publication Type</th>
                                </thead>
                                <%
                                    Monographs monographs;
                                    size=monographses.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            monographs=new Monographs();
                                            size=-1;
                                        }
                                        else{
                                            monographs=(Monographs)monographses.get(index);
                                        }
                                    pname=monographs.getAll();    
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td>
                                        <input type="text" name="<%="monotitle"+tmp %>" id="<%="monotitle"+tmp %>" value="<%=pname[0] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="monocoauthor"+tmp %>" id="<%="monocoauthor"+tmp %>" value="<%=pname[1] %>"/>
                                    </td>
                                    <td>
                                        <input type="text" name="<%="monopublish"+tmp %>" id="<%="monopublish"+tmp %>" value="<%=pname[2] %>"/>
                                    </td>
                                    <td>
                                        <input type="number" name="<%="monoyop"+tmp %>" id="<%="monoyop"+tmp %>" value="<%=pname[3] %>" min="1900" max="9999" onkeypress="if(this.value.length==4)return false;"/>
                                    </td>
                                    <td>
                                        <select name="<%="monopubtype"+tmp %>" id="<%="monopubtype"+tmp %>">
                                            <option value=""></option>
                                            <option value="M" <% if(pname[4].equals("M")){ %>selected="selected" <%}%>>Monographs</option>
                                            <option value="B" <% if(pname[4].equals("B")){ %>selected="selected" <%}%>>Books</option>
                                            <option value="P" <% if(pname[4].equals("P")){ %>selected="selected" <%}%>>Patterns</option>
                                        </select>
                                    </td>
                                    <td class="delcell">
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'monographs')"  />
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                                </table>
                                <center>
                                    <input type = "button" value = "Add more" onclick = "addRow('monographs')" class="addcell" />
                                </center>
                        </div>
                        
                    </div>
                    
                    <input type="hidden" name="tb2" />
                    
                    <div>

                        <div class="icon">
                            <img src="add.png" onclick="unhide('propo',this)">
                            <span class="icon">Proposals</span>
                        </div>

                        <div id="propo" style="display:none;width: 100%;">
                            <table id = "proposals" class="table" style="margin: 0 auto;">
                                <thead>
                                    <th rowspan="2">s.no</th>
                                    <th rowspan="2">Title</th>
                                    <th rowspan="2">Details of Funding Agency</th>
                                    <th rowspan="2">From Date</th>
                                    <th rowspan="2">To Date</th>
                                    <th rowspan="2">Duration</th>
                                    <th rowspan="2">Status</th>
                                    <th rowspan="2">Sector Type</th>
                                </thead>
                                <%
                                    ProposalDetails proposalDetails;
                                    size=proposalDetailses.size();
                                    index=0;
                                    tmp="";
                                    while(index<size||size==0){
                                        if(size==0){
                                            proposalDetails=new ProposalDetails();
                                            size=-1;
                                        }
                                        else{
                                            proposalDetails=(ProposalDetails)proposalDetailses.get(index);
                                        }
                                        pname=proposalDetails.getAll();
                                %>
                                <tr>
                                    <td><%=index+1 %></td>
                                    <td> 
                                        <input type = "text" name="<%="protitle"+tmp %>" id = "<%="protitle"+tmp %>" value="<%=pname[0] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "text" name="<%="prodoa"+tmp %>" id = "<%="prodoa"+tmp %>" value="<%=pname[1] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "date" name="<%="profromdate"+tmp %>" id="<%="profromdate"+tmp %>" value="<%=pname[2] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "date" name="<%="protodate"+tmp %>" id = "<%="protodate"+tmp %>" value="<%=pname[3] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "number" readonly name="<%="produration"+tmp %>" id ="<%="produration"+tmp %>" value="<%=pname[4] %>"/> 
                                    </td>
                                    <td> 
                                        <input type = "text" name="<%="prostatus"+tmp %>" id ="<%="prostatus"+tmp %>" value="<%=pname[5] %>"/> 
                                    </td>
                                    <td> 
                                        <select name="<%="prosectype"+tmp %>" id ="<%="prosectype"+tmp %>" >
                                            <option value=""></option>
                                            <option value="-" <% if(pname[6].equals("-")){ %>selected="selected" <%}%>>Private</option>
                                            <option value="+" <% if(pname[6].equals("+")){ %>selected="selected" <%}%>>Public</option>
                                        </select> 
                                    </td>
                                    <td class="delcell"> 
                                        <input type = "button" value = "Delete" onclick = "deleteRow(this,'proposals')"  /> 
                                    </td>
                                </tr>
                                <%
                                    ++index;
                                    tmp=index+1+"";
                                    }
                                %>
                            </table>
                            <center>    
                                <input type = "button" value = "Add more" onclick = "addRow('proposals')" class="addcell" />
                            </center>
                        </div>

                    </div>

                    <input type="hidden" name="action" value="publications"/>
                    <button class="button">
                    <span>Save</span>
                </button>
                </div>
                </div>
            </form>
        </div>
    </body>
</html>