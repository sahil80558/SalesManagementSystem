package com.sales.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.User;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.sales.service.CreateBillService;

@WebServlet("/CreateBillController")
public class CreateBillController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at:9000 ");
		CreateBillService cbs=new CreateBillService();
		ArrayList<String> billData=new ArrayList<>();
		
		Gson gson=new GsonBuilder().create();
		String[][] items = gson.fromJson(request.getParameter("billItems"), String[][].class);
		
		String status=cbs.createBill(items,request.getParameter("customerName"),request.getParameter("customerAddress"),request.getParameter("customerNumber"),request.getParameter("deliveryAddress"),request.getParameter("billTotal"),request.getParameter("paymentMode"),request.getParameter("billNumber"),request.getParameter("date"),request.getParameter("time"),request.getParameter("gst"));
		response.getWriter().append(status);
	}

}
