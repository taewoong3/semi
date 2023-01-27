<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표</title>
<link rel="shortcut icon" href="../resource/img/logo.png">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<style type="text/css">
	table {
	border-collapse: collapse;
	margin: 0 auto;
	}
	.pollInsert_container {
		text-align: center;
		margin: 30px 0px;
		color: #03c75a;
	}
	.pollInsert_container hr {
		margin: 30px auto;
	}
	.poll_menu table tr th{
		padding: 5px 20px;
	}
	.poll_menu table select{
		border: none;
	}
	.poll_menu input, select {
		border: none;
		background-color: inherit;
		border-bottom: 1px solid rgba(0,0,0,0.2);
		font-size: 18px;
		padding: 10px 0px;
		transition: all .5s ease-in-out;
		margin-bottom: 5px;
	}
	.poll_menu input:hover {
		border-bottom-color: #03c75a;
	}
	.poll_menu th {
		color: #03c75a;
	}
</style>
</head>
<body align ="center">
	<div class="pollInsert_container">
		<h1>투표프로그램</h1>
		<hr width="700px">
		
		<h3>설문작성</h3>
		<hr width="700px">
	</div>
	<form class="poll_menu" method="post" action="pollInsertProc.jsp">
		<table border="1" align ="center" width="600px">
			<tr>
				<th>질문</th>
				<td colspan="2"><input name="question" size="50"></td>
			</tr>
			<!-- <tr>
				<th rowspan="8">항목</th>
				<td>1:<input name="item"></td>
				<td>2:<input name="item"></td>
			</tr>
			<tr>
				<td>3:<input name="item" ></td>
				<td>4:<input name="item" ></td>
			</tr>
			<tr>
				<td>5:<input name="item" ></td>
				<td>6:<input name="item"></td>
			</tr>
			<tr>
				<td>7:<input name="item" ></td>
				<td>8:<input name="item" ></td>
			</tr> -->
			
			<!-- for문으로 돌리기 -->
			<tr>
				<th rowspan="8">항목</th>
			<%
				for(int i=1;i<=4;i++){
					out.print("<td>" + (i*2-1) + ": <input name='item'></td>");
					out.print("<td>" + (i*2) + ": <input name='item'></td>");
					out.print("</tr>");
					if(i==4){
						out.print("");
					} else {
						out.print("<tr>");
					}
				}
			%>
			<tr>
				<td>시작일</td>
				<td>
					<select name="sdateY">
						<option value="2022">2022
						<option value="2023">2023
					</select>년
					<select name="sdateM">
						<%
							for(int i =1; i<=12;i++){
								out.print("<option value='"+i+"'>"+i);			
							}
						%>
					</select>월
					<select name="sdateD">
						<%
							for(int i =1; i<=31;i++){
								out.print("<option value='"+i+"'>"+i);			
							}
						%>
					</select>일
				</td>
			</tr>
			
			<tr>
				<td>종료일</td>
				<td>
					<select name="edateY">
						<option value="2022">2022
						<option value="2023">2023
					</select>년
					<select name="edateM">
						<%
							for(int i =1; i<=12;i++){
								out.print("<option value='"+i+"'>"+i);			
							}
						%>
					</select>월
					<select name="edateD">
						<%
							for(int i =1; i<=31;i++){
								out.print("<option value='"+i+"'>"+i);			
							}
						%>
					</select>일
				</td>
			</tr>
			<tr>
				<td>이중답변</td>
				<td>
					<input type="radio" name="type" value="1" checked>YES
					<input type="radio" name="type" value="0" checked>NO
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center">
					<input type="submit" value="작성하기">
					<input type="reset" value="다시쓰기">
					<input type="button" value="리스트보기" onclick="location.href='pollList.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>