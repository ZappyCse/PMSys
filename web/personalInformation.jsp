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
      body{
        margin: 0;
        font-family: 'Raleway', sans-serif;
      }
      .div{
        height: 100%;
        position: fixed;
        width: 210px;
        top: 0;
        background-color: #f1f1f1;
        display: table;
        vertical-align: middle;
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

      .ul li a:hover{
        background: #555;
        color: white;
      }
      .content{
        padding: 10px;
        margin-left: 210px;
      }
      .content div{
        padding:20px;
      }
      .content form div:nth-of-type(1) table td{
        padding: 10px;
      }
      .row{
        display: table-row;
      }
    </style>
  </head>
   <% Faculty faculty=(Faculty)request.getSession().getAttribute("faculty");
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
          address2=personalInfo.getAddress().get(1);}
          if(address1.getCity().equals(address2.getCity())&&address1.getCountry().equals(address2.getCountry())&&address1.getDistrict().equals(address2.getDistrict())&&address1.getPinCode()==address2.getPinCode()&&address1.getState().equals(address2.getState())&&address1.getStreet().equals(address2.getStreet())){
         flag1=true;
          }
          %>
  <body <%if(flag1){%>onload="FillAddress()"<%}%>>
    <div class="div">
      <div class="row">
        <ul class="ul">
          <li><a href="personalInformation.jsp">Personal Info</a></li>
          <li><a href="qualification.jsp">Qualification</a></li>
          <li><a href="experience.jsp">Experience</a></li>
          <li><a href="work_semi.jsp">Workshop/Seminar Details</a></li>
          <li><a href="monographs.jsp">Monographs</a></li>
          <li><a href="proposaldetails.jsp">Proposal Details</a></li>
          <li><a href="membershipdetails.jsp">Membership Details</a></li>
        </ul>
      </div>
    </div>
    <div class="content">
      <form method="POST" action="MainServlet">
        <center> 
          <h3> Emp ID <input type = "text" value="<%=faculty.getFacultyId() %>" id = "empId" name="empId" readonly="readonly"/> 
          </h3> 
        </center>
        <hr />
        <h2>Personal Details </h2>
        <div>
          <table>
            <tr>
              <td> Name </td>
              <td> <input type = "text" id = "empName" name="empName" value="<%=faculty.getName()==null?"":faculty.getName() %>"/> </td>
            </tr>
            <tr>
              <td> Date of Birth </td>
              <td> <input type = "date" id = "dob" name="dob" value="<%=flag?df.format(personalInfo.getDob()):"" %>"/> </td>
            </tr>
            <tr>
              <td> Gender </td>
              <td> <input type = "radio" name = "gender" value = "male" <% if(personalInfo.getGender()=='M'){%> checked="true"<%}%>/> Male &nbsp; &nbsp; &nbsp; <input type = "radio" name = "gender"  value = "female" <% if(personalInfo.getGender()=='F'){%> checked="true"<%}%>/> Female </td>
            </tr>
            <tr>
              <td> Blood Group </td>
              <td> <input type = "text" id = "bg" name="bg" value="<%=flag?personalInfo.getBloodGroup():""%>" maxlength = "8"/> </td>
            </tr>
            <tr>
              <td> Date of Joining </td>
              <td> <input type = "date" id = "doj"name="doj" value="<%=flag?df.format(personalInfo.getDoj()):"" %>"/> </td>
              <td> Date of Relieving </td>
              <td> <input type = "date" id = "dor" name="dor" value="<%=flag?df.format(personalInfo.getDor()):"" %>"/> </td>
            </tr>
            <tr>
              <td> Phone Number </td>
              <td> <input type = "text" id = "ph" name="ph" value="<%=flag?personalInfo.getPhoneNumber():""%>" maxlength = "10" /> </td>
              <td> Secondary Phone Number </td>
              <td> <input type = "text" id = "secph" name="secph" value="<%=flag?(personalInfo.getSecPhoneNumber()==null?"":personalInfo.getSecPhoneNumber()):""%>" maxlength = "10" /> </td>
            </tr>
            <tr>
              <td> Mail ID </td>
              <td> <input type = "email" id = "mail" name="mail" value="<%=flag?personalInfo.getMailId():""%>" /> </td>
              <td> Secondary Mail ID </td>
              <td> 
                <input type = "email" id = "secmail" name="secmail" value="<%=flag?(personalInfo.getSecMailId()==null?"":personalInfo.getSecMailId()):""%>"/> 
              </td>
            </tr>
          </table>
        </div>
        <h2>Address</h2>
        <h3>Permanent Address</h3>
        <div>
          <table>
            <tr>
                <td>Street</td><td><pre>   </pre></td><td><input type="text" id="Pstreet" name="Pstreet" value="<%=flag?address1.getStreet():""%>" size="35"/></td>
            </tr>

            <tr>
              <td>City</td><td><pre>   </pre></td><td><input type="text" id="Pcity" name="Pcity" value="<%=flag?address1.getCity():""%>" size="35"/></td>
            </tr>

            <tr>
               <td>District</td><td><pre>   </pre></td><td><input type="text" value="<%=flag?address1.getDistrict():""%>" id="Pdistrict" name="Pdistrict" size="35"/></td>
            </tr>
            <tr>
               <td>State</td><td><pre>   </pre></td><td><input type="text" id="Pstate" name="Pstate" value="<%=flag?address1.getState():""%>" size="35"/></td>
            </tr>

            <tr>
              <td>Country</td><td><pre>   </pre></td><td><input type="text" id="Pcountry" name="Pcountry" value="<%=flag?address1.getCountry():""%>" size="35"/></td>
            </tr>

            <tr>
              <td>Pincode</td><td><pre>   </pre></td><td><input type="text"id="Ppincode" name="Ppincode" value="<%=flag?address1.getPinCode():""%>" size="35" maxlength="6"/></td>
            </tr>
          </table>
        </div>
        <input type="checkbox" name="address" id="address" <%if(flag1){%>checked<%}%> onclick="FillAddress()">
        <em>Check this box if Current Address and Permanent Address are the same.</em>
        <h3>Current Address</h3>
        <div>
          <table>
            <tr>
              <td>Street</td><td><pre>   </pre></td><td><input type="text" id="Cstreet" name="Cstreet" <%if(flag&&(!flag1)){%>value="<%=address2.getStreet() %>"<%}%> size="35"></td>
            </tr>
            <tr>
              <td>City</td><td><pre>   </pre></td><td><input type="text" id="Ccity" name="Ccity" <%if(flag&&(!flag1)){%>value="<%=address2.getCity()%>"<%}%> size="35"/></td>
            </tr>
            <tr>
               <td>District</td><td><pre>   </pre></td><td><input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getDistrict()%>"<%}%> id="Cdistrict" name="Cdistrict" size="35"/></td>
            </tr>
            <tr>
               <td>State</td><td><pre>   </pre></td><td><input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getState()%>"<%}%> id="Cstate" name="Cstate" size="35"/></td>
            </tr>
            <tr>
              <td>Country</td><td><pre>   </pre></td><td><input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getCountry()%>"<%}%> id="Ccountry" name="Ccountry" size="35"/></td>
            </tr>
            <tr>
              <td>Pincode</td><td><pre>   </pre></td><td><input type="text" <%if(flag&&(!flag1)){%>value="<%=address2.getPinCode()%>"<%}%> id="Cpincode" name="Cpincode" size="35" maxlength="6" /></td>
            </tr> 
          </table>
          <input type="hidden" name="action" value="personalinfo"/>
          <input type="submit" value="Next">
        </div>
      </form>
    </div>
  </body>
</html>

