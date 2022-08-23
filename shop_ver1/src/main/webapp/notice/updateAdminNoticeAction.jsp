<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.Notice"%>
<%@ page import="service.NoticeService"%>
<%
	request.setCharacterEncoding("utf-8");

	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
	
	System.out.println(noticeNo + " <-- noticeNo");
	
	Notice notice = new Notice();
	NoticeService noticeService = new NoticeService();
	
	notice.setNoticeNo(noticeNo);
	
	noticeService.adminDeleteNotice(notice);
	
	System.out.println("로그인성공");
	
	response.sendRedirect(request.getContextPath()+"/notice/adminNoticeList.jsp");
%>