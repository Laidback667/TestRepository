<%-- 
    Document   : Lire
    Created on : 31 janv. 2019, 09:51:25
    Author     : 21607860
--%>

<%@page import="BD.BD"%>
<%@page import="Metier.MessageDor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecture des Messages d'or</title>
    </head>
    <body>
        <h1>Messages d'or :</h1>
        <%
            String Confirmation = request.getParameter("etat");

            if (Confirmation != null) {
                if (Confirmation.equals("Ok")) {

                    out.println("<br/><p>Votre message a bien été enregistré.</p><br/>");

                }
            }

            ArrayList<MessageDor> Liste = new ArrayList<>();

            Liste = BD.lireMessages();

            if (Liste.isEmpty()) {
                out.println("<p>Pas de message enregistré.</p>");
            } else {
                out.println("<table border = 1>");
                out.println("<tr>");
                out.println("<td>Pseudo</td>");
                out.println("<td>Message</td>");
                out.println("</tr>");

                for (int i = 0; i < Liste.size(); i++) {
                    out.println("<tr>");
                    out.println("<td>" + Liste.get(i).getPseudo() + "</td>");
                    out.println("<td>" + Liste.get(i).getTexte() + "</td>");
                    out.println("</tr>");
                }
                out.println("</table>");
            }

        %>
    </body>
    </br><input type ="submit" name="confirmer" value = "Retour" onClick="history.back()">
</html>
