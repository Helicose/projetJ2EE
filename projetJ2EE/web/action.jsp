<%-- 
    Document   : action.jsp
    Created on : 8 mars 2017, 14:40:31
    Author     : langlois
--%>

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
            int choix = Integer.parseInt(request.getParameter("choix"));
            int nombreATrouver = Integer.parseInt(session.getAttribute("nombreATrouver").toString());
            
            RequestDispatcher disp;
            
            if (choix == nombreATrouver){
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=bingo");
            }
            
            else if (choix < nombreATrouver){
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=pasassez");
            }
            
            else{
                disp = request.getRequestDispatcher("page_jeu.jsp?resultat=trop");
            }
            
            if(session.getAttribute("essais") == null){
                session.setAttribute("essais", Integer.toString(1));
            }
            else{
                int nbEssaisActuel = Integer.parseInt(session.getAttribute("essais").toString());
                session.setAttribute("essais", Integer.toString(nbEssaisActuel+1));
            }
            
            
            disp.forward(request, response);
        %>
    </body>
</html>
