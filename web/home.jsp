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
        background-size: 300% 300%;
        background-repeat: no-repeat;
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
        padding:20px;
        font-size: 20px;
        height: 100%;
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

      } 

      form div div:nth-of-type(1){
        padding-top: 0;
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
        max-width: 1200px;
        border: 10px solid black;
        padding-left: 10px;
        min-width: 300px;
      }

      .icon{
        width: 80%;
        font-size: 25px;
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

  <body>

    <div class="div">
      <div class="row">
        <ul class="ul">
          <li><a class="active">Home</a></li> 
          <li><a href="personalInformation.jsp">Personal Info</a></li>
          <li><a href="skillset.jsp">Skill Set</a></li>
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

        

      </form>
    </div>
  </body>
</html>

