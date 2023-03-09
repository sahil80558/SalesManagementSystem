package com.sales.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sales.service.UpdateProductDetailService;

@WebServlet("/UpdateProductDetailsController")
public class UpdateProductDetailsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String productId=request.getParameter("updateProductCode");
		String productType=request.getParameter("updateProductType");
		String productName= request.getParameter("updateProductName");
		String costPrice= request.getParameter("updateCostPrice");
		String builderPrice= request.getParameter("updatebuilderPrice");
		String customerPrice= request.getParameter("updateCustomerPrice");
		String labourPrice= request.getParameter("updateLabourPrice");
		String desc= request.getParameter("updateDescription");
		String quantity= request.getParameter("updateQuantity");
		UpdateProductDetailService upds=new UpdateProductDetailService();
		String status= upds.updateProductDetails(productId,productType,productName,costPrice,builderPrice,customerPrice,labourPrice,desc,quantity);
		response.getWriter().append(status);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
