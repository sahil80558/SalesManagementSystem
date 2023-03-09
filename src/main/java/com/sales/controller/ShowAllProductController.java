package com.sales.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sales.service.ShowAllProductService;


@WebServlet("/ShowAllProductController")
public class ShowAllProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String productType = request.getParameter("productType");
//		ShowAllProductService slp = new ShowAllProductService();
//		ArrayList<String> al = new ArrayList<>();
//		al = slp.getAllProducts(productType);
//		Gson gs = new Gson();
//		response.getWriter().append(gs.toJson(al));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
