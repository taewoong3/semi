<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bean" class="board.BoardBean" scope="session"/>
<%
	String nowPage = request.getParameter("nowPage");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../resource/img/logo.png">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<title>게시판-답변</title>
</head>
<body>			
					
	<form method="post" name="replyFrm" action="boardReply">
		<div class="post_container">
			<div class="post_header">
				<h1 class="post_title">답 변 하 기</h1>
			</div>
			<div class="post_info">
				<table>
					<tr>
						<td><label for="name">성 명</label></td>
						<td><input id="name" name="name" placeholder="이름" size="30" required></td>
					</tr>
					<tr>
						<td><label for="subject">제 목</label></td>
						<td><input id="subject" name="subject" placeholder="제목 입력" size="30" value="답변 : <%=bean.getSubject() %>" required></td>
					</tr>
					<tr>
						<td><label for="content">내 용</label></td>
						<td><textarea id="content" name="content" rows="10" cols="80">&emsp;&emsp;<%=bean.getContent() %>
		    ====== 답변 글을 쓰세요. =====</textarea></td>
					</tr>
					<tr>
						<td><label for="pw">비밀번호</label></td>
						<td>
							<input id="pw" type="password" name="pass" size="30" placeholder="비밀번호 입력" required>
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
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
			<input type="hidden" name="nowPage" value="<%=nowPage %>">
			<input type="hidden" name="ref" value="<%=bean.getRef() %>">
			<input type="hidden" name="pos" value="<%=bean.getPos() %>">
			<input type="hidden" name="depth" value="<%=bean.getDepth() %>">
		</div>
	</form>
	
	
</body>
</html>