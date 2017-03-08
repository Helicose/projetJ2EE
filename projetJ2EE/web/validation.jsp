<%-- 
    Document   : validation
    Created on : 8 mars 2017, 15:17:44
    Author     : mbescond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation - Le Juste Prix</title>
    </head>
    <body>
         <h1>Le Juste Prix</h1>
        <h2>Inscription</h2>
        <hr/>
        <br/>
        <%
            Connection conn=null;
            Statement stmt=null;
            
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            
            
            try{
                Class.forName("com.mysql.jdbc.Driver").newInstance();
            }catch(Exception e){
                    out.print(e);
            }
            
            try{
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3006/justeprix","root","");
                stmt = conn.createStatement();
            }catch(Exception e){
                out.print(e);
            }
            
            PreparedStatement st = conn.prepareStatement("INSERT INTO user (login,password)"
                    +" VALUES(?, ?)");
            st.setString(1,login);
            st.setString(2,password);
            
            st.executeUpdate();
        %>
        <div>Vous êtes à présent inscrit!</div>
    </body>
</html>
