package DAO;

import java.sql.Connection;

public class ClienteDAO {
	
	private Connection connection;
	DBConnection dbConnection = new DBConnection();

	public ClienteDAO() {
		this.connection = dbConnection.getConnection();
		
		
	}

}
