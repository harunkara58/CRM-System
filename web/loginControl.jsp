<%@ page import ="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%
    String mail = request.getParameter("mail");    
    String sifre = request.getParameter("sifre");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb","root","Harunk.1");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from registertable where mail='" + mail + "' and sifre='" + sifre + "'");
    if (rs.next()) {
        session.setAttribute("mail", mail);
        session.setAttribute("sifre", sifre); 
        response.sendRedirect("index.jsp");
    } else {
        response.sendRedirect("loginPage.jsp");
    }
%>