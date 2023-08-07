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
            table, th, form{
                background-color: lightskyblue;
                border-radius: 15px;
                border: 2px solid black;
                font-style: cursive;
                padding-top: 10px;
                padding-left: 10px;
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
        <h1>Resultado Cosultar By ID</h1>
        <%
            Produto p = (Produto) request.getAttribute("p");
        %>
        <%if (p.getDescricao() != null) {%>

            <form name="f1" action="controle_produto" method="GET">
              ID...................: <%out.print(p.getId());%> <input type="hidden" name="txtid" value="<%out.print(p.getId());%>"><BR><br>
              NOME.................: <input type="text" name="txtnome" value="<%out.print(p.getNome());%>"><BR><br>
              DESCRIÇÃO............: <input type="text" name="txtdescricao" value="<%out.print(p.getDescricao());%>"><BR><br>
              PREÇO................: <input type="number" name="txtpreco" value="<%out.print(p.getPreco());%>"><BR><br>
              INGREDIENTES.........: <input type="text" name="txtingredientes" value="<%out.print(p.getIngredientes());%>"><BR><br>
              NÍVEL DE DIFICULDADE.: <input type="text" name="txtnivel" value="<%out.print(p.getNivel());%>"><BR><br>
              CATEGORIA............: <input type="text" name="txtcategoria" value="<%out.print(p.getCategoria());%>"><BR><br>
              TEMPO DE PREPARO.....: <input type="text" name="txttempo" value="<%out.print(p.getTempo());%>"><BR><br>
              TIPO DE REFEIÇÃO.....: <input type="text" name="txttipo" value="<%out.print(p.getTipo());%>"><BR><br>
              PESO EM GRAMAS.......: <input type="text" name="txtpeso" value="<%out.print(p.getPeso());%>"><BR><br>
              AVALIAÇÃO............: <input type="number" name="txtavaliacao" value="<%out.print(p.getAvaliacao());%>"><BR><BR><br>
              <input type="submit" name="op" value="EFETIVAR ATUALIZAÇÃO">
          </form>
        <%} else {%>
        <h2>Produto não encontrado.</h2>
        <%}%>
    </body>
</html>