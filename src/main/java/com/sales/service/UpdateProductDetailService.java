package com.sales.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import com.sales.db.ConnectionProvider;

public class UpdateProductDetailService {
	Statement st=ConnectionProvider.getObject().st;
	Connection con=ConnectionProvider.getObject().con;
	
	public String updateProductDetails(String... data) {
		String productId=data[0];
		String productType=data[1];
		String productName= data[2];
		String costPrice= data[3];
		String builderPrice= data[4];
		String customerPrice= data[5];
		String labourPrice= data[6];
		String desc= data[7];
		String quantity= data[8];
		String status="";
		try {
			String query="update "+productType+" set productName=?,costPrice=?,customerPrice=?,builderPrice=?,labourPrice=?,descr=?,availableQuantity=? where productId=?  ";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,productName);
			ps.setString(2,costPrice);
			ps.setString(3,customerPrice);
			ps.setString(4,builderPrice);
			ps.setString(5,labourPrice);
			ps.setString(6,desc);
			ps.setString(7,quantity);
			ps.setString(8,productId);
			ps.executeUpdate();
			status="Successfully Updated";
		}catch(Exception e) {
			System.out.println(e);
			return ""+e;
		}
		return status;
	}
}
