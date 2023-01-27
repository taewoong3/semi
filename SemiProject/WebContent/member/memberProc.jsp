<%@page import="com.sun.jdi.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mMgr" class="member.MemberMgr" />
<jsp:useBean id="bean" class="member.MemberBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	boolean result = mMgr.insertMember(bean);
	String msg = "회원가입에 실패 했습니다.";
	String url = "member.jsp";
	if(result) {
		msg = "회원가입이 완료 되었습니다.";
		url = "login.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
</head>
<body>

</body>
</html>