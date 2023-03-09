package com.sales.controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sales.service.InsertProductService;

@WebServlet("/InsertProductController")
public class InsertProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String product_type=request.getParameter("cmbProductGroup");
		String product_id=request.getParameter("productCode");
		String product_name=request.getParameter("productName");
		String quantity=request.getParameter("quantity");
		String cost_price=request.getParameter("costPrice");
		String customer_price=request.getParameter("customerPrice");
		String builder_price=request.getParameter("builderPrice");
		String worker_price=request.getParameter("LabourPrice");
		String desc=request.getParameter("description");

		InsertProductService ips=new InsertProductService();
		int status=ips.insertProduct(product_type,product_id,product_name,quantity,cost_price,customer_price,builder_price,worker_price,desc);
		if(status==1)
			response.getWriter().write("Successfully Added");
		else if(status==-1)
			response.getWriter().write("Database Error");
		else
			response.getWriter().write("Error");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
