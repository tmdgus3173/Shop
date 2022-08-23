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

	EmployeeDao employeeDao = new EmployeeDao();
	Employee employee = new Employee();
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("employeeId");
	String pw = request.getParameter("employeePass");
	
	employee.setEmployeeId(id);
	employee.setEmployeePw(pw);
	
	Employee loginEmployee = employeeDao.login(employee);
	
	if(loginEmployee == null){
		System.out.println("로그인 실패");
		response.sendRedirect(request.getContextPath() + "/loginForm.jsp?errMsg = login agin");
		return;
	}
	session.setAttribute("user", "Employee");
	session.setAttribute("id", loginEmployee.getEmployeeId());
	System.out.println(session.getAttribute("id"));
	
	session.setAttribute("name", loginEmployee.getEmployeeName());
	System.out.println(session.getAttribute("name"));
	
	session.setAttribute("active", loginEmployee.getActive());
	System.out.println(session.getAttribute("active"));
	
	System.out.println("로그인 성공");
	session.setAttribute("loginEmployee", loginEmployee);
	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>