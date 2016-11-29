<%-- 
    Document   : tambahaksi
    Created on : Nov 25, 2016, 4:25:29 PM
    Author     : Iqbal
    Correct by : Danboru
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String a=request.getParameter("id_pengarang");
String b=request.getParameter("nama_pengarang");
//membuat variabel untuk nampung alamat untuk akses database nantinya.
String url="jdbc:mysql://localhost:3306/perpustakaan";
//membuat koneksi ke database dengan jdbc
Connection conn=null;
PreparedStatement ps=null;
Class.forName("com.mysql.jdbc.Driver").newInstance();
int updateQuery=0;
//untuk mengecek textbox name, city, dan phone tidak kosong
if(a!=null && b!=null ){
    if(a!="" && b!=""){
         try{
        conn=DriverManager.getConnection(url,"root","");
        String query="Insert into pengarang(id_pengarang,nama_pengarang) values(?,?)";
        ps=conn.prepareStatement(query);
        ps.setString(1,a);
       ps.setString(2,b);
       
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            out.println("<script>alert('Berhasil Menyimpan data')</script>");
            response.sendRedirect("pengarang.jsp");
        }
    }catch(Exception ex){
        out.println("Koneksi bermasalah");
        
 
    }finally{
        ps.close();
        conn.close();
    }
    }
}
%>
