<%-- 
    Document   : editaksi
    Created on : Nov 25, 2016, 3:30:53 PM
    Author     : Iqbal
    Correct by : Danboru
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String a=request.getParameter("id_bahasa_buku");
String b=request.getParameter("bahasa_buku");
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
        String query="Update bahasa_buku set bahasa_buku=? where id_bahasa_buku='"+a+"'";
        ps=conn.prepareStatement(query);
        
       ps.setString(1,b);
       
        updateQuery=ps.executeUpdate();
        if(updateQuery!=0){
            out.println("<script>alert('Berhasil Menyimpan data')</script>");
            response.sendRedirect("bahasa_buku.jsp");
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