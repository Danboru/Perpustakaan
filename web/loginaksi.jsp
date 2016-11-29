<%-- 
    Document   : loginaksi
    Created on : Nov 25, 2016, 7:18:11 AM
    Author     : Iqbal
    Correct by : Danboru
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/perpustakaan","root", "");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from petugas where username='" + userid + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("index/indexlog.jsp");
    } else {
        response.sendRedirect("login.jsp");
        %><script type="text/javascript">alert("Login Gagal");</script>
 <%   }
%>
