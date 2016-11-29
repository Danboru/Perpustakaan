<%-- 
    Document   : logout
    Created on : Nov 25, 2016, 8:17:01 AM
    Author     : Iqbal
    Correct by : Danboru
--%>

<%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
