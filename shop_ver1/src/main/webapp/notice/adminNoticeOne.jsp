<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.NoticeService"%>
<%@ page import="repository.*"%>
<%@ page import="vo.Notice"%>
<%@ page import="java.util.*"%>
<%
	System.out.println("!!!!adminNoticeOne!!!!");
	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
	
	int noticeNo  =Integer.parseInt(request.getParameter("noticeNo"));
	System.out.println(noticeNo + " <-- noticeNo");
	
	NoticeService noticeService = new NoticeService();
	Notice notice = null;
	notice = noticeService.getNoticeOne(noticeNo);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div><a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">홈으로</a></div>
	<div>
		<form>
			<table border = "1">
				<tr>
					<th>공지번호</th>
					<td><%=notice.getNoticeNo()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=notice.getNoticeId()%></td>
				</tr>
				<tr>
					<th>공지제목</th>
					<td><%=notice.getNoticeTitle()%></td>
				</tr>
				<tr>
					<th>공지내용</th>
					<td><%=notice.getNoticeContent()%></td>
				</tr>
				<tr>
					<th>공지마지막수정날짜</th>
					<td><%=notice.getUpdateDate()%></td>
				</tr>
				<tr>
					<th>공지등록날짜</th>
					<td><%=notice.getCreateDate()%></td>
				</tr>				
				<tr>
					<th>수정</th>
					<th><a href="<%=request.getContextPath()%>/notice/updateAdminNoticeForm.jsp?noticeNo=<%=notice.getNoticeNo()%>">수정</a></th>
				</tr>					
				<tr>
					<th>삭제</th>
					<th><a href="<%=request.getContextPath()%>/notice/updateAdminNoticeAction.jsp?noticeNo=<%=notice.getNoticeNo()%>">삭제</a></th>
				</tr>						
			</table>
		</form>
	</div>
</body>
</html>