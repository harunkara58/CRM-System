<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%
    String adminKadi = request.getParameter("adminKadi");    
    String adminSifre = request.getParameter("adminSifre");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb","root","Harunk.1");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from adminregister where adminKadi='" + adminKadi + "' and adminSifre='" + adminSifre + "'");
    if (rs.next()) {
        session.setAttribute("adminKadi", adminKadi);
        session.setAttribute("adminSifre", adminSifre); 
        response.sendRedirect("table.jsp");
    } else {
        response.sendRedirect("adminLogin.jsp");
    }
%>