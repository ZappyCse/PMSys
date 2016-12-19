<%-- 
    Document   : skillset
    Created on : 12 Dec, 2016, 8:14:39 AM
    Author     : Arun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <title>Personal Information</title>
    <script language="javascript" type="text/javascript" >
      
        function addRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[2].cloneNode(true);
            var len = x.rows.length;
            new_row.cells[0].innerHTML = len - 1;
            var inp1 = new_row.cells[1].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.value = '';
            var inp2 = new_row.cells[2].getElementsByTagName('input')[0];
            inp2.id += len;
            inp2.value = '';
            var inp3 = new_row.cells[3].getElementsByTagName('input')[0];
            inp3.id += len;
            inp3.value = '';
            var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
            inp4.id += len;
            inp4.value = null;
            var inp5 = new_row.cells[5].getElementsByTagName('input')[0];
            inp5.id += len;
            inp5.value = null;
            var inp6 = new_row.cells[6].getElementsByTagName('input')[0];
            inp6.id += len;
            inp6.value = null;
            var inp7 = new_row.cells[7].getElementsByTagName('input')[0];
            inp7.id += len;
            inp7.value = null;
            var inp8 = new_row.cells[8].getElementsByTagName('input')[0];
            inp8.id += len;
            inp8.value = null;
            x.appendChild( new_row );
        }

        function deleteRow(r) {
            var x = document.getElementById('qualification');
            if(x.rows.length == 3) {
              addRow('qualification');
            }
            var i = r.parentNode.parentNode.rowIndex;
            x.deleteRow(i);
            setSNO();
        }
        
        function iaddRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[1].cloneNode(true);
            var len = x.rows.length;
            new_row.cells[0].innerHTML = len;
            var inp1 = new_row.cells[1].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.value = '';
            x.appendChild( new_row );
        }

        function ideleteRow(r) {
            var x = document.getElementById('interest');
            if(x.rows.length == 2) {
              addRow('interest');
            }
            var i = r.parentNode.parentNode.rowIndex;
            x.deleteRow(i);
            isetSNO();
        }
        
        function isetSNO() {
            var myTable = document.getElementById('interest');
            var row_count = myTable.rows.length;
            for(var i = 1; i <= row_count; i++) {
              myTable.rows[i].cells[0].innerHTML = i;
            }
        }
        function setSNO() {
            var myTable = document.getElementById('qualification');
            var row_count = myTable.rows.length;
            for(var i = 2; i <= row_count; i++) {
              myTable.rows[i].cells[0].innerHTML = i - 1;
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

        function FillAddress() {
          if(document.getElementById('address').checked == true) {

                document.getElementById('Cstreet').setAttribute("readonly","readonly");
                document.getElementById('Ccity').setAttribute("readonly","readonly");
                document.getElementById('Cdistrict').setAttribute("readonly","readonly");
                document.getElementById('Cstate').setAttribute("readonly","readonly");
                document.getElementById('Ccountry').setAttribute("readonly","readonly");
                document.getElementById('Cpincode').setAttribute("readonly","readonly");
                document.getElementById('Cstreet').value=document.getElementById('Pstreet').value;
                document.getElementById('Ccity').value=document.getElementById('Pcity').value;
                document.getElementById('Cdistrict').value=document.getElementById('Pdistrict').value;
                document.getElementById('Cstate').value=document.getElementById('Pstate').value;
                document.getElementById('Ccountry').value=document.getElementById('Pcountry').value;
                document.getElementById('Cpincode').value=document.getElementById('Ppincode').value;

          }
          else{

                document.getElementById('Cstreet').removeAttribute("readonly");
                document.getElementById('Ccity').removeAttribute("readonly");
                document.getElementById('Cdistrict').removeAttribute("readonly");
                document.getElementById('Cstate').removeAttribute("readonly");
                document.getElementById('Ccountry').removeAttribute("readonly");
                document.getElementById('Cpincode').removeAttribute("readonly");
                document.getElementById('Cstreet').value="";
                document.getElementById('Ccity').value="";
                document.getElementById('Cdistrict').value="";
                document.getElementById('Cstate').value="";
                document.getElementById('Ccountry').value="";
                document.getElementById('Cpincode').value="";

          }
        }
        
        function taddRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[2].cloneNode(true);
            var len = x.rows.length;
            new_row.cells[0].innerHTML = len - 1;
            var inp1 = new_row.cells[1].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.value = '';
            var inp2 = new_row.cells[2].getElementsByTagName('input')[0];
            inp2.id += len;
            inp2.value = '';
            var inp3 = new_row.cells[3].getElementsByTagName('input')[0];
            inp3.id += len;
            inp3.value = '';
            var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
            inp4.id += len;
            inp4.value = null;
            var inp5 = new_row.cells[5].getElementsByTagName('input')[0];
            inp5.id += len;
            inp5.value = null;
            x.appendChild( new_row );
        }

        function tdeleteRow(r) {
            var x = document.getElementById('industable');
            if(x.rows.length == 3) {
              addRow('industable');
            }
            var i = r.parentNode.parentNode.rowIndex;
            x.deleteRow(i);
            tsetSNO();
        }

        function tsetSNO() {
           var myTable = document.getElementById('industable');
           var row_count = myTable.rows.length;
           for(var i = 2; i <= row_count; i++) {
             myTable.rows[i].cells[0].innerHTML = i - 1;
           }
        }
        
        function teaddRow(tableId) {
            var x=document.getElementById(tableId);
            var new_row = x.rows[2].cloneNode(true);
            var len = x.rows.length;
            new_row.cells[0].innerHTML = len - 1;
            var inp1 = new_row.cells[1].getElementsByTagName('input')[0];
            inp1.id += len;
            inp1.value = '';
            var inp2 = new_row.cells[2].getElementsByTagName('input')[0];
            inp2.id += len;
            inp2.value = '';
            var inp3 = new_row.cells[3].getElementsByTagName('input')[0];
            inp3.id += len;
            inp3.value = '';
            var inp4 = new_row.cells[4].getElementsByTagName('input')[0];
            inp4.id += len;
            inp4.value = null;
            var inp5 = new_row.cells[5].getElementsByTagName('input')[0];
            inp5.id += len;
            inp5.value = null;
            x.appendChild( new_row );
        }

        function tedeleteRow(r) {
            var x = document.getElementById('teaching_exp');
            if(x.rows.length == 3) {
              addRow('teaching_exp');
            }
            var i = r.parentNode.parentNode.rowIndex;
            x.deleteRow(i);
            tesetSNO();
        }

        function tesetSNO() {
           var x = document.getElementById('teaching_exp');
           var row_count = x.rows.length;
           for(var i = 2; i <= row_count; i++) {
             x.rows[i].cells[0].innerHTML = i-1;
           }
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
                                    <th colspan="2">Year of </th>
                                    <th rowspan="2">Class of Marks</th>
                                    <th rowspan="2">Percentage of Marks</th>
                                    <tr>                       
                                    <th>Admission</th>
                                    <th>Completion</th>
                                    </tr>
                            </thead>
                                <tr>
                                    <td >1</td>
                                    <td><input type="text" id="degree" /></td>
                                    <td><input type="text" id="specialization"/></td>
                                    <td><input type="text" id="institute"/></td>
                                    <td><input type="text" id="university" /></td>
                                    <td><input type="text" id="admission" maxlength = "4" /></td>
                                    <td><input type="text" id="completion" maxlength = "4" /></td>
                                    <td><input type="text" id="class"/></td>
                                    <td><input type="text" id="percentage" size="10"/></td>
                                    <td><input type = "button" value = "Delete" onclick = "deleteRow(this)" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> </td>
                                </tr>
                            </table>
                            <center>
                                <input type = "button" class="center" value = "Add more" onclick = "addRow('qualification')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>
                    </div>


                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('int',this)">
                            <span class="icon">Area Of Interest</span>
                        </div>

                        <div  id="int" style="display: none;width: 100%;">

                            <table  id = "interest" class="table" style="margin: 0 auto;">
                                <tr>
                                <th>S.No</th>
                                <th>Area Of Interest</th>
                                </tr>
                                <tr>
                                <td>1</td> 
                                <td><input type="text" id="areas"  width = "100px" size="12" /></td>
                                <td> <input type = "button" value = "Delete" onclick = "ideleteRow(this)" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> </td>
                                </tr>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "iaddRow('interest')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>

                    </div>

                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('subhan',this)">
                            <span class="icon">Subjects Handled</span>
                        </div>

                        <div id="subhan" style="display:none;width: 100%;">

                        </div>

                    </div>

                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('inexp',this)">
                            <span class="icon">Industry Experience</span>
                        </div>

                        <div id="inexp" style="display:none;width: 100%;">
                            <table id = "industable" class="table" style="margin: 0 auto;">
                                <tr>
                                <th rowspan="2">s.no</th>
                                <th rowspan="2">Organization </th>
                                <th rowspan="2">Designation</th>
                                <th rowspan="2">Nature of Work</th>
                                <th colspan="2">Date</th></tr>
                                <tr>
                                <th>From</th>
                                <th>To</th>
                                </tr>
                                <tr>
                                <td>1</td>
                                <td> <input type = "text" id = "organisation" /> </td>
                                <td> <input type = "text" id = "designation"/> </td>
                                <td> <input type = "text" id="natureofwork"/> </td>
                                <td> <input type = "date" id = "from" /> </td>
                                <td> <input type = "date" id = "to" /> </td>
                                <td> <input type = "button" value = "Delete" onclick = "tdeleteRow(this)" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" /> </td>
                                </tr>
                            </table>
                            <center>    
                                <input type = "button" value = "Add more" onclick = "taddRow('industable')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>

                    </div>

                    <div class="divic">

                        <div class="icon">
                            <img src="add.png" onclick="unhide('teaexp',this)">
                            <span class="icon">Teaching Experience</span>
                        </div>

                        <div id="teaexp" style="display:none;width: 100%;">

                            <table id = "teaching_exp" class="table" style="margin: 0 auto;">
                                <tr>
                                    <th rowspan="2">s.no</th>
                                    <th rowspan="2">Name of the Institution </th>
                                    <th rowspan="2">Designation</th>
                                    <th rowspan="2">Nature of Work</th>
                                    <th colspan="2">Date</th>
                                </tr>
                                <tr>
                                    <th>From</th>
                                    <th>To</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td><input type="text" id="institute" width="100px" size="37" /></td>
                                    <td><input type="text" id="designation" width="200px" size="37" /></td>
                                    <td><input type="text" id="work" width="200px"size="37" /></td>
                                    <td><input type="date" id="from" /></td>
                                    <td><input type="date" id="to" /></td>
                                    <td>
                                        <input type = "button" value = "Delete" onclick = "tedeleteRow(this)" style = "height : 30px; width : 60px; border-radius : 5px;margin-left: 5px;cursor: pointer;" />
                                    </td>
                                </tr>
                            </table>
                            <center>
                                <input type = "button" value = "Add more" onclick = "teaddRow('teaching_exp')" style = "height : 30px; width : 70px; border-radius : 5px;margin-top: 5px;cursor: pointer;" />
                            </center>
                        </div>

                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
