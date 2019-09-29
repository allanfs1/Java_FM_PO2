/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Frame;

import java.awt.Container;
import javax.swing.JFrame;

/**
 *
 * @author Allan
 */
public class Frame_JP extends JFrame {
    
    private Container cn;
    private int largura = 750;
    private int altura = 850;
    
    
    
    Frame_JP(){
       this.setDefaultCloseOperation(JFrame. EXIT_ON_CLOSE); 
       this.setSize(altura,largura);
       this.setTitle("Formulário");
       cn = getContentPane();
       Painel1 pn = new Painel1();
       cn.add(pn); 
       //this.setLayout(null);
       this.setVisible(true);
            
          
    }
    
    
    
    
  public static void main(String[] args) {
         
        Frame_JP jp = new Frame_JP();
      
         
         
   }
    
    
    
    
}
