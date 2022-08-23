<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="service.CustomerService"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%
	CustomerService customerService = new CustomerService();
	Customer customer = new Customer();
	
	request.setCharacterEncoding("utf-8");
	String newPw = request.getParameter("newPw");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	//디버깅
	
	customerService.UpdateCustomerPw(newPw, id, pw);
	
	response.sendRedirect("/shop/index.jsp");
%>