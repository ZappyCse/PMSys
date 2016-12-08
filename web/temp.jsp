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
    .conent{
      padding: 10px;
      margin-left: 210px;
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
  
  </div>
</form>
</div>
</body>
</html>

