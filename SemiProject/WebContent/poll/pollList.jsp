<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poll.*, java.util.*" %>
<jsp:useBean id="pMgr" class="poll.PollMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	String name1 = (String)session.getAttribute("idKey");
	
%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>World - 투표</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<link rel="shortcut icon" href="../resource/img/logo.png">
<link rel="stylesheet" href="../resource/css/styles12.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style type="text/css">
table {
	margin: 30px auto;
}
</style>
</head>
<body align="center">
    <nav id="main-globalnav">
      <div class="main-gn-content">
        <ul class="main-gn-menu">
          <li class="main-gn-submenu">
            <a href="../index.jsp"><i class="fas fa-star"></i></a>
          </li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%A0%9C1%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">1차세계대전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%A0%9C2%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">2차세계대전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/6.25%20%EC%A0%84%EC%9F%81" target="_blank">6.25전쟁</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%9E%84%EC%A7%84%EC%99%9C%EB%9E%80" target="_blank">임진왜란</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80%EB%A5%B4%20%ED%95%B4%EC%A0%84" target="_blank">트라팔가르 해전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EB%AA%BD%EA%B3%A8%20%EC%A0%9C%EA%B5%AD" target="_blank">몽골제국</a></li>
          <li class="main-gn-submenu"><a href="../board/list.jsp">게시판</a></li>
          <li class="main-gn-submenu"><a href="pollList.jsp">투표창</a></li>
          <li class="main-gn-submenu">
          	<%
          	if(id == null) {
          	%>
            	<a href="../member/login.jsp"><i class="fas fa-sign-in-alt fa-lg"></i></a>
            <%
          	} else {
            %>
            	<a href="../member/logout.jsp"><i class="fas fa-sign-out-alt fa-lg"></i></a>
            <%
          	}
            %>
          </li>
		  <li class="main-gn-submenu">
			<div id="login">
			 <% 
			 if(id != null) { 
			 %>
			  <p>[ <%=id %>님 로그인 상태 ]</p>
			 <%
			 }
			 %>
			</div>
		  </li>
        </ul>
      </div>
      <div class="gn-media">
        <ul class="main-gn-menu hidden_ul">
          <li class="main-gn-submenu hidden_list">
            <a href="#">
              <i class="fas fa-bars fa-lg"></i>
            </a>
            <nav class="small_nav hidden_nav">
              <div class="sm-nav-set">
                <ul class="small_nav--ul">
                  <li class="small_nav--list"><a href="https://namu.wiki/w/%EC%A0%9C1%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">1차세계대전</a></li>
                  <li class="small_nav--list"><a href="https://namu.wiki/w/%EC%A0%9C2%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">2차세계대전</a></li>
                  <li class="small_nav--list"><a href="https://namu.wiki/w/6.25%20%EC%A0%84%EC%9F%81" target="_blank">6.25전쟁</a></li>
                  <li class="small_nav--list"><a href="https://namu.wiki/w/%EC%9E%84%EC%A7%84%EC%99%9C%EB%9E%80" target="_blank">임진왜란</a></li>
                  <li class="small_nav--list">
                    <a href="https://namu.wiki/w/%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80%EB%A5%B4%20%ED%95%B4%EC%A0%84" target="_blank">트라팔가르 해전</a>
                  </li>
                  <li class="small_nav--list"><a href="https://namu.wiki/w/%EB%AA%BD%EA%B3%A8%20%EC%A0%9C%EA%B5%AD" target="_blank">몽골제국</a></li>
                  <li class="small_nav--list"><a href="../board/list.jsp">게시판</a></li>
                  <li class="small_nav--list"><a href="pollList.jsp">투표창</a></li>
                </ul>
              </div>
            </nav>
          </li>
          <li class="main-gn-submenu">
            <a href="../index.jsp"><i class="fas fa-star fa-lg"></i></a>
          </li>
          <li class="main-gn-submenu" title="로그인 화면">
          	<%
          	if(id == null) {
          	%>
            	<a href="../member/login.jsp"><i class="fas fa-sign-in-alt fa-lg"></i></a>
            <%
          	} else {
            %>
            	<a href="../member/logout.jsp"><i class="fas fa-sign-out-alt fa-lg"></i></a>
            <%
          	}
            %>
          </li>
        </ul>
      </div>
    </nav>


	<div class="vote_container">
		<main class="vote_main">
			<div class="vote_header">
				<h1>투표</h1>
				<h4><a href="../index.jsp">홈으로</a></h4>
			</div>
			<hr style="margin: 0 auto" width="700px">
			
			<jsp:include page="pollForm.jsp"></jsp:include>
			<hr style="margin: 0 auto" width="700px">
			
			<div class="vote_list_container">
				<div class="vote_list_title">
					<h4>설문리스트</h4>	
				</div>
				<div class="vote_menu">
					<table class="vote_menu_option" border="1" align="center" width="700">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>시작일~종료일</th>
						</tr>
						<%! int num; %>
						<%
						Vector<PollListBean> vlist = pMgr.getAllList();
						int count = vlist.size();
					
						for(int i = 0; i < vlist.size(); i++) {
							PollListBean plBean = vlist.get(i);
							String question = plBean.getQuestion();	// 제목
							String sdate = plBean.getSdate();
							String edate = plBean.getEdate();
							num = plBean.getNum();
							
							out.print("<tr>");
								out.print("<td align='center'>"+count+"</td>");
								out.print("<td><a href='pollList.jsp?num="+num+"'>"+question+"</a></td>");
								out.print("<td>"+sdate+" ~ "+edate+"</td>");			
							out.print("</tr>");
							count--;
						}
						%>
						<tr>
							<td colspan="3" align="right"><a href="pollInsert.jsp">설문작성하기</a> 
						</tr>
					</table>
					<!-- 댓글달기 -->
					<table align="center" id="reply" border="1" cellspacing="0">
						<thead>
							<tr>
								<th>댓글작성</th>
								<th><textarea rows="3" cols="50" id="replyContent"></textarea></th>
								<input type="hidden" id="name1" value="<%=name1 %>">
								<th class="comment_btn_container"><button class="comment_btn" onclick="insertReply();">댓글등록</button></th>
							</tr>
						</thead>
						
						<tbody>
						</tbody>
					</table>
					
					<script>
						$(function() {
							replyList();
							setInterval(replyList, 1000);
						});
						
						function replyList() {
							$.ajax({
								url:"rlist.do",
								data:{pnum:<%=num %>},
								success:function(list) {
									let result = "";
									for(let i=0; i<list.length; i++){
										result += "<tr>"
													+ "<td>" + list[i].name + "</td>"
													+ "<td>" + list[i].content + "</td>"
													+ "<td>" + list[i].redate + "</td>"
												+ "</tr>"
									}
									$("#reply tbody").html(result);
								},
								error:function(){
									console.log("ajax 통신실패");
								}
							});
						}
						
						function insertReply() {
							$.ajax({
								url:"insert.do",	// servlet 이름
								data:{				// servlet으로 보낼 데이터를 집어넣는 곳
									content:$("#replyContent").val(),	// 내용
									pnum:<%=num %>,						// 부모가 누구인지
									name:$("#name1").val()						// 보내는 사람
								},
								type:"post",
								success:function(result){
									if(result > 0) {
										replyList();
										$("#replyContent").val("");
									}
								},
								error:function(){
									console.log("ajax 통신실패");
								}
							});
						}
					</script>
				</div>
			</div>
		</main>
	</div>
    <script src="https://kit.fontawesome.com/6b7a2f6a5d.js"></script>
    <script src="../resource/js/slide.js"></script>
    <script src="../resource/js/jQueryUser.js"></script>
    <script src="../resource/js/todo.js"></script>
</body>
</html>