<%-- 
    Document   : index
    Created on : 21 mars 2017, 17:17:06
    Author     : langlois
--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accès au Juste Prix</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            session = request.getSession();
                session.removeAttribute("login");
                session.removeAttribute("password");
                session.invalidate();
        %>
        <h1>Le Juste Prix</h1>
        <h2>Page de connexion</h2>
        <hr/>
        <br/>
        <form method="POST" action="connexion.jsp">
            <table border='0'>
                <tr>
                    <th> Login :</th>
                    <th><input type="email" name="login" value="email" onclick="this.value=''" /></th>
                </tr>
                <tr>
                    <th>Password : </th>
                    <th><input type="password" name="password"/></th>
                </tr>    
                <tr>
                    <th>
                    <input type="submit" value="Valider"/>
                    </th>
                </tr> 
            </table>
            <br/>
            <br/>
            <div>Vous n'êtes pas inscrit? <a href="inscription.jsp">Cliquez ici pour nous rejoindre.</a></div>
            
        </form>
        
    </body>
</html>
