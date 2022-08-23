<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="service.CustomerService"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("CustomerId");
	String pw = request.getParameter("CustomerPw");
	
	if(id==null || pw==null){
		System.out.println("id, pw 값이 null");
		response.sendRedirect(request.getContextPath()+"./loginForm.jsp");
	}
	
	Customer customer = new Customer();
	customer.setCustomerId(id);
	customer.setCustomerPass(pw);
	
	CustomerService service = new CustomerService();
	
	service.removeCustomer(customer);
	
	System.out.println("로그인 성공");
	
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
%>
