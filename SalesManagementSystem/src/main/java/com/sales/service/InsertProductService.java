package com.sales.service;
import java.sql.Connection;
import java.sql.Statement;
import com.sales.db.*;

public class InsertProductService {
	Statement st=ConnectionProvider.getObject().st;
	Connection con=ConnectionProvider.getObject().con;
	public int insertProduct(String ... data) {
		int status=0;
		String product_type=data[0];
		String product_id=data[1];
		String product_name=data[2];
		String quantity=data[3];
		String cost_price=data[4];
		String customer_price=data[5];
		String builder_price=data[6];
		String worker_price=data[7];
		String desc=data[8];
		
		try {
			String q="insert into "+product_type+" values('"+product_id+"','"+product_type+"','"+product_name+"','"+cost_price+"','"+customer_price+"','"+builder_price+"','"+worker_price+"','"+desc+"','"+quantity+"')";
			st.executeUpdate(q);
			status=1;
		}catch(Exception e) {
			System.out.println(e);
			return -1;
		}
		return status;
	}
	
	
}
