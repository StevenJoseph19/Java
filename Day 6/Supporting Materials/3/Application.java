package com.jdbc.m3;

import java.sql.*;

public class Application {

	public static void main(String[] args) throws SQLException  {
//		String connectionUrl = "jdbc:sqlserver://localhost:1434;databaseName=loboticket;integratedSecurity=true;";
		String connectionUrl = "jdbc:sqlserver://127.0.0.1:1434;databaseName=loboticket";
		try (Connection con = DriverManager.getConnection(connectionUrl,"Steve","password");) {

			System.out.println(con.getClass());

		}
	}
}