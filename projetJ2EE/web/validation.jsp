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
            
            try{
            
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            String verify = request.getParameter("verify");
            String stCaptcha = request.getParameter("captcha");
            session.getAttribute("x");
            session.getAttribute("y");
            if(password.equals(verify)){
                if(Integer.parseInt(stCaptcha)==((Integer)session.getAttribute("x")+(Integer)session.getAttribute("y"))){                   
                    try{
                        Class.forName("com.mysql.jdbc.Driver");
                    }catch(Exception e){
                        %><jsp:forward page="inscription.jsp" /><%
                    }
                    try{
                        conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/justeprix","root","");
                        stmt = conn.createStatement();
                    }catch(Exception e){
                        %><jsp:forward page="inscription.jsp" /><%
                    }
                    String req = "INSERT INTO user(login,password) VALUES(?,?)";
                    try{
                        PreparedStatement st = conn.prepareStatement(req);
                        st.setString(1,login);
                        st.setString(2,password);
                        st.executeUpdate();
                    }catch(Exception e){
                        %><jsp:forward page="inscription.jsp" /><%
                    }
                }else{
                    %><jsp:forward page="inscription.jsp" /><%
                }
            }else{
                    %><jsp:forward page="inscription.jsp" /><%
            }
            }catch(Exception e){
                %><jsp:forward page="inscription.jsp" /><%
            }
        %>
        <div>Vous êtes à présent inscrit!</div>
        <form method="POST" action="index.jsp"> 
            <input type="submit" value="Valider"/>
        </form>
    </body>
</html>