package com.sales.service;

import java.sql.Statement;

import com.sales.db.ConnectionProvider;

public class DeleteProductService {
	Statement st=ConnectionProvider.getObject().st;
	public String deleteProduct(String productType,String productId) {
		String status="";
		try {
			String q="delete from "+productType+" where productId='"+productId+"'";
			st.executeUpdate(q);
			status="Succesfully Deleted";
		}catch(Exception e) {
			System.out.println(e);
			status=""+e;
		}
		return status;
	}
}
