package controle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import dao.JpaUtil;

public class JpaServlet extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {
		JpaUtil.start();		
	}

}
