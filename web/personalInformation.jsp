<%@page import="com.zappy.pmsys.admin.Administrator"%>
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
    
    function change(){
      document.getElementById('address').checked=false;
      FillAddress();
    }
    
    function check(){
      var obj=new Date(document.getElementById("dob").value);
      var obj1=new Date(document.getElementById("doj").value);
      var obj2=new Date(document.getElementById("dor").value);
      if(obj.getTime()>=obj1.getTime()){
        document.getElementById("dob").style.borderColor="red";
        document.getElementById("doj").style.borderColor="red";
        alert("DOB should be less than DOJ");
        return false;
      }
      else{
        document.getElementById("dob").style.border="0";
        document.getElementById("doj").style.border="0";
      }
      if(obj1.getTime()>=obj2.getTime()){
        document.getElementById("doj").style.borderColor="red";
        document.getElementById("dor").style.borderColor="red";
        alert("DOJ should be less than DOR");
        return false;
      }
      else{
        document.getElementById("doj").style.border="0";
        document.getElementById("dor").style.border="0";
      }
      if(obj.getTime()>=obj2.getTime()){
        document.getElementById("dob").style.borderColor="red";
        document.getElementById("dor").style.borderColor="red";
        alert("DOB should be less than DOR");
        return false;
      }
      else{
        document.getElementById("dob").style.border="0";
        document.getElementById("dor").style.border="0";
      }
      return true;
    }
  </script>
  
  <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
  <link href="CSS/common.css" rel="stylesheet" type="text/css"/>
  <style type="text/css">
    
    .content div:not(.icon){
      padding:0px 0px 5px 10px;
      margin: auto;
    }
    
    .content input:not(.ig),.content select{
      height: 30px;
      width: 50%;
      min-width: 250px;
      font-size: 17px;
      max-width: 400px;
      padding-left: 5px;
      border-radius: 5px;
    }
    
    label{
      display: block;
      width: 250px;
      margin-bottom: 10px;
    }
    
/*      @media screen and (min-width: 1350px){

        label{
          display: inline-block;
          margin: none;
        }

        .in{
          display: inline-block;
        }

        .content input:not(.ig),.content select{
          height: 25px;
          width: 250px;
          font-size: 17px;
        }
        
        form{
            width: 1100px;
        }

      }

      form{
        max-width: 1100px;
        min-width: 300px;
      }
      */
    </style>
  </head>

  <% 
  String facultyId=(String)request.getSession().getAttribute("facultyId");
  String facultyName=(String)request.getSession().getAttribute("facultyName");
  System.out.println(facultyId);
  if(facultyId==null && facultyName==null){
  %>
  <jsp:forward page="index.jsp" />
  <%
}
PersonalInfo personalInfo=new Administrator().getPersonalInfo(facultyId);
if(personalInfo==null){
personalInfo=new PersonalInfo();
}
List<Address> address=personalInfo.getAddress();
Address address1=new Address(),address2=new Address();
if(address!=null)
  address1=address.get(0);
if(address!=null)
  address2=address.get(1);
boolean flag1=false;
if(address1.getCity().equals(address2.getCity())&&address1.getCountry().equals(address2.getCountry())&&address1.getDistrict().equals(address2.getDistrict())&&address1.getPinCode()==address2.getPinCode()&&address1.getState().equals(address2.getState())&&address1.getStreet().equals(address2.getStreet())){
flag1=true;
}
DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
%>

