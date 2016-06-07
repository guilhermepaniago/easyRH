package dao;

import java.sql.Connection;

import com.jolbox.bonecp.BoneCP;
import com.jolbox.bonecp.BoneCPConfig;

public class DaoUtil {
	
	private static BoneCP conectarPool = null;
	
	public static void startPool() throws Throwable{
		
		Class.forName("com.mysql.jdbc.Driver"); 
		
		BoneCPConfig config = new BoneCPConfig();
		config.setJdbcUrl("jdbc:mysql://localhost:3306/rh"); 
		config.setUsername("root");
		config.setPassword("9145");
		config.setPartitionCount(1);
		config.setMinConnectionsPerPartition(1);
		config.setMaxConnectionsPerPartition(10);
		
		conectarPool = new BoneCP(config);
		
	}
	
	public static void stopPool() {
		conectarPool.shutdown();
	}
	
	public static Connection obterConexaoDoPool() throws Throwable {
		return conectarPool.getConnection();
	}
	
	public static Connection obertConexao() throws Throwable{
		
		return obterConexaoDoPool();
	}

	
	
	
}
