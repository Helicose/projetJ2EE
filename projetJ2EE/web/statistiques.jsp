<%-- 
    Document   : statistiques
    Created on : 17 mars 2017, 11:08:30
    Author     : langlois
--%>

<%@page import="java.util.ArrayList"%>
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
        <h1>Statistiques</h1>
        
        <%
            Connection conn=null;
            Statement stmt=null;
            String email = (String)session.getAttribute("email");
            ArrayList<String> listeEmail = new ArrayList<String>();  
            ArrayList<Integer> listeNombre = new ArrayList<Integer>();  
            
            try{
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/justeprix","root","");
                stmt = conn.createStatement();
            }catch(Exception e){
                out.print(e);

            }
            String req = "SELECT email,nombre from partie where email='"+email+"';";

            try{
                PreparedStatement st = conn.prepareStatement(req);
                ResultSet rs=st.executeQuery(req);
                while(rs.next()){
                    listeEmail.add(rs.getString("email"));
                    listeNombre.add(rs.getInt("nombre"));
                }
            }catch(Exception e){
                out.print(e);
            }
                   
            if (listeEmail.size() != 0){
                int max = 0;
                int derniere = listeNombre.get(listeNombre.size()-1);
                for (int i=0; i<listeEmail.size(); i++){
                    if (listeNombre.get(i) > max){
                        max = listeNombre.get(i);
                    }
                }
                
                out.println("Dernière partie : "+ derniere +" essais");
                out.println("Max : "+ max +" essais");
            }
            
            
            
        %>
    </body>
</html>
