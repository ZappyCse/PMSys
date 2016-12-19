<%@page import="com.zappy.pmsys.beans.Address"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.zappy.pmsys.beans.PersonalInfo"%>
<%@page import="com.zappy.pmsys.beans.Faculty"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Personal Information</title>
    <script language="javascript" type="text/javascript" >

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
    </script>
    
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    
    <style type="text/css">
      html{
        height: 100%;
        background: url("grad.jpg");
        background-size: 100% 100%;
        background-repeat: no-repeat;
        background-attachment: fixed;
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
      
      .content div{
        padding:5px;
      }
      
      .content input:not(.ig){
        height: 30px;
        width: 50%;
        min-width: 250px;
        font-size: 17px;
        max-width: 400px;
        padding-left: 5px;
        border-radius: 5px;
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
      
      @media screen and (min-width: 1350px){

        label{
          display: inline-block;
          margin: none;
        }

        .in{
          display: inline-block;
        }

        .content input:not(.ig){
          height: 25px;
          width: 250px;
          font-size: 17px;
        }
        
        form{
            width: 1100px;
        }

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
        max-width: 1100px;
        border: 10px solid black;
        padding: 10px;
        min-width: 300px;
        overflow-y: scroll;
        height: 900px;
        display: table;
      }

      .icon{
        width: 80%;
        font-size: 20px;
        font-weight: bold;
      }

      .icon > img{
        width: 28px;
      }

      .icon > span{
        float: left;
      }

      .icon img:hover{
        box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
      }
      
    </style>
  </head>

   <% 
      Faculty faculty=(Faculty)request.getSession().getAttribute("faculty");
      System.out.println(faculty);
      PersonalInfo personalInfo=faculty.getPersonalInfo();
      boolean flag=false;
      if(personalInfo!=null)
        flag=true;
      DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
      Address address1=null;
      Address address2=null;
      boolean flag1=false;
      if(flag==true){
        address1=personalInfo.getAddress().get(0);
        address2=personalInfo.getAddress().get(1);
      }
      if(address1.getCity().equals(address2.getCity())&&address1.getCountry().equals(address2.getCountry())&&address1.getDistrict().equals(address2.getDistrict())&&address1.getPinCode()==address2.getPinCode()&&address1.getState().equals(address2.getState())&&address1.getStreet().equals(address2.getStreet())){
        flag1=true;
      }
    %>

  <body <% if(flag1){ %> onload="FillAddress()" <% } %> >

    <div class="div">
      <div class="row">
        <ul class="ul">
          <li><a href="home.jsp">Home</a></li>
          <li><a class="active">Personal Info</a></li>
          <li><a href="skillset.jsp">Skill Set</a></li>
          <li><a href="events.jsp">Events</a></li>
          <li><a href="work_semi.jsp">Workshop/Seminar Details</a></li>
          <li><a href="monographs.jsp">Monographs</a></li>
          <li><a href="proposaldetails.jsp">Proposal Details</a></li>
          <li><a href="membershipdetails.jsp">Membership Details</a></li>
        </ul>
      </div>
    </div>
    
    <div class="content" id="fm">
      <form method="POST" action="MainServlet">
        
          <div style="display: table-cell;vertical-align: middle;">
        <div class="icon">
          <img src="add.png" onclick="unhide('personalDetails',this)">
          <span class="icon">Personal Details</span>
        </div>

        <div id="personalDetails" style="display: none;">
          <div>
            <label for="">Name</label>
            <input type = "text" id = "empName" name="empName" value="<%=faculty.getName()==null?"":faculty.getName() %>"/>
          </div>

          <div>
            <label for="">Date of Birth</label>
            <input type = "date" id = "dob" name="dob" value="<%=flag?df.format(personalInfo.getDob()):"" %>"/>
          </div>

          <div>
            <label for="">Gender</label>
            <input type = "radio" class="ig" name = "gender" value = "male" <% if(personalInfo.getGender()=='M'){%> checked="true"<%}%>/> Male &nbsp; &nbsp; &nbsp; <input type = "radio" class="ig" name = "gender"  value = "female" <% if(personalInfo.getGender()=='F'){%> checked="true"<%}%>/> Female
          </div>

          <div>
            <label for="">Blood Group</label>
            <input type = "text" id = "bg" name="bg" value="<%=flag?personalInfo.getBloodGroup():""%>" maxlength = "8"/>
          </div>

          <div class="in">
            <label for="">Date of Joining</label>
            <input type = "date" id = "doj"name="doj" value="<%=flag?df.format(personalInfo.getDoj()):"" %>"/>
          </div>

          <div class="in">
            <label for="">Date of Relieving</label>
            <input type = "date" id = "dor" name="dor" value="<%=flag?df.format(personalInfo.getDor()):"" %>"/>
          </div>

          <div>
            <label for="">Phone Number</label>
            <input type = "text" id = "ph" name="ph" value="<%=flag?personalInfo.getPhoneNumber():""%>" maxlength = "10" />
          </div>

          <div>
            <label for="">Secondary Phone Number</label>
            <input type = "text" id = "secph" name="secph" value="<%=flag?(personalInfo.getSecPhoneNumber()==null?"":personalInfo.getSecPhoneNumber()):""%>" maxlength = "10" />
          </div>

          <div>
            <label for="">Mail ID</label>
            <input type = "email" id = "mail" name="mail" value="<%=flag?personalInfo.getMailId():""%>" />
          </div>

          <div>
            <label for="">Secondary Mail ID</label>
            <input type = "email" id = "secmail" name="secmail" value="<%=flag?(personalInfo.getSecMailId()==null?"":personalInfo.getSecMailId()):""%>"/>
          </div>

        </div>

        <div class="icon">
          <img src="add.png" onclick="unhide('perAddr',this)">
          <span class="icon">Permanent Address</span>
        </div>

        <div id="perAddr" style="display: none;">

          <div>
            <label for="">Street</label>
            <input type="text" id="Pstreet" name="Pstreet" value="<%=flag?address1.getStreet():""%>" size="35"/>
          </div>

          <div>
            <label for="">City</label>
            <input type="text" id="Pcity" name="Pcity" value="<%=flag?address1.getCity():""%>" size="35"/>
          </div>

          <div>
            <label for="">District</label>
            <input type="text" value="<%=flag?address1.getDistrict():""%>" id="Pdistrict" name="Pdistrict" size="35"/>
          </div>

          <div>
            <label for="">State</label>
            <input type="text" id="Pstate" name="Pstate" value="<%=flag?address1.getState():""%>" size="35"/>
          </div>

          <div>
            <label for="">Country</label>
            <input type="text" id="Pcountry" name="Pcountry" value="<%=flag?address1.getCountry():""%>" size="35"/>
          </div>

          <div>
            <label for="">Pincode</label>
            <input type="text"id="Ppincode" name="Ppincode" value="<%=flag?address1.getPinCode():""%>" size="35" maxlength="6"/>
          </div>

        </div>

        <div>
          <input type="checkbox" name="address" class="ig" id="address" <%if(flag1){%>checked<%}%> onclick="FillAddress()">
          <em>Check this box if Current Address and Permanent Address are the same.</em>
        </div>

        <div class="icon">
          <img src="add.png" onclick="unhide('curAddr',this)">
          <span class="icon">Current Address</span>
        </div>

        <div id="curAddr" style="display: none;">

          <div>
            <label for="">Street</label>
            <input type="text" id="Cstreet" name="Cstreet" <%if(flag&&(!flag1)){%>value="<%=address2.getStreet() %>"<%}%> size="35">
          </div>

          <div>
            <label for="">City</label>
            <input type="text" id="Ccity" name="Ccity" <%if(flag&&(!flag1)){%>value="<%=address2.getCity()%>"<%}%> size="35"/>
          </div>

          <div>
            <label for="">District</label>
            <input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getDistrict()%>"<%}%> id="Cdistrict" name="Cdistrict" size="35"/>
          </div>

          <div>
            <label for="">State</label>
            <input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getState()%>"<%}%> id="Cstate" name="Cstate" size="35"/>
          </div>

          <div>
            <label for="">Country</label>
            <input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getCountry()%>"<%}%> id="Ccountry" name="Ccountry" size="35"/>
          </div>

          <div>
            <label for="">Pincode</label>
            <input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getPinCode()%>"<%}%> id="Cpincode" name="Cpincode" size="35" maxlength="6" />
          </div>

        </div>

        <input type="hidden" name="action" value="personalinfo"/>
        <button class="button">
          <span>Next</span>
        </button>
          </div>
      </form>
    </div>
  </body>
</html>

