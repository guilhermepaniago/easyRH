package controle;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DaoUtil;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.util.JRLoader;

public class ReportServlet extends HttpServlet {
	

protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	try {
			
			 Connection conectar = DaoUtil.obertConexao();
			 
			 ServletContext context = getServletContext();
			 
			 String realPath = context.getRealPath("/WEB-INF/relatorios");
			 JasperReport relatorio = (JasperReport) JRLoader.loadObject(realPath + "/funcionario.jasper");
			 
			 Map paramentros = new HashMap();
			
			 byte[] bytes = JasperRunManager.runReportToPdf(relatorio, paramentros, conectar);
			 
			 resp.setContentType("application/pdf");
			 resp.setContentLength(bytes.length);
			 
			 ServletOutputStream ouputStream = resp.getOutputStream();
			
			 ouputStream.write(bytes, 0, bytes.length);
			 ouputStream.flush();
			 ouputStream.close();
			
			
			
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				resp.getOutputStream().println("Erro: " + e);
			} catch (Throwable e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}



}
