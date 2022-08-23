<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="repository.*"%>
<%@ page import="vo.*"%>
<%@ page import="service.NoticeService"%>
<%
	NoticeService noticeService = new NoticeService();
	Notice notice = new Notice();
	
	request.setCharacterEncoding("utf-8");
	
	String noticeTitle = request.getParameter("noticeTitle");
	String noticeContent = request.getParameter("noticeContent");
	String noticeId = request.getParameter("noticeId");
	
	System.out.println(noticeTitle + " <-- noticeTitle");
	System.out.println(noticeContent + " <-- noticeContent");
	System.out.println(noticeId + " <-- noticeId");
	
	notice.setNoticeTitle(noticeTitle);
	notice.setNoticeContent(noticeContent);
	notice.setNoticeId(noticeId);
	
	noticeService.addNotice(notice);
	
	response.sendRedirect("./adminNoticeList.jsp");
%>
