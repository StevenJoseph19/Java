package com.godrej.simplewebapp.conn;

import com.microsoft.sqlserver.jdbc.SQLServerDriver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SQLServerConnUtils {

	// Connect to SQLServer
	// (Using JDBC Driver of JTDS library)
	public static Connection getSQLServerConnection() //
			throws SQLException, ClassNotFoundException {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		
		// Note: Change the connection parameters accordingly.
		String hostName = "127.0.0.1";
		String database = "productmgmt";
		String url = "jdbc:sqlserver://";
		String userName = "Steve";
		String password = "password";

		return getSQLServerConnection(hostName, url, database, userName, password);
	}

	// Connect to SQLServer, using JTDS library
	private static Connection getSQLServerConnection(String hostName, String url, String database, String userName,
			String password) throws ClassNotFoundException, SQLException {

		// Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		String connectionURL = "jdbc:sqlserver://" + hostName + ":1434" + ";databaseName=" + database;

		Connection conn = DriverManager.getConnection(connectionURL, userName, password);
//		System.out.println("Conn..." + conn);
		return conn;
	}

}