<%@page import="java.util.List"%>
<%@page import="model.Produto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <title>Resultado Consultar Todos</title>
            <style>
            body{
                font-family: 'Varela Round', sans-serif;
            }
            .volta{
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
            .guia, tr{
                background-color: lightskyblue;
                border-radius: 15px;
                border: 2px solid black;
                padding-top: 5px;
                padding-left: 15px;
                text-align: center;
            }
            td{
                padding-left: 20px;
                padding-right: 20px;
            }
            tr{
                text-align: center;
            }
            h1  
            {
                font-size: 40pt;
                font-style: Arial;               
                color: lightskyblue;
                text-shadow: 2px 2px 2px  rgb(0, 0, 0);
                text-decoration: none
            }
            table, th{
                background-color: lightskyblue;
                border-radius: 15px;
                border: 2px solid black;
                font-style: cursive;             
            }  
            input{
                background-color: white;
                border-radius: 20px;
                font-size: 10pt;
            }
        </style>
    </head>

    <body>
        <a class="volta" href="/test_pedro/index.html">Volta</a>
        <h1>Todos os Produtos</h1>
        <%
            List<Produto> lprod = (List<Produto>) request.getAttribute("lprod");
        %>


        <table border="1">
            <tr class="guia">
                <th>ID</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Preço</th>
                <th>Ingredientes</th>
                <th>Nível</th>
                <th>Categoria</th>
                <th>Tempo</th>
                <th>Tipo</th>
                <th>Peso</th>
                <th>Avaliação</th>
                <th>Remover</th>
                <th>Editar</th>
            </tr>

            <%for (Produto p : lprod) {%>
            <tr>                
                <td><%out.print(p.getId());%></td>
                <td><%out.print(p.getNome());%></td>
                <td><%out.print(p.getDescricao());%></td>
                <td><%out.print(p.getPreco());%></td>
                <td><%out.print(p.getIngredientes());%></td>
                <td><%out.print(p.getNivel());%></td>
                <td><%out.print(p.getCategoria());%></td>
                <td><%out.print(p.getTempo());%></td>
                <td><%out.print(p.getTipo());%></td>
                <td><%out.print(p.getPeso());%></td>
                <td><%out.print(p.getAvaliacao());%></td>
                <td align="center"><a href="http://localhost:8084/test_pedro/controle_produto?op=DELETAR&txtid=<%out.print(p.getId());%>"><img src="imagens/lixeira01.png" width="25" height="25"></a></td>
                <td align="center"><a href="http://localhost:8084/test_pedro/controle_produto?txtid=<%out.print(p.getId());%>&txtnome=<%out.print(p.getNome());%>&txtdescricao=<%out.print(p.getDescricao());%>&txtpreco=<%out.print(p.getPreco());%>&txtingredientes=<%out.print(p.getIngredientes());%>&txtnivel=<%out.print(p.getNivel());%>&txtcategoria=<%out.print(p.getCategoria());%>&txttempo=<%out.print(p.getTempo());%>&txttipo=<%out.print(p.getTipo());%>&txtpeso=<%out.print(p.getPeso());%>&txtavaliacao=<%out.print(p.getAvaliacao());%>&op=ATUALIZAR" ><img src="imagens/editar01.png" width="25" height="25"></a></td>
            </tr>
            <%}%>

        </table>
    </body>
</html>
