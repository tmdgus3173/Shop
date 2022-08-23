<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
   <!-- id ck form -->
   <form action="<%=request.getContextPath()%>/idCheckAction.jsp" method="post">
      <div>
         ID 체크
         <input type="text" name="ckid"><input type="hidden" name="c" id="c" value="Employee">
         <button type="submit">아이디중복검사</button>
      </div>
   </form>
   
   <!-- 고객가입 form -->
   <%
      String ckId = "";
      if(request.getParameter("ckId") != null) {
         ckId = request.getParameter("ckId");
      }
   %>
<div style="margin-top:20px">
   <form action="<%=request.getContextPath()%>/insertEmployeeAction.jsp" method="post">
      <table border="1">
         <tr>
            <td>EmployeeId</td>
            <td>
               <input type="text" name="EmployeeId" id="EmployeeId" 
                  readonly="readonly" value="<%=ckId%>"> <!-- ckId값이 중복되지 않으면 id값에 바로 넣어표시해주기 -->
            </td>
         </tr>
         <tr>
         	<td>EmployeePass</td>
         	<td><input type="password" name="EmployeePass" id="EmployeePass"></td>
         </tr>
         <tr>
         	<td>EmployeeName</td>
         	<td><input type="text" name="EmployeeName" id="EmployeeName"></td>
         </tr>
      </table>
        <button type="submit" class="btn btn-success">추가</button>
		<button type="reset" class="btn btn-danger">초기화</button>
   </form>
</div>
</div>
</body>
</html>