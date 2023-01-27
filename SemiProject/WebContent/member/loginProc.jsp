<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 빈 객체 생성 / MemberMgr mMgr = new MemberMgr(); 와 같은 의미!
    	member.MemberMgr를 사용하겠다는 의미.
     -->
<jsp:useBean id="mMgr" class="member.MemberMgr"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String msg = "로그인에 실패 하였습니다.";
	String url = "login.jsp";
	
	String result = mMgr.loginMember(id, pwd);
	if(result != null) {
		session.setAttribute("idKey", result);
		msg = "로그인 하였습니다.";
		url = "../index.jsp";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>
</head>
<body>

</body>
</html>

