<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<link rel="shortcut icon" href="../resource/img/logo.png">
<title>게시판-삭제</title>

<%
	request.setCharacterEncoding("UTF-8");
	boolean result;
	String nowPage = request.getParameter("nowPage");
	int num = Integer.parseInt(request.getParameter("num"));
	if(request.getParameter("pass") != null) {
		String inPass = request.getParameter("pass"); // 이 페이지에서 입력한 비밀번호
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		if(inPass.equals(dbPass)) {
			result = bMgr.deleteBoard(num);
			if(result) {
				String url = "list.jsp?nowPage=" + nowPage;
				response.sendRedirect(url);
			} else {
			%>
				<script>
					alert("답변이 있어서 삭제할 수 없습니다.");
					history.go(-2);
				</script>
			<%
			}
		} else {
		%>
			<script>
				alert("비밀번호가 맞지 않습니다.");
				history.go(-1);
			</script>
		<%
		}
	} else {
%>

</head>
<body>
	<form name="deleteFrm" method="post" action="delete.jsp">
		<div class="post_container">
	        <div class="post_header">
	          <h1 class="post_title">사용자의 비밀번호를 입력해주세요</h1>
	        </div>
	        <div class="post_info">
				<table align="center">
					<tr>
						<td><label for="pw">비밀번호</label></td>
						<td>
							<input name="pass" type="password" placeholder="비밀번호를 입력하세요." required>
						</td>
					</tr>
				</table>
			</div>
			<div class="btnZip">
				<input type="submit" value="삭제완료">&emsp;
				<input type="reset" value="초기화">&emsp;
				<input type="button" value="뒤로" onclick="history.back()">
			</div>
		</div>
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="nowPage" value="<%=nowPage%>">
	</form>
<%
	}
%>
</body>
</html>