<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<link rel="shortcut icon" href="../resource/img/logo.png">
<title>Login</title>
</head>
<body>
<%
	if(id != null) {
		
%>
	<h3><%=id %>님 환영합니다.</h3>
	<h3>즐거운 하루 ~~</h3>
	<a href="logout.jsp">로그아웃</a>
<%
	} else {
		
%>
    <main id="login_container">
      <div class="language">
        <select id="lang">
          <option value="korea">한국어</option>
          <option value="english">English</option>
        </select>
      </div>
      <article class="login_article">
        <h1 class="login-logo">NAVER</h1>
        <form method="post" name="loginFrm" action="loginProc.jsp">
          <table class="login-table" align="center">
            <tr>
              <th colspan="2">
                <i class="fas fa-sign-in-alt fa-sm"></i>&nbsp;ID 로그인
              </th>
            </tr>
            <tr>
              <td>
                <div class="login-border">
                  <span><i class="far fa-user"></i></span>
                  <input
                    class="login_input"
                    name="id"
                    placeholder="아이디"
                    required
                  />
                </div>
              </td>
            </tr>
            <tr>
              <td>
                <div class="login-border">
                  <span><i class="fas fa-lock"></i></span>
                  <input
                    class="login_input"
                    type="password"
                    name="pwd"
                    placeholder="비밀번호"
                    required
                  />
                </div>
              </td>
            </tr>
            <tr align="center">
              <td colspan="2">
                <div class="login-btn">
                  <input
                    class="login_input"
                    type="submit"
                    value="로그인"
                    name="login"
                  />&emsp;&emsp;
                  <input
                    class="login_input"
                    type="button"
                    value="회원가입"
                    onClick="location.href='member.jsp'"
                    name="signup"
                  />&emsp;&emsp;
                  <input
                    class="login_input"
                    type="button"
                    value="홈으로"
                    onclick="location.href='../index.jsp'"
                  />
                </div>
              </td>
            </tr>
          </table>
        </form>
      </article>
    </main>
    <script
      src="https://kit.fontawesome.com/6b7a2f6a5d.js"
      crossorigin="anonymous"
    ></script>
<%
	}
%>
</body>
</html>