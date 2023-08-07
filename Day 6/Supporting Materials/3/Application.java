package com.jdbc.m3;

import java.sql.*;

public class Application {

	public static void main(String[] args) throws SQLException  {
		String connectionUrl = "jdbc:sqlserver://localhost:1434;databaseName=loboticket;integratedSecurity=true;";

		try (Connection con = DriverManager.getConnection(connectionUrl);) {

			System.out.println(con.getClass());

		}
	}
}