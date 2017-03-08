<%-- 
    Document   : inscription
    Created on : 8 mars 2017, 15:01:41
    Author     : mbescond
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription - Le Juste Prix</title>
    </head>
    <body>
        <h1>Le Juste Prix</h1>
        <h2>Inscription</h2>
        <hr/>
        <br/>
        <div>Veuillez remplir les champs afin de vous inscrire</div>
        <br/>
          <form method="POST" action="validation.jsp">
            <table border='0'>
                <tr>
                    <th>Adresse e-mail :</th>
                    <th><input type="email" name="login" value="email"/></th>
                </tr>
                <tr>
                    <th>Mot de passe : </th>
                    <th><input type="texte" name="password"/></th>
                </tr>    
                <tr>
                    <th>
                    <input type="submit" value="Valider"/>
                    </th>
                </tr> 
            </table>
            <br/>
            <br/>
            
        </form>
        
    </body>
</html>
