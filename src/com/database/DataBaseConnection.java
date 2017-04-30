package com.database;

import java.sql.*;

public class DataBaseConnection implements DataBaseConfig{

	
	public static Connection connect() throws ClassNotFoundException, SQLException{
		Class.forName(DRIVER);
		Connection con=DriverManager.getConnection(ConnectionURL,USERNAME,PASSWORD);
		return con;
	}
	
	/*
	public static void main(String[] args) {
		try {
			Connection cn=connect();
			System.out.println(!cn.isClosed());
		                                                     //testing Connection
		} catch (Exception e) {
		
			e.toString();
		}
	}*/

}
