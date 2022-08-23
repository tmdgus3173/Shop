<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.SignService"%>
<%@ page import = "repository.*"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "vo.*"%>
<%
	SignDao signDao = new SignDao();

	request.setCharacterEncoding("utf-8");
	
	
	String ckId = request.getParameter("ckid");
	
		String N = request.getParameter("c");
	
	SignService service = new SignService();
	if(service.idCheck(ckId) == false){ //고객, 관리자 혹은 탈되한. 기존에 있던 아이디 값이라면
	
	System.out.println("사용불가능");
		if(N.equals("Customer")){ // 그 중에서도 N에 들어있는 값이 Customer이면
			response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?errorMsg=ID not used");
		}else{
			response.sendRedirect(request.getContextPath()+"/addEmployee.jsp?errorMsg=ID not used");
		}
	
	}else{ //고객, 관리자 혹은 탈되한. 기존에 있던 아이디 값이 아니라면

	
	service.idCheck(ckId);
		if(N.equals("Customer")){ // 그 중에서도 N에 들어있는 값이 Customer이면
			System.out.println("사용가능");
			response.sendRedirect(request.getContextPath()+"/addCustomer.jsp?ckId="+ckId);
		}else{
			response.sendRedirect(request.getContextPath()+"/addEmployee.jsp?ckId="+ckId);
			}
		}
%>