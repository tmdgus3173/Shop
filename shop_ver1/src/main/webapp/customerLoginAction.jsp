<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	if(session.getAttribute("customerId") != null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp?errorMsg=already");
		//다이렉트
		return;
	}
	
	CustomerDao customerDao = new CustomerDao();
	Customer customer = new Customer();
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("customerId");
	String pw = request.getParameter("customerPass");
	
	customer.setCustomerId(id);
	customer.setCustomerPass(pw);
	
	Customer loginCustomer = customerDao.login(customer);
	
	if(loginCustomer == null){
		System.out.println("로그인 실패");
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errMsg=login agin please");
		return;
	}
	session.setAttribute("user", "Customer");
	session.setAttribute("id", id);
	session.setAttribute("name", loginCustomer.getCustomerName());
	
	System.out.println("로그인 성공");
	session.setAttribute("loginCustomer", loginCustomer);
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>