<%-- 
    Document   : hapus
    Created on : Nov 25, 2016, 3:52:55 PM
    Author     : Iqbal
    Correct by : Danboru
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
        String id=request.getParameter("d");
        int no=Integer.parseInt(id);
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/perpustakaan", "root", "");
            Statement st = conn.createStatement();
            st.executeUpdate("DELETE FROM pengarang WHERE id_pengarang = '"+no+"'");
            response.sendRedirect("pengarang.jsp");
        } catch(Exception e){}
        %>
