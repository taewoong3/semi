<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.BoardBean" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	BoardBean bean = (BoardBean)session.getAttribute("bean");
	String subject = bean.getSubject();
	String name = bean.getName();
	String content = bean.getContent();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../resource/img/logo.png">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<title>게시판-수정</title>
</head>
<body>								
	<form method="post" name="updateFrm" action="boardUpdate">
		<div class="post_container">
			<div class="post_header">
				<h1 class="post_title">수 정 하 기</h1>
			</div>
			<div class="post_info">
				<table>
					<tr>
						<td><label for="name">성 명</label></td>
						<td><input id="name" name="name" placeholder="이름" size="30" value="<%=name %>"></td>
					</tr>
					<tr>
						<td><label for="subject">제 목</label></td>
						<td><input id="subject" name="subject" placeholder="제목 입력" size="30" value="<%=subject %>"></td>
					</tr>
					<tr>
						<td><label for="content">내 용</label></td>
						<td><textarea id="content" name="content" rows="10" cols="80" placeholder="게시판 내용"><%=content %></textarea></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호</label></td>
						<td>
							<input id="pw" type="password" name="pass" size="30" placeholder="비밀번호 입력" required>
							<span>수정시에는 비밀번호가 필요합니다.</span>
						</td>
					</tr>
				</table>
			</div>
			<hr>
			<div class="btnZip">
				<input type="submit" value="수정완료">&emsp;&emsp;
				<input type="reset" value="초기화">&emsp;&emsp;
				<input type="button" value="뒤로" onclick="history.go(-1);">
			</div>
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="num" value="<%=num %>">
		</div>
	</form>
	
	
</body>
</html>