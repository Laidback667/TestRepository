<%-- 
    Document   : ConfirmerSuppression
    Created on : 1 févr. 2019, 09:57:58
    Author     : 21607860
--%>

<%@page import="Metier.MessageDor"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirmation de modification</title>
    </head>
    <body>
        <h1>Confirmation de modification</h1>

        <h2>Vous pouvez modifier les messages suivants :</h2>

        <%
            String msg = (String) request.getAttribute("msg_avrt");

            if (msg != null) {
                out.println("<p>" + msg + "</p>");
            }

            String[] listeModif = (String[]) session.getAttribute("TabModification");
        %>

        <form action ="Modification" method = "GET"> 
            <%
                out.println("<table border = 1>");
                out.println("<tr>");
                out.println("<td>Pseudo</td>");
                out.println("<td>Message</td>");
                out.println("</tr>");

                for (int i = 0; i < listeModif.length; i++) {
                    System.out.println("ID :" + listeModif[i]);
                    out.println("<tr>");
                    out.println("<td><input type=\"hidden\" name = \"cb\" value = \"" + listeModif[i] + "\" ><input type=\"text\" name=\"pseudo\"></td>");
                    out.println("<td><input type=\"text\" name=\"texte\" ></td>");
                    out.println("</tr>");
                }
                out.println("</table><br/>");


            %>
            </br><input type ="submit" name="action" value = "Oui"> 
        </form>
        <form action ="Modifier" method = "GET">  
            </br><input type ="submit" name="action" value = "Non"> 
        </form>
        <form action ="Accueil" method = "GET">  
            </br><input type ="submit" name="action" value = "Annuler"> 
        </form>
    </body>
</html>
