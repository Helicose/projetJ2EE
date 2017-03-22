<%-- 
    Document   : inscription
    Created on : 8 mars 2017, 15:01:41
    Author     : mbescond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="./style2.css" />
        <title>Inscription - Le Juste Prix</title>
    </head>
    <body>
        <%
            Random rand = new Random();
            
            int x = rand.nextInt(50);
            int y = rand.nextInt(50);
            session.setAttribute("x", x);
            session.setAttribute("y", y);
        %>
        <h1 id="titre">Le Juste Prix</h1>
        <h2>Inscription</h2>
        <hr/>
        <br/>
        <div>Veuillez remplir les champs afin de vous inscrire</div>
        <br/>
          <form id="form" method="POST" action="validation.jsp">
            <table border='0'>
                <tr>
                    <th>Adresse e-mail :</th>
                    <th><input type="email" name="login" value="e-mail" onclick="this.value=''"/></th>
                </tr>
                <tr>
                    <th>Mot de passe : </th>
                    <th><input type="password" name="password"/></th>
                </tr>  
                <tr>
                    <th>Vérification du Mot de passe : </th>
                    <th><input type="password" name="verify"/></th>
                </tr>   
                <tr>
                    <th>Combien font <% out.print(x + " + " + y + " ?");%> </th>
                    <th><input type="number" name="captcha"/></th>
                </tr>   
            </table>
            <input type="submit" value="Valider"/>
            <br/>
            <br/>
            
        </form>
        
    </body>
</html>