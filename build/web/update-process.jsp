<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%@page import="java.sql.*"%>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/registerdb";%>
<%!String user = "root";%>
<%!String psw = "Harunk.1";%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String sirket=request.getParameter("sirket");
String isim=request.getParameter("isim");
String soyisim=request.getParameter("soyisim");
String mail=request.getParameter("mail");
if(id != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(id);
try
{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","root","Harunk.1");
String sql="Update registertable set id=?, sirket=?, isim=?, soyisim=?, mail=? where id="+id;

ps = con.prepareStatement(sql);
ps.setString(1,id);
ps.setString(2, sirket);
ps.setString(3, isim);
ps.setString(4, soyisim);
ps.setString(5, mail);
int i = ps.executeUpdate();

if(i > 0)
{
response.sendRedirect("table.jsp");
}
else
{
out.print("Kayıt güncellenirken bir sorun var..");
}
}
catch(SQLException sql)
{
request.setAttribute("HATA", sql);
out.println(sql);
}
}
%>
