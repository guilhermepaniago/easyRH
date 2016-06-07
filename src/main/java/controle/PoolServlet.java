package controle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import dao.DaoUtil;

public class PoolServlet extends HttpServlet {

	public void init() throws ServletException {
		try {
			DaoUtil.startPool();
		} catch (Throwable e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		DaoUtil.stopPool();
	}

}
