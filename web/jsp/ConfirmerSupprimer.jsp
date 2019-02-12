<%-- 
    Document   : ConfirmerSuppression
    Created on : 1 févr. 2019, 09:57:58
    Author     : 21607860
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation de suppression</title>
    </head>
    <body>
        <h1>Confirmation de suppression</h1>

        <h2>Les messages suivants seront supprimés :</h2>

        <%

            String[] listeSuppr = (String[]) session.getAttribute("TabSuppression");

            out.println("<table border = 1>");
            out.println("<tr>");
            out.println("<td>Identifiant du message</td>");
            out.println("</tr>");

            for (int i = 0; i < listeSuppr.length; i++) {
                out.println("<tr>");
                out.println("<td>" + listeSuppr[i] + "</td>");
                out.println("</tr>");
            }
            out.println("</table><br/>");

        %>

        <form action ="Suppression" method = "GET">       
            </br><input type ="submit" name="action" value = "Oui"> 
        </form>
        <form action ="Supprimer" method = "GET">  
            </br><input type ="submit" name="action" value = "Non"> 
        </form>
        <form action ="Accueil" method = "GET">  
            </br><input type ="submit" name="action" value = "Annuler"> 
        </form>
    </body>
</html>
