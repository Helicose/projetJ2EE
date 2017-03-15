<%-- 
    Document   : page_jeu
    Created on : 8 mars 2017, 13:23:06
    Author     : langlois
--%>

<%@page import="java.util.Random"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="titre">Le juste prix</h1>
        <%
            int nombreATrouver = 0;
            int nbEssais = 0;
            String resultat;
            
            Connection conn=null;
            Statement stmt=null;
            
            try{
                Class.forName("com.mysql.jdbc.Driver");
            }catch(Exception e){
                    out.print(e);
            }
            try{
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/justeprix","root","");
                stmt = conn.createStatement();
            }catch(Exception e){
                out.print(e);
            }
            
                     
            if (session.getAttribute("essais") != null){
                nbEssais = Integer.parseInt(session.getAttribute("essais").toString());
            }       
            
            if(session.getAttribute("nombreATrouver") == null){
                Random rand = new Random();
                nombreATrouver = rand.nextInt(99)+1;
            }
            else{
                nombreATrouver = Integer.parseInt(session.getAttribute("nombreATrouver").toString());
            }
            
            out.println("Nombre aléatoire : "+ nombreATrouver);
            session.setAttribute("nombreATrouver", nombreATrouver);
            
            if(request.getParameter("resultat") != null){
                out.println("<br/>");
                resultat = request.getParameter("resultat").toString();
                
                if (resultat.equals("bingo")){
                    out.println("Vous avez trouvé le nombre !");
                    out.println("<br/>Nombre d'essais total : "+ nbEssais);
                }
                else if (resultat.equals("pasassez")){
                    out.println("C'est plus !");
                    out.println("<br/>Nombre d'essais actuel : "+ nbEssais);
                }
                
                else if (resultat.equals("trop")){
                    out.println("C'est moins !");
                    out.println("<br/>Nombre d'essais actuel : "+ nbEssais);
                }
                else{
                    out.println("Si cette phrase s'affiche c'est qu'il y a un problème lol");
                }
            }
        %>
        <form action="action.jsp">
            <div id ="jeu">

                    <input id="choix" class="trucdanschoix" type="number" name="choix" value="" autofocus />
                    <div id="resultats" class="trucdanschoix">
                        <%
                        if(request.getParameter("resultat") != null){
                            resultat = request.getParameter("resultat").toString();
                            if (resultat.equals("bingo")){ 
                                %> <div id="moins" style="background-color:#66BB6A;">-</div>
                                <div id="plus" style="background-color:#66BB6A;">+</div> <%
                            }
                            else if (resultat.equals("pasassez")){
                                %> <div id="moins" style="background-color:#B0BEC5;">-</div>
                                <div id="plus" style="background-color:#81D4FA;">+</div> <%
                            }
                            else if (resultat.equals("trop")){
                                %> <div id="moins" style="background-color:#81D4FA;">-</div>
                                <div id="plus" style="background-color:#B0BEC5;">+</div> <%
                            }
                            else{
                                %> <div id="moins">-</div>
                                <div id="plus">+</div> <%
                            }
                        }
                        else{
                                %> <div id="moins">-</div>
                                <div id="plus">+</div> <%
                            }
                        %>
                        
                    </div>
                    <%
                    if(request.getParameter("resultat") != null){
                        resultat = request.getParameter("resultat").toString();
                        if (resultat.equals("bingo")){ 
                            %><input id="verification" class="trucdanschoix" type="button" value="Bravo ! Vous avez gagné !" disabled="disabled" style="color: black;background-color:#66BB6A"/> <%
                            
                            try{
                                String email = (String)request.getParameter("login");
                            
                            String req = "INSERT INTO partie(email, nombre) VALUES(?,?)";
                        PreparedStatement st = conn.prepareStatement(req);
                        st.setString(1,email);
                        st.setInt(2,nbEssais);
                        st.executeUpdate();
                    }catch(Exception e){
                        out.print(e);

                    }
                        }
                        else{
                            %> <input id="verification" class="trucdanschoix" type="submit" name="envoyer" value="Envoyer" style="color: black;" /> <%
                        }
                    }
                    else{
                            %> <input id="verification" class="trucdanschoix" type="submit" name="envoyer" value="Envoyer" style="color: black;" /> <%
                    }
                    
                    %>
                    
                    <input id="reset" class="trucdanschoix" type="submit" name="reset" value="Nouvelle partie" width="100%" height="100%"/>
            </div>
            

        </form>
    </body>
    
</html>