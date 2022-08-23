<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="service.CustomerService"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	if(session.getAttribute("customerId") != null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp?errorMsg=already");
		//다이렉트
		return;
	}

	System.out.println("adminCustomerPwUpdateAction.jsp");
	CustomerService customerService = new CustomerService();
	Customer customer = new Customer();
	
	request.setCharacterEncoding("utf-8");
	String customerId = request.getParameter("customerId");
	System.out.println(customerId + " <-- customerId");
	//디버깅
	
	customerService.adminUpdateCustomerPw(customerId);
	
	System.out.println("로그인 성공");
	
	response.sendRedirect(request.getContextPath()+"/customer/adminCustomerList.jsp");
%>