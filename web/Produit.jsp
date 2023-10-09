<%-- 
    Document   : Produit
    Created on : Oct 8, 2023, 3:07:04 PM
    Author     : hp
--%>

<%@page import="ma.projet.entities.Categorie"%>
<%@page import="ma.projet.services.CategorieService"%>
<%@page import="ma.projet.entities.Produit"%>
<%@page import="ma.projet.services.ProduitService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ProduitController" >
            <fieldset>
                <legend>Gestion des produits</legend>
                <table border="0">

                    <tr>
                        <td>Référence: </td>
                        <td><input type="text" name="reference" value="" /></td>
                    </tr>
                    <tr>
                        <td>Prix : </td>
                        <td><input type="number" name="prix" value="" /></td>
                    </tr>
                    <tr>
                        <td>Catégorie : </td>
                        <td>
                    <select name="Catégorie" id="categorieSelect">
                        <%
                            CategorieService cs = new CategorieService();
                            for (Categorie c : cs.findAll()) {
                        %>
                        <option value="<%= c.getId()%>"> <%= c.getLibelle()%></option>  
                        <%}%>
                    </select>
                      <input type="hidden" name="selectedCategorie" id="selectedCategorie" value="" />

                        </td>

                    </tr>

                    <tr>
                        
                        <td><input type="submit" value="Valider" name="valider" onclick="captureSelectedValue()" />
</td>
                        
                        <td></td>
                    </tr>

                </table>

            </fieldset>
        </form>

        <fieldset>
            <legend>Liste des produits</legend>
            <table border="0" id="example1">
                <thead>
                    <tr>
                        <th>Référence</th>
                        <th>Prix</th>
                        <th>Catégorie</th>
                        <th>Supprimer</th>
                        <th>Modifier</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ProduitService ps = new ProduitService();
                        for (Produit p : ps.findAll()) {
                    %>
                    <tr>
                        <td><%= p.getReference()%></td>
                        <td><%= p.getPrix()%></td>
                        <td> <%= p.getCategorie()%></td>
                        <td><a href="ProduitController?op=delete&id=<%=p.getId()%>">Supprimer</a></td>
                        <td><a href="CategorieController?op=update&id=<%=p.getId()%>">Modifier</a></td>
                    </tr>
                    <%}%>
                </tbody>
            </table>


        </fieldset>
        <script>
// JavaScript function to capture the selected value
            function captureSelectedValue() {
                var select = document.getElementById("categorieSelect");
                var selectedValue = select.options[select.selectedIndex].value;

// Set the selected value in a hidden input field
                document.getElementById("selectedCategorie").value = selectedValue;
            }
        </script>

    </body>
</html>
