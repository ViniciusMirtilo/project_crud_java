<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com">
        <link rel="stylesheet" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap" rel="stylesheet">
        <title>Página Resultado</title>
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
        <%
           String msg = (String) request.getAttribute("message");
        %>
        <a href="/test_pedro/index.html">Volta</a>
        <h1><%out.println(msg);%> realizado com sucesso.</h1>
    </body>
</html>
