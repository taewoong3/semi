<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="../resource/img/logo.png">
<link rel="stylesheet" href="../resource/css/styles12.css" />
<title>게시판-글쓰기</title>
</head>
<body>								   <!-- ↓ 파일은 반드시 해당 타입으로 처리해야 한다. -->
    <form class="main_post" method="post" enctype="multipart/form-data" action="boardPost" name="postFrm">
      <div class="post_container">
        <div class="post_header">
          <h1 class="post_title">글 쓰 기</h1>
        </div>
        <div class="post_info">
          <table>
            <tr>
              <td>
                <label for="name">성 명</label>
              </td>
              <td>
                <input id="name" name="name" placeholder="이름" size="30" />
              </td>
            </tr>
            <tr>
              <td><label for="subject">제 목</label></td>
              <td>
                <input
                  id="subject"
                  name="subject"
                  placeholder="제목 입력"
                  size="30"
                />
              </td>
            </tr>
            <tr>
              <td><label for="content">내 용</label></td>
              <td>
                <textarea
                  id="content"
                  name="content"
                  rows="10"
                  cols="80"
                  placeholder="게시판 내용"
                ></textarea>
              </td>
            </tr>
            <tr>
              <td><label for="pw">비밀번호</label></td>
              <td>
                <input
                  id="pw"
                  type="password"
                  name="pass"
                  size="30"
                  placeholder="비밀번호 입력"
                />
              </td>
            </tr>
            <tr>
              <td><label for="file">파일찾기</label></td>
              <td>
                <input
                  id="file"
                  type="file"
                  name="filename"
                  value="파일 선택"
                />
              </td>
            </tr>
          </table>
        </div>
        <hr />
        <div class="btnZip">
          <input type="submit" value="등록" />&emsp;&emsp;
          <input type="reset" value="다시쓰기" />&emsp;&emsp;
          <input
            type="button"
            value="리스트"
            onclick="location.href='list.jsp'"
          />
        </div>
        <input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>" />
        <!-- request.getRemoteAddr() : 접속유저(client)의 ip 주소를 얻어오는 방법 -->
      </div>
    </form>
</body>
</html>