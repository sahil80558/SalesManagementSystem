package com.sales.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sales.db.ConnectionProvider;

public class ShowAllProductService {
	Statement st=ConnectionProvider.getObject().st;
	Connection con=ConnectionProvider.getObject().con;
	ArrayList<String> al=new ArrayList<>();
	
	public ArrayList<String> getAllProducts(String productType){
		try {
			String q="select * from "+productType+"";
			ResultSet rs=st.executeQuery(q);
			while(rs.next()) {
				al.add(rs.getString(1));
				al.add(rs.getString(2));
				al.add(rs.getString(3));
				al.add(rs.getString(4));
				al.add(rs.getString(5));
				al.add(rs.getString(6));
				al.add(rs.getString(7));
				al.add(rs.getString(8));
				al.add(rs.getString(9));
			}
			return al;
		}catch(Exception e) {
			System.out.println(e);
			al.add(""+e);
		}
		return al;
	} 
}
