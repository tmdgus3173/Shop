<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "service.EmployeeService"%>
<%@ page import="java.sql.*" %>
<%@ page import = "repository.*" %>
<%@ page import = "vo.*" %>
<%
	EmployeeDao customerDao = new EmployeeDao();
	Employee employee = new Employee();
	request.setCharacterEncoding("utf-8"); //인코딩
	
	String id = request.getParameter("EmployeeId"); //아이디값 넣어주기
	String pw = request.getParameter("EmployeePass"); //비밀번호값 넣어주기
	String name = request.getParameter("EmployeeName"); //이름값 넣어주기
	
	//값 확인
	System.out.println(id);
	System.out.println(pw);
	System.out.println(name);
	
	//employee에 값넣어주기
	employee.setEmployeeId(id);
	employee.setEmployeePw(pw);
	employee.setEmployeeName(name);
	
	EmployeeService service = new EmployeeService();
	
	//service.insertEmployee(employee)로 넘어가유
	service.insertEmployee(employee);
	
	//위 모두 다 성공하면 loginForm.jsp로 넘어감요
	response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
	
%>