<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int num = 0;	// 클릭하지 않으면 0
	if(!(request.getParameter("num") == null || request.getParameter("num").equals(""))) {
		num = Integer.parseInt(request.getParameter("num"));
	}
	int sum = pMgr.sumCount(num);
	Vector<PollItemBean> vlist = pMgr.getView(num);
	PollListBean plBean = pMgr.getList(num);
	String question = plBean.getQuestion();
	Random r = new Random();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body > table{
		margin: 0 auto;
		border-collapse: collapse;
		text-align: center;
		border: 1px solid black;
	}
	
	a {
		display: block;
		text-align: center;
		text-decoration: none;
	}
</style>
</head>
<body>
	<table class="btable" border="1">
		<tr><th colspan="4">Q : <%=question %></th></tr>
		<tr><td colspan="4">총 투표수 : <%=sum %></td></tr>
		<%
			for(int i = 0; i < vlist.size(); i++) {
				PollItemBean piBean = vlist.get(i);
				String[] item = piBean.getItem();
				int rgb = r.nextInt(255*255*255);
				String rgbt = Integer.toHexString(rgb);	// ex.) ff1f3d
				String hRGB = "#" + rgbt;
				int count = piBean.getCount();
				int ratio = (int)(Math.ceil((double)count/sum*100));
		%>
		<tr>
			<td><%=i+1 %></td>
			<td><%=item[0] %></td>
			<td>
				<table width="<%=ratio %>" height="15">
					<tr><td bgcolor="<%=hRGB %>"></td></tr>
				</table>
			</td>
			<td><%=count %></td>
		</tr>
		<%
			}
		%>
	</table>
	<a href="javascript:window.close()">닫기</a>
</body>
</html>