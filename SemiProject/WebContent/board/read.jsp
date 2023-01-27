<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	bMgr.upCount(num);
	
	BoardBean bean = bMgr.getBoard(num);
	String date = bean.getRegdate().substring(0, 11);
	session.setAttribute("bean", bean);
	
	String name = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<link rel="shortcut icon" href="../resource/img/logo.png">
<title>게시판-읽기</title>
<script>
	function down(filename) {
		downFrm.filename.value = filename;
		downFrm.submit();
	}
	function list() {
		listFrm.submit();
	}
</script>
<style>
	.btnZip a {
		border: 1px solid var(--main-color);
		border-radius: 10px;
		padding: 10px 20px;
		background-color: var(--main-color);
		font-size: 30px;
		transition: all 0.5s linear;
	}
	.btnZip a:hover {
	  color: #fae100;
	  background-color: red;
	  border-color: red;
	}
	table tr {
		border-bottom: 1px solid rgba(0,0,0,0.3);
		transition: all .5s ease-in-out;
	}
	
	table tr:hover {
		border-color: #03c75a;
	}
</style>
</head>
<body>
	<div class="post_container">
		<div class="post_header">
          <h1 class="post_title">글 읽 기</h1>
        </div>
        <div class="post_info">
			<table align="center">
				<tr>
					<td>
					 <label for="name">성 명</label>
					</td>
					<td><span style="color: red; font-weight: bold;"><%=bean.getName() %></span></td>
					<td>
						<label>등록날짜</label>
					</td>
					<td><%=date %></td>
				</tr>
				<tr>
					<td>
						<label for="subject">제 목</label>
					</td>
					<td colspan="3"><%=bean.getSubject() %></td>
				</tr>
				<tr>
					<td>
						<label>첨부파일</label>
					</td>
					<td colspan="3">
					<%
						String filename = bean.getFilename();
						if(filename != null && !filename.equals("")){
					%>
						<a href="javascript:down('<%=filename %>')"><%=filename %></a>&nbsp;
						<font color="blue">(<%=bean.getFilesize() %>) kByte</font>
					<%
						} else {
							out.print("등록된 파일이 없습니다.");
						}
					%>
					</td>
				</tr>
				<tr>
					<td colspan="4"><br/><pre style="font-weight: bold;"><%=bean.getContent() %></pre></td>
				</tr>
				<tr>
					<%-- <td colspan="4" align="right"><%=bean.getContent() %>로부터 글을 남기셨습니다.</td> --%>
					<td colspan="4" align="right"><span style="color: red; font-weight: bold;"><%=bean.getName() %></span>이 글을 남기셨습니다.</td>
				</tr>
<%-- 				<tr> 
					<td align="center" colspan="4"><hr>
						[
						<a href="javascript:list();">리스트</a>&emsp;|&emsp;
						<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">수정</a>&emsp;|&emsp;
						<a href="reply.jsp?nowPage=<%=nowPage%>">답변</a>&emsp;|&emsp;
						<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭제</a>
						]
					</td>
				</tr> --%>
			</table>
			<div class="btnZip">
				
				<a href="javascript:list();">리스트</a>&emsp;&emsp;
				<a href="update.jsp?nowPage=<%=nowPage%>&num=<%=num%>">수정</a>&emsp;&emsp;
				<a href="reply.jsp?nowPage=<%=nowPage%>">답변</a>&emsp;&emsp;
				<a href="delete.jsp?nowPage=<%=nowPage%>&num=<%=num%>">삭제</a>
				
			</div>
		</div>
	</div>
		
	<form name="downFrm" method="post" action="download.jsp">
		<input type="hidden" name="filename">
	</form>
		
		
	<form name="listFrm" method="post" action="list.jsp">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<%
			if(!(keyWord == null || keyWord.equals(""))) {
		%>
			<input type="hidden" name="keyField" value="<%=keyField %>">
			<input type="hidden" name="keyWord" value="<%=keyWord %>">
		<%
			}
		%>
	</form>
		
</body>
</html>

















