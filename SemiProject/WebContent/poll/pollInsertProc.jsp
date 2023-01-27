<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="pMgr" class="poll.PollMgr"></jsp:useBean>
<jsp:useBean id="plBean" class="poll.PollListBean"></jsp:useBean>
<jsp:setProperty property="*" name="plBean"/>

<jsp:useBean id="piBean" class="poll.PollItemBean"></jsp:useBean>
<jsp:setProperty property="*" name="piBean"/>
<%
	out.print(request.getParameter("sdateY"));
	String sdate 	= request.getParameter("sdateY") + "-"
					+ request.getParameter("sdateM") + "-"
					+ request.getParameter("sdateD");
	String edate 	= request.getParameter("edateY") + "-"
					+ request.getParameter("edateM") + "-"
					+ request.getParameter("edateD");
	out.print(sdate);
	out.print(edate);
	plBean.setSdate(sdate);
	plBean.setEdate(edate);
	
	boolean result = pMgr.insertPoll(plBean, piBean);
	String msg = "설문 추가에 실패 하였습니다";
	String url = "pollInsert.jsp";
	
	if(result) {
		msg = "설문이 추가되었습니다.";
		url = "pollList.jsp";
	}
%>
<<script type="text/javascript">
	alert("<%=msg %>");
	location.href="<%=url%>";
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>