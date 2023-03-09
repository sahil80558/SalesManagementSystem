package com.sales.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.sales.db.*;

public class GetProductDetailsService {
	Statement st = ConnectionProvider.getObject().st;
	Connection con = ConnectionProvider.getObject().con;
	ArrayList<String> al = new ArrayList<>();

	public String getProductId(String productName, String productType) {
		String productId = "";
		try {
			String q = "select productId from " + productType + " where productName='" + productName + "'";
			ResultSet rs = st.executeQuery(q);
			if (rs.next())
				productId = rs.getString("productId");
		} catch (Exception e) {
			productId="Exception:"+e;
			System.out.println(e);
		}
		return productId;
	}

	public String getProductName(String productId, String productType) {
		String productName = "";
		try {
			String q = "select productName from " + productType + " where productId='" + productId + "'";
			ResultSet rs = st.executeQuery(q);
			if (rs.next())
				productName = rs.getString("productName");
		} catch (Exception e) {
			productName="Exception:"+e;
			System.out.println(e);
		}
		return productName;
	}
	
	public ArrayList<String> getProductAllDetails(String productId,String productName,String productType){
		try {
			String q = "select * from " + productType + " where productId='" + productId + "'";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				al.add(rs.getString("productId"));
				al.add(rs.getString("productGroup"));
				al.add(rs.getString("productName"));
				al.add(rs.getString("costPrice"));
				al.add(rs.getString("customerPrice"));
				al.add(rs.getString("builderPrice"));
				al.add(rs.getString("labourPrice"));
				al.add(rs.getString("descr"));
				al.add(rs.getString("availableQuantity"));
			}
		} catch (Exception e) {
			productName="Exception:"+e;
			System.out.println(e);
		}
		return al;
		
	}
}
