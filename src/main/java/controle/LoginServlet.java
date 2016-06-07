
package controle;

import dao.UsuarioDAO;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Usuario;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        HttpSession session = request.getSession();
        
        Usuario usuario = new Usuario();
        usuario.setLogin(request.getParameter("login"));
        usuario.setSenha(request.getParameter("senha"));
        String acao = request.getParameter("acao");
        
        try {
            if(acao.equals("login")){
            	if(UsuarioDAO.verificarLogin(usuario)){
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("login.jsp");
                }
            }else if(acao.equals("sair")){
            	session.invalidate();
            }
        } catch (Throwable ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
