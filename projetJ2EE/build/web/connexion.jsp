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
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Connection conn=null;
            Statement stmt=null;
            
            String login = request.getParameter("login");
            String password = request.getParameter("password");
            out.print("Erreur 1 : <br/>");
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }catch(Exception e){
                    out.print(e);
            }
            out.print("<br/>Erreur 2 : <br/>");
            try{
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/justeprix","root","");
                stmt = conn.createStatement();
            }catch(Exception e){
                out.print(e);

            }
            String req = "SELECT password from user where login='"+login+"';";
            out.print("<br/>Erreur 3 : <br/>");
            try{
                PreparedStatement st = conn.prepareStatement(req);
                ResultSet rs=st.executeQuery(req);
                rs.next();
                    String mdp = rs.getString("password");
                
                if(password.equals(mdp)){
                    session.setAttribute("email", login);
                    %><jsp:forward page="page_jeu.jsp" /><%
                }else{
                    %><jsp:forward page="index.html" /><%
                }
            }catch(Exception e){
                out.print(e);
            }
        %>
    </body>
</html>
