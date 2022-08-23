<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp"><h1>NoticeList</h1></a>
	</div>
	<div>
	<h1> 공지 등록 </h1>
	<form action="<%=request.getContextPath()%>/notice/addNoticesAction.jsp" method="post">
		<table border="1">
			<tr>
				<td>공지제목</td>
				<td>
					<input type="text" name="noticeTitle" id="noticeTitle">
				</td>
			</tr>	
			<tr>
				<td>공지내용</td>
				<td>
					<textarea cols="20" rows="20" name="noticeContent" id="noticeContent"></textarea>
					<input type="hidden" id="noticeId" name="noticeId" value="<%=session.getAttribute("id")%>">
				</td>
			</tr>

		</table>
        <button type="submit" class="btn btn-success">공지등록</button>
		<button type="reset" class="btn btn-danger">글전체초기화</button>
	</form>
	</div>
</body>
</html>