package com.sales.service;

import com.sales.db.*;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class SearchByNameService {
	Statement st = ConnectionProvider.getObject().st;
	ArrayList<String> al = new ArrayList<String>();

	public ArrayList<String> getSearchResults(String searchName, String productType, String searchId) {
		if (searchName != null) {
			try {
				String q = "select productName from " + productType + " where productName LIKE '%" + searchName + "%'";
				ResultSet rs = st.executeQuery(q);
				while (rs.next()) {
					al.add(rs.getString(1));
				}
			} catch (Exception e) {
				System.out.println(e);
				al.add("Exception");
			}
		} else {
			try {
				String q = "select productId from " + productType + " where productId LIKE '%" + searchId + "%'";
				ResultSet rs = st.executeQuery(q);
				while (rs.next()) {
					al.add(rs.getString(1));
				}
			} catch (Exception e) {
				System.out.println(e);
				al.add("Exception");
			}
		}
		return al;
	}
}
