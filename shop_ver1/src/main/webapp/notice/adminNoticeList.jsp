<%@page import="java.util.ArrayList"%>
<%@page import="vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="service.NoticeService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 권한이 Y인 관리자만 들어올 수 있음
	System.out.println("!!!!adminNoticeList!!!!");
	if(session.getAttribute("login"+session.getAttribute("user")) == null){
		response.sendRedirect(request.getContextPath()+"/loginForm.jsp");
		return;
	}

	if (!(session.getAttribute("user").equals("Employee")&&session.getAttribute("login"+session.getAttribute("user")) != null)) {
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	}


	int rowPerPage = 5; //한페이지당 보여줄 행 수 
	int currentPage = 1; //처음 시작할 현재 페이지
	int lastPage = 0;
	
	if(request.getParameter("currentPage") != null){ 
		//currentPage가 null이 아니면
		//currentPage값을 넣어준다.
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	
	NoticeService noticeService = new NoticeService();
	List<Notice>list = new ArrayList<Notice>();
	list = noticeService.getNoticeList(rowPerPage, currentPage); //list보여주기
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="margin-bottom : 40px">
		<a href="<%=request.getContextPath()%>/index.jsp">홈으로</a>
		<a href="<%=request.getContextPath()%>/EmployeeList.jsp">사원관리</a>
		<a href="<%=request.getContextPath()%>/admin/adminGoodsList.jsp">상품관리</a><!-- 상품목록/등록/수정/삭제(주문이 없는경우) -->
		<a href="<%=request.getContextPath()%>/orders/adminOrderList.jsp">주문관리</a><!-- 주문목록/수정 -->
		<a href="<%=request.getContextPath()%>/customer/adminCustomerList.jsp">고객관리</a><!-- 고객목록/강제탈퇴/비밀번호수정(전달구현x) -->
		<a href="<%=request.getContextPath()%>/notice/adminNoticeList.jsp">공지관리</a>
	</div>
	<div>
		<form action="<%=request.getContextPath()%>/notice/addNotices.jsp">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>ID</th>
					<th>수정날짜</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<%
					for(Notice n : list){
				%>
				<tr>
					<td><%=n.getNoticeNo()%></td>
					<td><a href="<%=request.getContextPath()%>/notice/adminNoticeOne.jsp?noticeNo=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
					<td><%=n.getNoticeContent()%></td>
					<td><%=n.getNoticeId()%></td>
					<td><%=n.getUpdateDate()%></td>
					<td><%=n.getCreateDate()%></td>
				</tr>
				<%
					}	
				%>
			</tbody>
		</table>
		<%
			lastPage = noticeService.getlastPage(rowPerPage);
			System.out.println("adminNoticeList.jsp lastPage : "+lastPage);
			System.out.println("adminNoticeList.jsp currentPage : "+currentPage);
			System.out.println("!!!!adminNoticeList!!!!");
			
			if(currentPage > 1){ //현재페이지가 1보다 클때
				System.out.println("이전페이지로");
		%>
			<a href = "<%=request.getContextPath()%>/notice/adminNoticeList.jsp?currentPage=<%=currentPage-1%>">이전</a>
		<%
			}
			if(currentPage < lastPage){
				System.out.println("다음페이지로");
		%>
			<a href = "<%=request.getContextPath()%>/notice/adminNoticeList.jsp?currentPage=<%=currentPage+1%>">다음</a>
		<%
			}
		%>
			<button type="submit">공지등록</button>
		</form>
		
	</div>
</body>
</html>