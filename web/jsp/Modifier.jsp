<%-- 
    Document   : Supprimer
    Created on : 31 janv. 2019, 10:34:46
    Author     : 21607860
--%>

<%@page import="java.util.Arrays"%>
<%@page import="BD.BD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Metier.MessageDor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modification de message</title>
    </head>
    <body>
        <h1>Messages d'or :</h1>

        <form action ="ConfirmerModification" method = "GET">

            <%! //fonction propre à la classe

                String isChecked(String[] liste, String num) 
                {
                    if (liste != null) { 
                        
                        int cpt = 0;
                        while (cpt < liste.length && !liste[cpt].equals(num)) {
                            cpt++;
                        }
                        if (cpt != liste.length) {
                            return "checked=\"checked\"";
                        }
                    }
                    return "";
                }
            %>   
            
            <%
                String msg = (String) request.getAttribute("msg_avrt");

                if (msg != null) {
                    out.println("<p>" + msg + "</p>");
                }

                ArrayList<MessageDor> Liste = new ArrayList<>();

                Liste = BD.lireMessages();
                
                session.setAttribute("ListeMessage", Liste);

                if (Liste.isEmpty()) {
                    out.println("<p>Pas de message enregistré.</p>");
                } else {

                    String[] listeModif = (String[]) session.getAttribute("TabModification");
                    
                    out.println("<table border = 1>");
                    out.println("<tr>");
                    out.println("<td>Sélection</td>");
                    out.println("<td>Pseudo</td>");
                    out.println("<td>Message</td>");
                    out.println("</tr>");

                    for (int i = 0; i < Liste.size(); i++) {

                        out.println("<tr>");
                        out.println("<td><input type=\"radio\" name = \"cb\" value = \"" + Liste.get(i).getId() + "\" " + isChecked(listeModif, Liste.get(i).getId() + "") + "></td>"); // rajouter "" à un int pour le transformer en String
                        out.println("<td>" + Liste.get(i).getPseudo() + "</td>");
                        out.println("<td>" + Liste.get(i).getTexte() + "</td>");
                        out.println("</tr>");
                    }
                    out.println("</table><br/>");

                }

            %>
            <input type ="submit" name="confirmer" value = "Confirmer">
        </form> 
    </body>
    </br><input type ="submit" name="confirmer" value = "Retour" onClick="history.back()">
</html>
