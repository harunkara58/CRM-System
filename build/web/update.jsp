<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("id");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "registerdb";
String userid = "root";
String password = "Harunk.1";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/registerdb?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey","root","Harunk.1");
statement=connection.createStatement();
String sql ="select * from registertable where id="+id;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="css/updateTasarim.css" type="text/css" rel="stylesheet"/>
<body>

<form method="post" action="update-process.jsp">
<input type="hidden" name="id" value="<%=resultSet.getString("id") %>">

 <label>
        <input id="sirket" type="text" name="sirket" placeholder="sirket" value="<%=resultSet.getString("sirket") %>">
        </label>

        <label>
        <input id="isim" type="text" name="isim" placeholder="isim" value="<%=resultSet.getString("isim") %>">
        </label>

        <label>
        <input id="soyisim" type="text" name="soyisim" placeholder="soyisim"  value="<%=resultSet.getString("soyisim") %>">
        </label>

        <label>
        <input id="mail" type="text" name="mail" placeholder="mail" value="<%=resultSet.getString("mail") %>" >
        </label>


            <div id="kayıtOl"><input type="submit" value="Güncelle"></div>
</form>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>