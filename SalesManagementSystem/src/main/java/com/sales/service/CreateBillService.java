package com.sales.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import com.sales.db.ConnectionProvider;

public class CreateBillService {
	Statement st=ConnectionProvider.getObject().st;
	Connection con=ConnectionProvider.getObject().con;
	public String createBill(String items[][],String ... billDetails) {
		String status="";
		String customerName=billDetails[0];
		String customerAddress=billDetails[1];
		String customerNumber=billDetails[2];
		String deliveryAddress=billDetails[3];
		String billTotal=billDetails[4];
		String paymentMode=billDetails[5];
		String billNumber=billDetails[6];
		String date=billDetails[7];
		String time=billDetails[8];
		String gst=billDetails[9];
		
		try {
			PreparedStatement ps=con.prepareStatement("insert into sellbills values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1,billNumber);
			ps.setString(2, date);
			ps.setString(3, time);
			ps.setString(4, customerName);
			ps.setString(5, customerNumber);
			ps.setString(6, gst);
			ps.setString(7, paymentMode);
			ps.setString(8, deliveryAddress);
			ps.setString(9, billTotal);
			ps.setString(10, customerAddress);
			
			PreparedStatement ps2=con.prepareStatement("insert into items values(?,?)");
			for(String s1[]:items) {
				for(String s2:s1) {
					
				}
			}
			ps.executeUpdate();
			status="Successfully Added";
		}catch(SQLException e) {
			status=""+e;
			System.out.println(e);
		}
		return status;
	}
}
