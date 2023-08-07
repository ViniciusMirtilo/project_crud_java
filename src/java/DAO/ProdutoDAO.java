package DAO;

import model.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Produto;
import util.FabricaConexao;


public class ProdutoDAO {
    
    public void cadastrar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();
        PreparedStatement comando = con.prepareStatement("insert into produtos (nome, descricao, preco, ingredientes, nivel, categoria, tempo, tipo, peso, avaliacao) values (?,?,?,?,?,?,?,?,?,?)");
        comando.setString(1, prod.getNome());
        comando.setString(2, prod.getDescricao());
        comando.setDouble(3, prod.getPreco());
        comando.setString(4, prod.getIngredientes());
        comando.setString(5, prod.getNivel());
        comando.setString(6, prod.getCategoria());
        comando.setString(7, prod.getTempo());
        comando.setString(8, prod.getTipo());
        comando.setString(9, prod.getPeso());
        comando.setDouble(10, prod.getAvaliacao());
        comando.execute();
        con.close();
    }
    
    public void deletar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();
        PreparedStatement comando = con.prepareStatement("delete from produtos where id = ?");
        comando.setInt(1, prod.getId());
        comando.execute();
        con.close();
    }
    
    public void atualizar(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();
        PreparedStatement comando = con.prepareStatement("update produtos set nome = ?, descricao = ?, preco = ?, ingredientes = ?, nivel = ?, categoria = ?, tempo = ?, tipo = ?, peso = ?, avaliacao = ? where id = ?");
        comando.setString(1, prod.getNome());
        comando.setString(2, prod.getDescricao());
        comando.setDouble(3, prod.getPreco());
        comando.setString(4, prod.getIngredientes());
        comando.setString(5, prod.getNivel());
        comando.setString(6, prod.getCategoria());
        comando.setString(7, prod.getTempo());
        comando.setString(8, prod.getTipo());
        comando.setString(9, prod.getPeso());
        comando.setDouble(10, prod.getAvaliacao());
        comando.setInt(11, prod.getId());
        comando.execute();
        con.close();
    }    
    
    public Produto consultarById(Produto prod) throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from produtos where id = ?");
        comando.setInt(1, prod.getId());
        ResultSet rs = comando.executeQuery();
        Produto p = new Produto();
        if (rs.next()) {
            p.setId(rs.getInt("id"));
            p.setNome(rs.getString("nome"));
            p.setDescricao(rs.getString("descricao"));
            p.setPreco(rs.getDouble("preco"));
            p.setIngredientes(rs.getString("ingredientes"));
            p.setNivel(rs.getString("nivel"));
            p.setCategoria(rs.getString("categoria"));
            p.setTempo(rs.getString("tempo"));
            p.setTipo(rs.getString("tipo"));          
            p.setPeso(rs.getString("peso"));
            p.setAvaliacao(rs.getDouble("avaliacao")); 
        }       
        con.close();
        return p;
    }
    
    public List<Produto> consultarTodos() throws ClassNotFoundException, SQLException {
        Connection con = FabricaConexao.getConexao();
        PreparedStatement comando = con.prepareStatement("select * from produtos");        
        ResultSet rs = comando.executeQuery();        
        List<Produto> lprod = new ArrayList<Produto>();
        int cont = 0;
        while(rs.next()){
            Produto prod = new Produto();
            prod.setId(rs.getInt("id"));           
            prod.setNome(rs.getString("nome"));
            prod.setDescricao(rs.getString("descricao"));
            prod.setPreco(rs.getDouble("preco"));
            prod.setIngredientes(rs.getString("ingredientes"));
            prod.setNivel(rs.getString("nivel"));
            prod.setCategoria(rs.getString("categoria"));
            prod.setTempo(rs.getString("tempo"));
            prod.setTipo(rs.getString("tipo"));          
            prod.setPeso(rs.getString("peso"));
            prod.setAvaliacao(rs.getDouble("avaliacao")); 
            lprod.add(prod);
            cont++;
        }
        System.out.println("Cont..: " + cont);
        con.close();
        return lprod;
    }    
}