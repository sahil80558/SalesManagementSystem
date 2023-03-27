package com.sales.service;
import com.sales.db.ConnectionProvider;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class CreateProductIdService {
	Statement st = ConnectionProvider.getObject().st;
	Connection con=ConnectionProvider.getObject().con;

	public String getProductId(String productType) {
		StringBuilder sb =new StringBuilder();
		int id = 0;
		switch(productType) {
		case "tools":
			sb.append("TLS00");
			break;
		case "paint":
			sb.append("PNT00");
			break;
		case "hardware":
			sb.append("HDW00");
			break;
		case "pipe":
			sb.append("PIP00");
			break;
		case "sanitary":
			sb.append("STR00");
			break;
		case "plumbing":
			sb.append("PLM00");
			break;
		case "bathroom":
			sb.append("BTH00");
			break;
		case "electric":
			sb.append("ELC00");
			break;
		case "locks":
			sb.append("LCK00");
			break;
		case "woods":
			sb.append("WDS00");
			break;
		}
		try {
			String q = "select count(productId) from "+productType+"";
			ResultSet rs = st.executeQuery(q);
			if (rs.next()) {
				id = rs.getInt(1);
				id = id + 1;
			} else {
				id= 1;
			}
		} catch (Exception e) {
			System.out.println(e);
			return ""+e;
		}
		sb.append(String.valueOf(id));
		return new String(sb);
	}
}
