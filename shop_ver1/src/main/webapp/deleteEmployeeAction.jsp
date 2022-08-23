<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="service.EmployeeService"%>
<%@ page import = "repository.*"%>
<%@ page import = "vo.*"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("EmployeeId");
	String pw = request.getParameter("EmployeePw");
	
	if(id==null || pw==null){
		
		response.sendRedirect(request.getContextPath()+"./loginForm.jsp");
	}
	
	Employee employee = new Employee();
	employee.setEmployeeId(id);
	employee.setEmployeePw(pw);
	
	EmployeeService service = new EmployeeService();
	
	service.removeEmployee(employee);
	
	System.out.println("로그인 성공");
	
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
%>
