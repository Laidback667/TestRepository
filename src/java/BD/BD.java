/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BD;

import Metier.MessageDor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author 21607860
 */
public class BD {

    /* Adresse phpmyadmin http://etu-web2.ut-capitole.fr/phpmyadmin/ */

 /* Données de connexion */
    private static final String URL = "jdbc:mysql://etu-web2.ut-capitole.fr:3306/db_21607860";
    private static final String LOGIN = "21607860";
    private static final String PASSWORD = "13240J";

    private static Connection cx;

    /* Méthodes */
    public static void connexion() throws Exception {
        /* Chargement du pilote */

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException cnfe) {
            throw new Exception("Pilotage Mysql introuvable - " + cnfe.getMessage());
        }

        /* Ouverture d'une connexion */
        try {
            BD.cx = DriverManager.getConnection(URL, LOGIN, PASSWORD);
        } catch (SQLException sqle) {
            throw new Exception("Problème de connexion à la BD - " + sqle.getMessage());
        }

    }

    /* Insere un message d'or */
    public static int enregistre(MessageDor msg) throws Exception {

        /*Test de connexion */
        if (BD.cx == null) {
            BD.connexion();
        }
        /* Requête SQL */
        String sql = "INSERT INTO MESSAGE (PSEUDO, MESSAGE) VALUES (?,?)"; // le "?" indique que c'est un paramètre qu'on va passer dans cette requête
        /* On déclare nb */
        int nb = 0;
        /* Espace de requête */
        PreparedStatement st;

        try {
            /* Ouvrir l'espace de requête */
            st = BD.cx.prepareStatement(sql);
            /*Insertion du message */
            st.setString(1, msg.getPseudo());
            st.setString(2, msg.getTexte());

            nb = st.executeUpdate(); // on récupère le nombre d'uplet insérer

            /* On ferme l'espace de requête */
            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de l'insertion - " + sqle.getMessage());

        }

        return nb;
    }

    /* Lecture des messages */
    public static ArrayList<MessageDor> lireMessages() throws Exception {

        /* Test de connexion */
        if (BD.cx == null) {
            BD.connexion();
        }
        /* Liste */
        ArrayList<MessageDor> Liste = new ArrayList<>();

        /* Espace de requête */
        PreparedStatement st;

        /* Requêt e*/
        String sql = "SELECT * From MESSAGE";

        try {
            /* Ouvre de l'espace de requête */
            st = BD.cx.prepareStatement(sql);

            /* Exécution */
            ResultSet rs = st.executeQuery();

            /* Lecture de la réponse */
            while (rs.next()) // .next permet de parcourir la liste des résultats
            /* En une seule étape */ {
                Liste.add(new MessageDor(rs.getInt("NumMsg"), rs.getString("Pseudo"), rs.getString("Message")));
            }

            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de la lecture des messages - " + sqle.getMessage());

        }

        return Liste;

    }

    /* Récupération de messages */
    public static ArrayList<MessageDor> recuperationMessages(int[] listeID) throws Exception {

        /* Test de connexion */
        if (BD.cx == null) {
            BD.connexion();
        }
        /* Liste */
        ArrayList<MessageDor> Liste = new ArrayList<>();

        /* Espace de requête */
        PreparedStatement st;

        /* Requêt e*/
        String sql = "SELECT * From MESSAGE Where NumMsg = ?";

        try {
            /* Ouvre de l'espace de requête */
            st = BD.cx.prepareStatement(sql);

            /* Exécution */
            ResultSet rs = st.executeQuery();

            /* Lecture de la liste */
            for (int i = 1; i <= listeID.length; i++) {

                /* Lecture de la réponse */
                while (rs.next()) // .next permet de parcourir la liste des résultats
                /* En une seule étape */ {

                    if (rs.getInt("NumMsg") == listeID[i]) {
                        Liste.add(new MessageDor(rs.getInt("NumMsg"), rs.getString("Pseudo"), rs.getString("Message")));
                    }

                }

            }
            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de la lecture des messages - " + sqle.getMessage());

        }

        return Liste;

    }

    public static int supprimerMessage(String ID) throws Exception {

        /*Test de connexion */
        if (BD.cx == null) {
            BD.connexion();
        }
        /* Requête SQL */
        String sql = "DELETE FROM MESSAGE WHERE NumMsg = ?"; // le "?" indique que c'est un paramètre qu'on va passer dans cette requête
        /* On déclare nb */
        int nb = 0;
        /* Espace de requête */
        PreparedStatement st;

        try {
            /* Ouvrir l'espace de requête */
            st = BD.cx.prepareStatement(sql);
            /*Insertion du message */
            st.setString(1, ID);

            nb = st.executeUpdate(); // on récupère le nombre d'uplet insérer

            /* On ferme l'espace de requête */
            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de la suppression - " + sqle.getMessage());

        }

        return nb;
    }

    public static int modifierMessage(String ID, String PSEUDO, String TEXTE) throws Exception {

        /*Test de connexion */
        if (BD.cx == null) {
            BD.connexion();
        }
        /* Requête SQL */
        String sql = "UPDATE MESSAGE SET pseudo = ?, message = ? WHERE NumMsg = ?"; // le "?" indique que c'est un paramètre qu'on va passer dans cette requête
        /* On déclare nb */
        int nb = 0;
        /* Espace de requête */
        PreparedStatement st;

        try {
            /* Ouvrir l'espace de requête */
            st = BD.cx.prepareStatement(sql);
            /*Insertion du message */
            st.setString(1, PSEUDO);
            st.setString(2, TEXTE);
            st.setString(3, ID);

            nb = st.executeUpdate(); // on récupère le nombre d'uplet insérer

            /* On ferme l'espace de requête */
            st.close();

        } catch (SQLException sqle) {

            throw new Exception("Problème lors de la modification - " + sqle.getMessage());

        }

        return nb;
    }

    /* Programme principal */
    public static void main(String[] s) {
        try {
            BD.connexion();

            BD.modifierMessage("20", "pseudo1", "message2");
            // création de l'arraylist
            ArrayList<MessageDor> l = BD.lireMessages();
            // syntaxe for(type nomvariable : arraylist)
            for (MessageDor messageDor : l) {
                System.out.println(messageDor);
            }

        } catch (Exception ex) {
            System.out.println(ex.getMessage());

        }
    }

}
