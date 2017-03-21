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
        <title>Statistiques</title>
    </head>
    <body>
        <h1>Statistiques</h1>
        
        <%  if(session.getAttribute("login")!=null && session.getAttribute("password")!=null){
                Connection conn=null;
                Statement stmt=null;
                String email = (String)session.getAttribute("email");
                ArrayList<String> listeEmail = new ArrayList<String>();  
                ArrayList<Integer> listeNombre = new ArrayList<Integer>();  
                //session.setAttribute("session",(Integer)session.getAttribute("session")-1);
            
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

                int nbParties = listeEmail.size();
                if (nbParties != 0){
                    int max = listeNombre.get(0);
                    int min = listeNombre.get(0);
                    int derniere = listeNombre.get(listeNombre.size()-1);
                    for (int i=0; i<listeEmail.size(); i++){
                        if (listeNombre.get(i) > max){
                            max = listeNombre.get(i);
                        }
                        if (listeNombre.get(i) < min){
                            min = listeNombre.get(i);
                        }
                    }

                    out.println("Nombre de parties : "+ nbParties +" <br/>");
                    out.println("Dernière partie : "+ derniere +" essais <br/>"); 
                    out.println("Max : "+ max +" essais <br/>");
                    out.println("Min : "+ min +" essais <br/>");
                }
            
            }else{
                
            }
            
        %>
    </body>
</html>
