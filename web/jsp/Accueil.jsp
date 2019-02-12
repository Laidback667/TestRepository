<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Le livre d'or</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    
    <body>
        <h1>Menu</h1>
        <% session.removeAttribute("TabSuppression"); %>
         <ul>
            <li><a href = "Choix?action=saisir">Saisir message</a></li> 
            <li><a href = "Choix?action=lire">Lire messages</a></li>
            <li><a href = "Choix?action=modifier">Modifier messages</a></li>
            <li><a href = "Choix?action=supprimer">Supprimer message(s)</a></li>
        </ul>
    </body>
</html>
