<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>

<%@ page 
  import="java.util.*" 
  import="java.awt.*"
  import="java.io.*"
  import="java.util.*"
  import="javax.imageio.ImageIO"
  import="com.google.zxing.BarcodeFormat"
  import="com.google.zxing.EncodeHintType"
  import="com.google.zxing.WriterException"
  import="com.google.zxing.common.BitMatrix"
  import="com.google.zxing.qrcode.QRCodeWriter"
  import="com.google.zxing.qrcode.decoder.ErrorCorrectionLevel"    
%>

<html>
 <head>
  <title> QR </title>
 </head>

 <body>

  <%! 
   QRCodeWriter wr;
  %> 

 <h2>Welcome, dear stranger</h2>

<form action="makeqr.jsp?host=&code=" method="GET">
 <table border="0" cellpadding="0" cellspacing="0"><tbody>
    <tr><td>host:&nbsp;</td>
          <td><input type="text" name="host" maxlength=72 size=30 value="http://qr.qxyz.ru"></td></tr>
    <tr><td>Code(HEX):&nbsp;</td>
        <td><input type=text name=code maxlength=72 size=60 value="<%
out.print("FFF");
//

%>"></td></tr>
  </tbody></table>
<!--
    <br>
    <textarea name=Message rows=6 cols=72></textarea><br>
-->
 <input type=submit name=Send value="Make QR-code">&nbsp;&nbsp;&nbsp;
 </form>

<!--
 <ul>
  <li>Enter needeble reference
  <li><input type="text" size="50" required> 
 </ul>
-->

  <%
   // wr = new QRCodeWriter();
  %>  
<%--
  <% 
   //response.setContentType("image/png");
  %>
--%>
 </body>
</html>
