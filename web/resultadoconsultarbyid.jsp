<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <title>Resultado Cosultar By ID</title>
  <style>
    body{
                font-family: 'Varela Round', sans-serif;
    }
    h1
    {
        font-size: 40pt;
        font-style: Arial;
        color: lightskyblue;
        text-shadow: 2px 2px 2px  rgb(0, 0, 0);
    }
    text{
        padding-top: 10px;
    }
    table, th{
        background-color: lightskyblue;
        border-radius: 15px;
        border: 2px solid lightskyblue;
        font-style: cursive;
        padding-left: 10px;
        padding-top: 10px;
        padding-right: 10px;
        padding-bottom: 10px;
    }
    input{
        background-color: white;
        border-radius: 20px;
        font-size: 10pt;
    }
    a{
        background-color: red; /* Green */
        border: none;
        color: white;
        border-radius: 10px;
        padding: 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 4px 2px;
        cursor: pointer;
    }
    </style>
    </head>
    <body>
        <a class="volta" href="/test_pedro/index.html">Volta</a>
        <h1>Resultado Consultar By ID</h1>

        <table border="2" >
            <th align="left">
                <%
                    Produto p = (Produto) request.getAttribute("p");
                %>
                <%if (p.getNome() != null) {%>
                ID...............................................:<%out.print(p.getId());%> <BR>
                NOME........................................:<%out.print(p.getNome());%> <BR>
                DESCRIÇÃO............................:<%out.print(p.getDescricao());%> <BR>
                PREÇO......................................:<%out.print(p.getPreco());%> <BR>
                INGREDIENTES.....................:<%out.print(p.getIngredientes());%> <BR>
                NÍVEL DE DIFICULDADE...:<%out.print(p.getNivel());%> <BR>
                CATEGORIA...........................:<%out.print(p.getCategoria());%> <BR>
                TEMPO DE PREPARO..........:<%out.print(p.getTempo());%> <BR>
                TIPO DE REFEIÇÃO.............:<%out.print(p.getTipo());%> <BR>
                PESO EM GRAMAS...............:<%out.print(p.getPeso());%> <BR>
                AVALIAÇÃO...........................:<%out.print(p.getAvaliacao());%> <BR>
            </th>
        </table>

        <%} else {%>
        <h2>Produto não encontrado.</h2>
        <%}%>
    </body>
</html>
