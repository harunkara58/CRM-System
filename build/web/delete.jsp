

<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey&characterEncoding=UTF-8", "root", "Harunk.1");
Statement st=conn.createStatement();
st.executeUpdate("DELETE FROM registertable WHERE id="+id);
 request.setCharacterEncoding("UTF-8");
response.sendRedirect("table.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
