package DB;



import Frame.Painel1;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Tela.Pessoa;
import Tela.rg;
import javax.swing.JOptionPane;

public class ConexaoBancoDeDados{
      
   
    
    private Connection conexao;
    private final String URLDB = "jdbc:mysql://localhost:3306/tx";
    private final String usuario = "root";
    private final String senha = "root";

    public ConexaoBancoDeDados() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexao = DriverManager.getConnection(URLDB, usuario, senha);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

    public void inserir(Pessoa ps){
        Inserir th = new Inserir();
        Statement inserir;
        PreparedStatement stmt = null;
        Painel1 pn = new Painel1();           
        try {
            //inserir = conexao.createStatement();
            stmt = conexao.prepareStatement("INSERT INTO tb_pessoas(nome,dt_data,rg,cpf,natura_ld,na_mae,na_pai) VALUES(?,?,?,?,?,?,?)");
            stmt.setString(1,ps.getNome());
            stmt.setString(2,ps.getDataNasc());
            stmt.setDouble(3,ps.getRg().getNumero());
            stmt.setDouble(4,ps.getCpf());
            stmt.setString(5,"SP");
            stmt.setString(6,ps.getNomeMae());
            stmt.setString(7,ps.getNomePai());
            
            stmt.executeUpdate();
   
            JOptionPane.showMessageDialog(null,"Dados inseridos com sucesso!");
            

            
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Erro no Insert no Banco!"+ex);
        }
    }

    public void update() {
        Statement comando;

        try {
            comando = conexao.createStatement();
            comando.execute("UPDATE estado SET estadoNome ='Rio de Janeiro' WHERE idEstado = 2");
        } catch (SQLException ex) {
            
        }
    }
    public void delete() {
        Statement comando;

        try {
            comando = conexao.createStatement();
            comando.execute("delete from estado WHERE idEstado = 3");
        } catch (SQLException ex) {
           
        }
    }
    public void selecionar() {
        try {
            Statement comando;
            comando = conexao.createStatement();
            ResultSet res = comando.executeQuery("SELECT * FROM estado");

            while (res.next()) {
                System.out.println(res.getString("estadoNome"));
            }
        } catch (SQLException ex) {
          
        }
    }
    
    public void prepareSelect(){
        try {
            PreparedStatement psSelect= this.conexao.prepareStatement("Select * from pessoas");
           // psSelect.setString(1, "1");
            ResultSet res = psSelect.executeQuery();
            
            while (res.next()) {
                System.out.println(res.getString("Nome"));
            }
            
        } catch (SQLException ex) {
            
        }
        
    }
    
    
 
    public static void main(String[] args) {
        ConexaoBancoDeDados conexao = new ConexaoBancoDeDados();
    
        //conexao.prepareSelect();
      
        
    }

    
}