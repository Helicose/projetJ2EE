<%-- 
    Document   : page_jeu
    Created on : 8 mars 2017, 13:23:06
    Author     : langlois
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css" />
        <title>JSP Page</title>
    </head>
    <body>
        <h1 id="titre">Le juste prix</h1>
        <%
            int nombreATrouver = 0;
            int nbEssais = 0;
            
            if (session.getAttribute("essais") != null){
                nbEssais = Integer.parseInt(session.getAttribute("essais").toString());
            }
            
            
            if(session.getAttribute("nombreATrouver") == null){
                Random rand = new Random();
                nombreATrouver = rand.nextInt(101)-1;
            }
            else{
                nombreATrouver = Integer.parseInt(session.getAttribute("nombreATrouver").toString());
            }
            
            out.println("Nombre aléatoire : "+ nombreATrouver);
            session.setAttribute("nombreATrouver", nombreATrouver);
            
            if(request.getParameter("resultat") != null){
                out.println("<br/>");
                String resultat = request.getParameter("resultat").toString();
                
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

                    <input id="choix" class="trucdanschoix" type="number" name="choix" value="" />
                    <div id="resultats" class="trucdanschoix">
                        <div id="moins">-</div>
                        <div id="plus">+</div>
                    </div>
                    <input id="verification" class="trucdanschoix" type="submit" name="envoyer" value="Envoyer" />
                    
            </div>
            <input id="stats" type="submit" name="reset" value="Accès aux statistiques" width="100%" height="100%"/>
            <input type="submit" name="reset" value="Nouvelle partie" width="100%" height="100%"/>

        </form>
    </body>
    
</html>
