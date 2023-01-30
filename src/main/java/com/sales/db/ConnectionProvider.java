package com.sales.db;
import java.sql.*;
public class ConnectionProvider {
	public Connection con;
	static ConnectionProvider dBConnector=null;
	public Statement st;
	private ConnectionProvider() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql:///flight_MS?useSSL=false&allowPublicKeyRetrieval=true","root","S@hil8055");
			Statement st=con.createStatement();
			this.st=st;
			this.con=con;
		}catch(Exception e){
			
		}
	}
	static ConnectionProvider getObject(){
		if(dBConnector==null) {
			dBConnector=new ConnectionProvider();
		}
		return dBConnector;
	}
}
