<%-- 
    Document   : Saisir
    Created on : 30 janv. 2019, 10:23:07
    Author     : 21607860
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Saisir un message</title>
    </head>
    <body>

        <h1>Saisissez un message</h1>

        <%
            
        String Pseudo = (String)request.getAttribute("pseudo");
        String Message = (String)request.getAttribute("message");
           
        if(Pseudo == null) {Pseudo = "";}
        if(Message == null) {Message = "";}

        %>

        <form action ="Enregistrer" method = "GET">
            
            Pseudo <input type ="text" name="pseudo" value = <%=Pseudo%>> <br/><br/> <!-- Possibilité de mettre une expression en java au lieu de la variable, voir syntaxe -->
            Message <input type ="text" name="message" value = <%=Message%>><br/><br/>
            
            <input type ="submit" name="enregistrer" value = "Enregistrer">
            
        </form>
        
        <%
          // Récupère le message d'avertissement ou d'erreur
          
          String msg = (String)request.getAttribute("msg_avrt");
          
          //J'affiche la ligne sur la page
          if(msg != null){
              out.println("<p>" + msg + "</p>");
          }

        %>
    </body>
    </br><input type ="submit" name="confirmer" value = "Retour" onClick="history.back()">
</html>
