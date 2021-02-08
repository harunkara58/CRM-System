<%@ page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>

<%
request.setCharacterEncoding("UTF-8");

    String urunAdi = request.getParameter("urunAdi");
    String urunFiyat = request.getParameter("urunFiyat");
    String urunAdedi = request.getParameter("urunAdedi");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8", "root", "Harunk.1");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into tekliftable( urunAdi, urunFiyat, urunAdedi) values ('" + urunAdi + "','" + urunFiyat + "','" + urunAdedi + "')");
    if (i > 0) {
        response.sendRedirect("index.jsp");
      
       
    } else {
        response.sendRedirect("index.jsp");
    }
%>

