package com.sales.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sales.service.DeleteProductService;

@WebServlet("/DeleteProductController")
public class DeleteProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productType=request.getParameter("updateProductType");
		String productId=request.getParameter("updateProductCode");
		DeleteProductService dps=new DeleteProductService();
		String status=dps.deleteProduct(productType,productId);
		response.getWriter().append(status);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
