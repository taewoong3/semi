<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr" />
<%
	int num = 0;
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	
	PollListBean plbBean = pMgr.getList(num);
	Vector<String> vlist = pMgr.getItem(num);
	
	String question = plbBean.getQuestion();
	int type = plbBean.getType();
	int active = plbBean.getActive();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table .checkbox1 {
		text-align: left;
	}
</style>
</head>
<body>
	<form method="post" action="pollFormProc.jsp">
		<table border="1" align="center" width="200">
			<tr>
				<td><h3>Q : <%=question %></h3></td>
			</tr>
			<tr>
				<td class="checkbox1">
				<%
					for(int i=0; i < vlist.size(); i++){
						String itemList = vlist.get(i);
						if(type == 1)
							out.print("<input type='checkbox' name='itemnum' value='"+i+"'>");
						else
							out.print("<input type='radio' name='itemnum' value='"+i+"'>");
						
						out.print(itemList + "<br>");
					}
				%>
				</td>
			</tr>
			<tr>
				<td style="text-align: center;">
					<%
						if(active==1) {
							out.print("<input type='submit' value='투표'>");
						}else{
							out.print("투표");
						}
					%>															<!-- ↓ 'PollView' : 이름이라서 마음대로 작성가능 -->
					<input type="button" value="결과" 
					onclick="javascript:window.open('pollView.jsp?num=<%=num %>', 'PollView'	
							, 'width=500', 'height=350')">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
	</form>
</body>
</html>













