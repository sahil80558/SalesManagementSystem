package com.sales.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sales.service.GetProductDetailsService;

@WebServlet("/GetProductDetailsController")
public class GetProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productName = request.getParameter("productName");
		String productType = request.getParameter("productType");
		String productId = request.getParameter("productId");
		GetProductDetailsService gpd = new GetProductDetailsService();
		
		if(productName != null && productId!=null) {
			ArrayList<String> al = new ArrayList<>();
			al=gpd.getProductAllDetails(productId, productName, productType);
			Gson json=new Gson();
			String jsondata=json.toJson(al);
			response.getWriter().append(jsondata);
		}
		else if (productName != null) {
			ArrayList<String> al = new ArrayList<>();
			al = gpd.getProductId(productName, productType);
			if(al.size()==0)response.getWriter().append("Data Not Found");
			Gson json=new Gson();
			String jsondata=json.toJson(al);
			response.getWriter().append(jsondata);
		}
		else if(productId!=null) {
			ArrayList<String> al = new ArrayList<>();
			al=gpd.getProductName(productId,productType);
			if(al.size()==0)response.getWriter().append("Data Not Found");
			Gson json=new Gson();
			String jsondata=json.toJson(al);
			response.getWriter().append(jsondata);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