<body>

  <div class="div">
    <div class="row">
      <ul class="ul">
        <li><a href="home.jsp">Home</a></li>
        <li><a class="active">Personal Info</a></li>
        <li><a href="skillset.jsp">Skill Set</a></li>
        <li><a href="additionalInformation.jsp">Additional Information</a></li>
        <li><a href="events.jsp">Events</a></li>
        <li><a href="publications.jsp">Publications</a></li>
      </ul>
    </div>
  </div>
  
  <div class="content" id="fm">
    <form method="POST" action="MainServlet" onsubmit="return check()">
      
      <div id="maindiv">
          <div class="divic">
        <div class="icon">
          <img src="add.png" onclick="unhide('personalDetails',this)">
          <span class="icon">Personal Details</span>
        </div>

        <div id="personalDetails" style="display: none;">
          <div>
            <label for="empName">Name</label>
            <input type = "text" id = "empName" name="empName" value="<%=facultyName %>"/>
          </div>

          <div>
            <label for="dob">Date of Birth</label>
            <input type = "date" id = "dob" name="dob" value="<%=personalInfo.getDob()==null?"":df.format(personalInfo.getDob())%>"/>
          </div>

          <div>
            <label for="">Gender</label>
            <input type = "radio" class="ig" name = "gender" value = "male" <% if(personalInfo.getGender()=='M'){%> checked="true"<%}%>/> Male &nbsp; &nbsp; &nbsp; <input type = "radio" class="ig" name = "gender"  value = "female" <% if(personalInfo.getGender()=='F'){%> checked="true"<%}%>/> Female
          </div>

          <div>
            <label for="">Blood Group</label>
            <select id = "bg" name="bg">
              <option selected="selected"></option>
              <option value="A-" <% if(personalInfo.getBloodGroup().equals("A-")){ %>selected="selected"<%}%>>A Negative</option>
              <option value="A+" <% if(personalInfo.getBloodGroup().equals("A+")){ %>selected="selected"<%}%>>A Positive</option>
              <option value="AU" <% if(personalInfo.getBloodGroup().equals("AU")){ %>selected="selected"<%}%>>A Unknown</option>
              <option value="A1-" <% if(personalInfo.getBloodGroup().equals("A1-")){ %>selected="selected"<%}%>>A1 Negative</option>
              <option value="A1+" <% if(personalInfo.getBloodGroup().equals("A1+")){ %>selected="selected"<%}%>>A1 Positive</option>
              <option value="A1B-" <% if(personalInfo.getBloodGroup().equals("A1B-")){ %>selected="selected"<%}%>>A1B Negative</option>
              <option value="A1B+" <% if(personalInfo.getBloodGroup().equals("A1B+")){ %>selected="selected"<%}%>>A1B Positive</option>
              <option value="A2+" <% if(personalInfo.getBloodGroup().equals("A2+")){ %>selected="selected"<%}%>>A2 Positive</option>
              <option value="A2-" <% if(personalInfo.getBloodGroup().equals("A2-")){ %>selected="selected"<%}%>>A2 Negative</option>
              <option value="A2B-" <% if(personalInfo.getBloodGroup().equals("A2B-")){ %>selected="selected"<%}%>>A2B Negative</option>
              <option value="A2B+" <% if(personalInfo.getBloodGroup().equals("A2B+")){ %>selected="selected"<%}%>>A2B Positive</option>
              <option value="AB-" <% if(personalInfo.getBloodGroup().equals("AB-")){ %>selected="selected"<%}%>>AB Negative</option>
              <option value="AB+" <% if(personalInfo.getBloodGroup().equals("AB+")){ %>selected="selected"<%}%>>AB Positive</option>
              <option value="ABU" <% if(personalInfo.getBloodGroup().equals("ABU")){ %>selected="selected"<%}%>>AB Unknown</option>
              <option value="B-" <% if(personalInfo.getBloodGroup().equals("B-")){ %>selected="selected"<%}%>>B Negative</option>
              <option value="B+" <% if(personalInfo.getBloodGroup().equals("B+")){ %>selected="selected"<%}%>>B Positive</option>
              <option value="B1+" <% if(personalInfo.getBloodGroup().equals("B1+")){ %>selected="selected"<%}%>>B1 Positive</option>
              <option value="BU" <% if(personalInfo.getBloodGroup().equals("BU")){ %>selected="selected"<%}%>>B Unknown</option>
              <option value="O-" <% if(personalInfo.getBloodGroup().equals("O-")){ %>selected="selected"<%}%>>O Negative</option>
              <option value="O+" <% if(personalInfo.getBloodGroup().equals("O+")){ %>selected="selected"<%}%>>O Positive</option>
              <option value="OU" <% if(personalInfo.getBloodGroup().equals("OU")){ %>selected="selected"<%}%>>O Unknown</option>
              <option value="U" <% if(personalInfo.getBloodGroup().equals("U")){ %>selected="selected"<%}%>>Unknown</option>
            </select>
          </div>

          <div class="in">
            <label for="">Date of Joining</label>
            <input type = "date" id = "doj" name="doj" value="<%=personalInfo.getDoj()==null?"":df.format(personalInfo.getDoj())%>"/>
          </div>

          <div class="in">
            <label for="">Date of Relieving</label>
            <input type = "date" id = "dor" name="dor" value="<%=personalInfo.getDor()==null?"":df.format(personalInfo.getDor())%>"/>
          </div>

          <div>
            <label for="">Phone Number</label>
            <input type = "number" onkeypress="if(this.value.length==10)return false;" id = "ph" name="ph" value="<%=personalInfo.getPhoneNumber()%>"/>
          </div>

          <div>
            <label for="">Secondary Phone Number</label>
            <input type = "number" onkeypress="if(this.value.length==10)return false;" id = "secph" name="secph" value="<%=personalInfo.getSecPhoneNumber()%>"/>
          </div>

          <div>
            <label for="">Mail ID</label>
            <input type = "email" id = "mail" name="mail" value="<%=personalInfo.getMailId()%>" />
          </div>

          <div>
            <label for="">Secondary Mail ID</label>
            <input type = "email" id = "secmail" name="secmail" value="<%=personalInfo.getSecMailId()%>"/>
          </div>

        </div>

        <div class="icon">
          <img src="add.png" onclick="unhide('perAddr',this)">
          <span class="icon">Permanent Address</span>
        </div>

        <div id="perAddr" style="display: none;">

          <div>
            <label for="">Street</label>
            <input type="text" id="Pstreet" name="Pstreet" value="<%=address1.getStreet()%>" size="35" onchange="change()"/>
          </div>

          <div>
            <label for="">City</label>
            <input type="text" id="Pcity" name="Pcity" value="<%=address1.getCity()%>" size="35" onchange="change()"/>
          </div>

          <div>
            <label for="">District</label>
            <input type="text" list="datadistricts" value="<%=address1.getDistrict()%>" id="Pdistrict" name="Pdistrict" size="35" onchange="change()"/>
          </div>

          <div>
            <label for="">State</label>
            <input type="text" list="datastates" id="Pstate" name="Pstate" value="<%=address1.getState()%>" size="35" onchange="change()"/>
          </div>

          <div>
            <label for="">Country</label>
            <input type="text" list="datacountry" id="Pcountry" name="Pcountry" value="<%=address1.getCountry()%>" size="35" onchange="change()"/>
          </div>

          <div>
            <label for="">Pincode</label>
            <input type="number" onkeypress="if(this.value.length==6)return false;" id="Ppincode" name="Ppincode" value="<%=address1.getPinCode()%>" onchange="change()"/>
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
            <input type="text" id="Cstreet" name="Cstreet" value="<%=address2.getStreet() %>" size="35">
          </div>

          <div>
            <label for="">City</label>
            <input type="text" id="Ccity" name="Ccity" value="<%=address2.getCity()%>" size="35"/>
          </div>

          <div>
            <label for="">District</label>
            <input type="text" list="datadistricts" value="<%=address2.getDistrict()%>" id="Cdistrict" name="Cdistrict" size="35"/>
          </div>

          <div>
            <label for="">State</label>
            <input type="text" list="datastates" value="<%=address2.getState()%>" id="Cstate" name="Cstate" size="35"/>
          </div>

          <div>
            <label for="">Country</label>
            <input type="text" list="datacountry" value="<%=address2.getCountry()%>" id="Ccountry" name="Ccountry" size="35"/>
          </div>

          <div>
            <label for="">Pincode</label>
            <input type="number" onkeypress="if(this.value.length==6)return false;" value="<%=address2.getPinCode()%>" id="Cpincode" name="Cpincode" size="35"/>
          </div>

        </div>
          </div>
        <input type="hidden" name="action" value="personalinfo"/>
        <button class="button">
          <span>Save</span>
        </button>
      </div>
    </form>
  </div>
  <datalist id="datadistricts">
    <option value="Ariyalur"/>
    <option value="Chennai"/>
    <option value="Coimbatore"/>
    <option value="Cuddalore"/>
    <option value="Dharmapuri"/>
    <option value="Dindigul"/>
    <option value="Erode"/>
    <option value="Kanchipuram"/>
    <option value="Kanniyakumari"/>
    <option value="Karur"/>
    <option value="Krishnagiri"/>
    <option value="Madurai"/>
    <option value="Nagapattinam"/>
    <option value="Namakkal"/>
    <option value="The Nilgiris"/>
    <option value="Perambalur"/>
    <option value="Pudukkottai"/>
    <option value="Ramanathapuram"/>
    <option value="Salem"/>
    <option value="Sivaganga"/>
    <option value="Thanjavur"/>
    <option value="Theni"/>
    <option value="Thoothukudi"/>
    <option value="Tiruchirappalli"/>
    <option value="Tirunelveli"/>
    <option value="Tiruppur"/>
    <option value="Tiruvallur"/>
    <option value="Tiruvannamalai"/>
    <option value="Tiruvarur"/>
    <option value="Vellore"/>
    <option value="Viluppuram"/>
    <option value="Virudhunagar"/>
  </datalist>
  <datalist id="datastates">
    <option value="Tamil Nadu"/>
    <option value="Kerala"/>
    <option value="Karnataka"/>
    <option value="Delhi"/>
  </datalist>
  <datalist id="datacountry">
    <option value="India"/>
  </datalist>
</body>
</html>

