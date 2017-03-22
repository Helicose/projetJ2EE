<%-- 
    Document   : connexion
    Created on : 15 mars 2017, 15:27:12
    Author     : mbescond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./style2.css" />
        <title>Connexion - Le Juste Prix</title>
    </head>
    <body>
        <h1 id="titre">Le Juste Prix</h1>
        <h2>Connexion</h2>
        <%
            Connection conn=null;
            Statement stmt=null;
            if(session.getAttribute("essais")!=null && session.getAttribute("nombreATrouver")!=null){
                session.removeAttribute("essais");
                session.removeAttribute("nombreATrouver");
            }
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }catch(Exception e){
                    %><jsp:forward page="index.jsp" /><%
            }
            try{
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/justeprix","root","");
                stmt = conn.createStatement();
            }catch(Exception e){
                %><jsp:forward page="index.jsp" /><%
            }
            String req = "SELECT password from user where login='"+login+"';";
            
            session = request.getSession();
            session.setAttribute("login",login);
            session.setAttribute("password",password);
            try{
                PreparedStatement st = conn.prepareStatement(req);
                ResultSet rs=st.executeQuery(req);
                rs.next();
                    String mdp = rs.getString("password");
                
                if(password.equals(mdp)){
                    session.setAttribute("email", login);
                    %><jsp:forward page="page_jeu.jsp" /><%
                }else{
                    %><jsp:forward page="index.jsp" /><%
                }
                
            }catch(Exception e){
                out.print("<h1 id='erreur'>Erreur d'e-mail ou de mot de passe</h1>");
                out.print("<form id='form' method:'POST' action='index.jsp'>"
                        + "<input type='submit' value='Retour'/>"
                        + "</form>");
            }
        %>
    </body>
</html>