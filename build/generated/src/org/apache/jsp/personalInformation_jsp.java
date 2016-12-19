package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import com.zappy.pmsys.beans.Address;
import java.util.List;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import com.zappy.pmsys.beans.PersonalInfo;
import com.zappy.pmsys.beans.Faculty;

public final class personalInformation_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("<title>Personal Information</title>\n");
      out.write("<script language=\"javascript\" type=\"text/javascript\" >\n");
      out.write("   \n");
      out.write("function FillAddress() {\n");
      out.write("  if(document.getElementById('address').checked == true) {\n");
      out.write("        \n");
      out.write("        document.getElementById('Cstreet').disabled=true;\n");
      out.write("        document.getElementById('Ccity').disabled=true;\n");
      out.write("        document.getElementById('Cdistrict').disabled=true;\n");
      out.write("        document.getElementById('Cstate').disabled=true;\n");
      out.write("        document.getElementById('Ccountry').disabled=true;\n");
      out.write("        document.getElementById('Cpincode').disabled=true;\n");
      out.write("        document.getElementById('Cstreet').value=document.getElementById('Pstreet').value;\n");
      out.write("        document.getElementById('Ccity').value=document.getElementById('Pcity').value;\n");
      out.write("        document.getElementById('Cdistrict').value=document.getElementById('Pdistrict').value;\n");
      out.write("        document.getElementById('Cstate').value=document.getElementById('Pstate').value;\n");
      out.write("        document.getElementById('Ccountry').value=document.getElementById('Pcountry').value;\n");
      out.write("        document.getElementById('Cpincode').value=document.getElementById('Ppincode').value;\n");
      out.write("  }\n");
      out.write("  else{\n");
      out.write("        document.getElementById('Cstreet').disabled=false;\n");
      out.write("        document.getElementById('Ccity').disabled=false;\n");
      out.write("        document.getElementById('Cdistrict').disabled=false;\n");
      out.write("        document.getElementById('Cstate').disabled=false;\n");
      out.write("        document.getElementById('Ccountry').disabled=false;\n");
      out.write("        document.getElementById('Cpincode').disabled=false;\n");
      out.write("        document.getElementById('Cstreet').value=\"\";\n");
      out.write("        document.getElementById('Ccity').value=\"\";\n");
      out.write("        document.getElementById('Cdistrict').value=\"\";\n");
      out.write("        document.getElementById('Cstate').value=\"\";\n");
      out.write("        document.getElementById('Ccountry').value=\"\";\n");
      out.write("        document.getElementById('Cpincode').value=\"\";\n");
      out.write("  }\n");
      out.write("}\n");
      out.write("</script>\n");
      out.write("</head>\n");
      out.write(" ");
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
        address2=personalInfo.getAddress().get(1);}
        if(address1.getCity().equals(address2.getCity())&&address1.getCountry().equals(address2.getCountry())&&address1.getDistrict().equals(address2.getDistrict())&&address1.getPinCode()==address2.getPinCode()&&address1.getState().equals(address2.getState())&&address1.getStreet().equals(address2.getStreet())){
       flag1=true;
        }
        
      out.write("\n");
      out.write("<body ");
