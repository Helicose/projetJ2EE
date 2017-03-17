<%-- 
    Document   : action.jsp
    Created on : 8 mars 2017, 14:40:31
    Author     : langlois
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int nbEssais = 0;
            int choix = 0;
            RequestDispatcher disp;
            
            if (request.getParameter("stats") == null && request.getParameter("reset") == null && request.getParameter("choix") != null && session.getAttribute("nombreATrouver") != null){
                choix = Integer.parseInt(request.getParameter("choix").toString());
            }
            if (request.getParameter("reset") != null && session.getAttribute("essais") != null){
                session.setAttribute("essais", Integer.toString(-1));
                Random rand = new Random();
                int nombreATrouver = rand.nextInt(101)+1;
                session.setAttribute("nombreATrouver", nombreATrouver);
                choix = -7887664;
            }
            
            int nombreATrouver = Integer.parseInt(session.getAttribute("nombreATrouver").toString());
            
            if (choix == nombreATrouver){
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=bingo");
            }
            
            else if (choix < nombreATrouver){
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=pasassez");
            }
            
            else if (choix > nombreATrouver){
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=trop");
            }
            
            else{
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=blabla");
            }
            
            if (choix == -7887664){
                disp = request.getRequestDispatcher("page_jeu.jsp");
            }
            
            if(session.getAttribute("essais") == null){
                session.setAttribute("essais", Integer.toString(1));
            }
            else{
                int nbEssaisActuel = Integer.parseInt(session.getAttribute("essais").toString());
                session.setAttribute("essais", Integer.toString(nbEssaisActuel+1));
            }
            
            if(request.getParameter("stats") != null){
                disp = request.getRequestDispatcher("statistiques.jsp");
            }
            
            
            disp.forward(request, response);
        %>
    </body>
</html>