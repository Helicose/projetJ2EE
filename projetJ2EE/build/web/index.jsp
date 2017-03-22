<%-- 
    Document   : index
    Created on : 21 mars 2017, 17:17:06
    Author     : mbescond
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accès au Juste Prix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="./style2.css" />
    </head>
    <body>
        <%
            session = request.getSession();
                session.removeAttribute("login");
                session.removeAttribute("password");
                session.invalidate();
        %>
        <h1 id="titre">Le Juste Prix</h1>
        <h2>Page de connexion</h2>
        <hr/>
        <br/>
            <form id="form" method="POST" action="connexion.jsp">
                <table border='0'>
                    <tr>
                        <th> Login :</th>
                        <th><input type="email" name="login" value="email" onclick="this.value=''" /></th>
                    </tr>
                    <tr>
                        <th>Password : </th>
                        <th><input type="password" name="password"/></th>
                    </tr>    
                </table>
                <input style="right:0;" type="submit" value="Valider"/>
                <br/>
                <br/>
                <div>Vous n'êtes pas inscrit? <a href="inscription.jsp">Cliquez ici pour nous rejoindre.</a></div>

            </form>
    </body>
</html>
