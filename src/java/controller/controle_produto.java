package controller;

import DAO.ProdutoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Produto;

@WebServlet(name = "controle_produto", urlPatterns = {"/controle_produto"})
public class controle_produto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String op = request.getParameter("op");
            ProdutoDAO pdao = new ProdutoDAO();
            Produto p = new Produto();

            if (op.equals("CADASTRAR")) {
                String nome = request.getParameter("txtnome");
                String descricao = request.getParameter("txtdescricao");
                double preco = Double.parseDouble(request.getParameter("txtpreco"));
                String ingredientes = request.getParameter("txtingredientes");
                String nivel = request.getParameter("txtnivel");
                String categoria = request.getParameter("txtcategoria");
                String tempo = request.getParameter("txttempo");
                String tipo = request.getParameter("txttipo");
                String peso = request.getParameter("txtpeso");
                double avaliacao = Double.parseDouble(request.getParameter("txtavaliacao"));
                p.setNome(nome);
                p.setDescricao(descricao);
                p.setPreco(preco);
                p.setIngredientes(ingredientes);
                p.setNivel(nivel);
                p.setCategoria(categoria);
                p.setTempo(tempo);
                p.setTipo(tipo);
                p.setPeso(peso);
                p.setAvaliacao(avaliacao);
                String msg = "Cadastrado";
                try {
                    pdao.cadastrar(p);
                    System.out.println("Cadastrado com sucesso!!");
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("resultadooperacao.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }

            } else if (op.equals("DELETAR")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                p.setId(id);
                                String msg = "Deletar";

                try {
                    pdao.deletar(p);    
                    
                    List<Produto> lprod = pdao.consultarTodos();
                    request.setAttribute("lprod", lprod);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                    
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro:" + ex.getMessage());
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }
                
                

            } else if (op.equals("ATUALIZAR")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                p.setId(id);
                try {
                    
                    p = pdao.consultarById(p);
                    request.setAttribute("p", p);
                    request.getRequestDispatcher("resultadoconsultaratualizar.jsp").forward(request, response);
                    
                    
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

                
                
            } else if (op.equals("CONSULTAR TODOS")) {

                String msg = "Consultar";
                try {
                    List<Produto> lprod = pdao.consultarTodos();
                    request.setAttribute("lprod", lprod);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

                
                
            } else if (op.equals("CONSULTAR BY ID")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                p.setId(id);
                try {
                    p = pdao.consultarById(p);
                    request.setAttribute("p", p);
                    request.getRequestDispatcher("resultadoconsultarbyid.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                }

                
                
            } else if (op.equals("EFETIVAR ATUALIZAÇÃO")) {
                int id = Integer.parseInt(request.getParameter("txtid"));
                String nome = request.getParameter("txtnome");
                String descricao = request.getParameter("txtdescricao");
                double preco = Double.parseDouble(request.getParameter("txtpreco"));
                String ingredientes = request.getParameter("txtingredientes");
                String nivel = request.getParameter("txtnivel");
                String categoria = request.getParameter("txtcategoria");
                String tempo = request.getParameter("txttempo");
                String tipo = request.getParameter("txttipo");
                String peso = request.getParameter("txtpeso");
                double avaliacao = Double.parseDouble(request.getParameter("txtavaliacao"));
                p.setId(id);
                p.setNome(nome);
                p.setDescricao(descricao);
                p.setPreco(preco);
                p.setIngredientes(ingredientes);
                p.setNivel(nivel);
                p.setCategoria(categoria);
                p.setTempo(tempo);
                p.setTipo(tipo);
                p.setPeso(peso);
                p.setAvaliacao(avaliacao);
                String msg = "Atualizado";
                try {
                    pdao.atualizar(p);
                    System.out.println("Atuaizado com sucesso!!");
                   
                    List<Produto> lprod = pdao.consultarTodos();
                    request.setAttribute("lprod", lprod);
                    request.getRequestDispatcher("resultadoconsultartodos.jsp").forward(request, response);
                } catch (ClassNotFoundException | SQLException ex) {
                    System.out.println("Erro ClassNotFound: " + ex.getMessage());
                    request.setAttribute("message", msg);
                    request.getRequestDispatcher("erro.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}