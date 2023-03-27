package com.sales.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sales.service.CreateBillAddProductService;


@WebServlet("/CreateBillAddProductController")
public class CreateBillAddProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("productCode");
		String productType=request.getParameter("cmbProductGroup");
		CreateBillAddProductService cbaps=new CreateBillAddProductService();
		ArrayList<String> al=new ArrayList<>();
		al=cbaps.getProductDetails(productType,productId);
		Gson obj=new Gson();
		String data=obj.toJson(al);
		response.getWriter().append(data);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
