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
		ArrayList<String> al = new ArrayList<>();
		String recievedProductName="";
		String recievedProductId="";
		
		if(productName != null && productId!=null) {
			al=gpd.getProductAllDetails(productId, productName, productType);
			Gson json=new Gson();
			String jsondata=json.toJson(al);
			response.getWriter().append(jsondata);
		}
		else if (productName != null) {
			recievedProductId = gpd.getProductId(productName, productType);
			if(recievedProductId.equals(""))response.getWriter().append("Data Not Found");
			response.getWriter().append(recievedProductId);
		}
		else if(productId!=null) {
			recievedProductName=gpd.getProductName(productId,productType);
			if(recievedProductName.equals(""))response.getWriter().append("Data Not Found");
			response.getWriter().append(recievedProductName);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