if(flag1){
      out.write("onload=\"FillAddress()\"");
}
      out.write(">\n");
      out.write("    <form name=\"personalInfo\" id=\"personal\" method=\"POST\" action=\"MainServlet\">\n");
      out.write("    <center> <h3> Emp ID <input type = \"text\" value=\"");
      out.print(faculty.getFacultyId() );
      out.write("\" id = \"empId\" disabled /> </h3> </center>\n");
      out.write("<hr />\n");
      out.write("<h2>Personal Details </h2>\n");
      out.write("<div style=\"padding:20px; border:2px ridge black;border-radius:35px\">\n");
      out.write("<table cellspacing = \"15\"cellpadding = \"10\">\n");
      out.write("<tr>\n");
      out.write("<td> Name </td>\n");
      out.write("<td> <input type = \"text\" id = \"empName\" value=\"");
      out.print(faculty.getName()==null?"":faculty.getName() );
      out.write("\"/> </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td> Date of Birth </td>\n");
      out.write("<td> <input type = \"date\" id = \"dob\" value=\"");
      out.print(flag?df.format(personalInfo.getDob()):"" );
      out.write("\"/> </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td> Gender </td>\n");
      out.write("<td> <input type = \"radio\" name = \"gender\" value = \"male\" ");
 if(personalInfo.getGender()=='M'){
      out.write(" checked=\"true\"");
}
      out.write("/> Male &nbsp; &nbsp; &nbsp; <input type = \"radio\" name = \"gender\" value = \"female\" ");
 if(personalInfo.getGender()=='F'){
      out.write(" checked=\"true\"");
}
      out.write("/> Female </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td> Blood Group </td>\n");
      out.write("<td> <input type = \"text\" id = \"bg\" value=\"");
      out.print(flag?personalInfo.getBloodGroup():"");
      out.write("\" maxlength = \"8\"/> </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td> Date of Joining </td>\n");
      out.write("<td> <input type = \"date\" id = \"doj\" value=\"");
      out.print(flag?df.format(personalInfo.getDoj()):"" );
      out.write("\"/> </td>\n");
      out.write("<td> Date of Relieving </td>\n");
      out.write("<td> <input type = \"date\" id = \"dor\" value=\"");
      out.print(flag?df.format(personalInfo.getDor()):"" );
      out.write("\"/> </td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("<td> Phone Number </td>\n");
      out.write("<td> <input type = \"text\" id = \"ph\" value=\"");
      out.print(flag?personalInfo.getPhoneNumber():"");
      out.write("\" maxlength = \"10\" /> </td>\n");
      out.write("<td> Secondary Phone Number </td>\n");
      out.write("<td> <input type = \"text\" id = \"secph\" value=\"");
      out.print(flag?(personalInfo.getSecPhoneNumber()==null?"":personalInfo.getSecPhoneNumber()):"");
      out.write("\" maxlength = \"10\" /> </td>\n");
      out.write("</tr>\n");
      out.write("<td> Mail ID </td>\n");
      out.write("<td> <input type = \"email\" id = \"mail\" value=\"");
      out.print(flag?personalInfo.getMailId():"");
      out.write("\" /> </td>\n");
      out.write("<td> Secondary Mail ID </td>\n");
      out.write("<td> <input type = \"email\" id = \"secmail\" value=\"");
      out.print(flag?(personalInfo.getSecMailId()==null?"":personalInfo.getSecMailId()):"");
      out.write("\"/> </td>\n");
      out.write("</tr>\n");
      out.write("</table>\n");
      out.write("</div>\n");
      out.write("<h2>Address</h2>\n");
      out.write("<h3>Permanent Address</h3>\n");
      out.write("<div style=\"padding:20px; border:2px ridge black;border-radius:35px\">\n");
      out.write("   \n");
      out.write("<table>\n");
      out.write("<tr>\n");
      out.write("    <td>Street</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Pstreet\" value=\"");
      out.print(flag?address1.getStreet():"");
      out.write("\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>City</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Pcity\" value=\"");
      out.print(flag?address1.getCity():"");
      out.write("\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("   <td>District</td><td><pre>   </pre></td><td><input type=\"text\" value=\"");
      out.print(flag?address1.getDistrict():"");
      out.write("\" id=\"Pdistrict\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("   <td>State</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Pstate\" value=\"");
      out.print(flag?address1.getState():"");
      out.write("\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>Country</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Pcountry\" value=\"");
      out.print(flag?address1.getCountry():"");
      out.write("\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>Pincode</td><td><pre>   </pre></td><td><input type=\"text\"id=\"Ppincode\" value=\"");
      out.print(flag?address1.getPinCode():"");
      out.write("\" size=\"35\" maxlength=\"6\"/></td>\n");
      out.write("</tr>\n");
      out.write(" \n");
      out.write("</table>\n");
      out.write("</div>\n");
      out.write("  <input type=\"checkbox\" name=\"address\" id=\"address\" ");
if(flag1){
      out.write("checked");
}
      out.write(" onclick=\"FillAddress()\">\n");
      out.write("<em>Check this box if Current Address and Permanent Address are the same.</em>\n");
      out.write("<h3>Current Address</h3>\n");
      out.write("<div style=\"padding:20px; border:2px ridge black;border-radius:35px\">\n");
      out.write("<table>\n");
      out.write("<tr>\n");
      out.write("  <td>Street</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Cstreet\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getStreet() );
      out.write('"');
}
      out.write(" size=\"35\"></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>City</td><td><pre>   </pre></td><td><input type=\"text\" id=\"Ccity\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getCity());
      out.write('"');
}
      out.write(" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("   <td>District</td><td><pre>   </pre></td><td><input type=\"text\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getDistrict());
      out.write('"');
}
      out.write(" id=\"Cdistrict\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("<tr>\n");
      out.write("   <td>State</td><td><pre>   </pre></td><td><input type=\"text\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getState());
      out.write('"');
}
      out.write(" id=\"Cstate\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>Country</td><td><pre>   </pre></td><td><input type=\"text\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getCountry());
      out.write('"');
}
      out.write(" id=\"Ccountry\" size=\"35\"/></td>\n");
      out.write("</tr>\n");
      out.write("\n");
      out.write("<tr>\n");
      out.write("  <td>Pincode</td><td><pre>   </pre></td><td><input type=\"text\" ");
if(flag&&(!flag1)){
      out.write("value=\"");
      out.print(address2.getPinCode());
      out.write('"');
}
      out.write(" id=\"Cpincode\" size=\"35\" maxlength=\"6\" /></td>\n");
      out.write("</tr>\n");
      out.write(" \n");
      out.write("</table>\n");
      out.write("    <input type=\"hidden\" name=\"action\" value=\"personalinfo\"/>\n");
      out.write("    <input type=\"submit\" value=\"Next\">\n");
      out.write("</div>\n");
      out.write("</form>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
