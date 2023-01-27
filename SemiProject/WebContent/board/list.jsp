<%@page import="oracle.net.aso.a"%>
<%@ page import="java.beans.beancontext.BeanContext"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bMgr" class="board.BoardMgr" />
<%
	request.setCharacterEncoding("UTF-8");
	int totalRecord = 0;	// 전체 레코드 수
	int numPerPage = 10;	// 1페이지당 레코드 수
	int pagePerBlock = 5;	// 블록당 페이지 수 [1][2][3][4][5]
			
	int totalPage = 0;		// 전체 페이지 수 레코드 54개 : [1][2][3][4][5][6]
	int totalBlock = 0;		// 전체 블록 수 = 2개
	
	int nowPage = 1;		// 현재 해당하는 페이지
	int nowBlock = 1;		// 현재 해당하는 블록
	
	int start = 0;			// DB 테이블의 select 시작번호(페이지에 해당하는 레코드수만 가져오기) : 54 ~ 43[1]
	int end = 0;			// 10개씩 가져오기
	int listSize = 0;		// 현재 읽어온 게시물의 수


	String keyField = "", keyWord = "";
	ArrayList<BoardBean> alist = null;
	if(request.getParameter("keyWord") != null) {
		keyWord = request.getParameter("keyWord");
		keyField = request.getParameter("keyField");
	}
	
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")) {
			keyWord = "";
			keyField = "";
		}
	}
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage)-numPerPage + 1;					// 각 페이지당 시작번호
	end = nowPage*numPerPage;										// 각 페이지의 끝번호
	totalRecord = bMgr.getTotalCount(keyField, keyWord);			// 전체 레코드 수
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);	// 전체 페이지 수
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock);		// 현재 블록
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock);	// 전체 블록 수
	
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<script>
	
 	function read(num) {
		readFrm.num.value = num;
		readFrm.action = "read.jsp";
		readFrm.submit();
	}

 	function pageing(page) {
		readFrm.nowPage.value = page;
		readFrm.submit();
	}
 	
 	function block(value) {
 		readFrm.nowPage.value = <%=pagePerBlock %> * (value-1)+1;
		readFrm.submit();
	}
 	
 	function list() {
		listFrm.action = "list.jsp";
		listFrm.submit();
		
	}
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<link rel="stylesheet" href="../resource/css/styles12.css">
<link rel="shortcut icon" href="../resource/img/logo.png">
</head>
<body>
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
          <li class="main-gn-submenu"><a href="list.jsp">게시판</a></li>
          <li class="main-gn-submenu"><a href="../poll/pollList.jsp">투표창</a></li>
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
                  <li class="small_nav--list"><a href="list.jsp">게시판</a></li>
                  <li class="small_nav--list"><a href="../poll/pollList.jsp">투표창</a></li>
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
    
	<table align="center" class="list_container">
		<tr>
			<td colspan="5"><h1 class="list_title">게시판</h1></td>
		</tr>
<%-- 		<tr>
			<td colspan="5">
				<p>Total : <%=totalRecord %>Articles(<font color="red"><%=nowPage %>/<%=totalPage %>Page</font>)</p>
			</td>
		</tr> --%>
		<tr class="track_two">
			<th width="5%">번 호</th>
			<th width="45%">제 목</th>
			<th width="15%">이 름</th>
			<th width="25%">날 짜</th>
			<th width="10%">조회수</th>
		</tr>
		<%
			alist = bMgr.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			if(alist.isEmpty()){
				out.print("<tr><td colspan='5'>등록된 게시물이 없습니다.</td></tr>");
			} else {
				for(int i = 0; i < end; i++) {
					if(i == listSize)
						break;
					BoardBean bean = alist.get(i);
					int num = bean.getNum();
					String subject = bean.getSubject();
					String name = bean.getName();
					String regdate = bean.getRegdate().substring(0, 11);
					int count = bean.getCount();
					int depth = bean.getDepth();
		%>
			<tr>
				<td align="center"><%=totalRecord-(nowPage-1)*numPerPage-i %></td>
				<td align="left">
					<%
						if(depth > 0) {
							for(int j = 0; j < depth; j++) {
								out.print("&emsp;");
							}
						}
					%>
					<a href="javascript:read('<%=num %>')"><%=subject %></a>
				</td>
				<td align="center"><%=name %></td>
				<td align="center"><%=regdate %></td>
				<td align="center"><%=count %></td>
			</tr>
					
		<%	
			}
		}
		%>
		<tr><td colspan="5"><br/></td></tr>
		<tr>
			<!-- 페이징 처리 시작 -->
			<td colspan="3" align="center">
			<%
				// 1블록 pageStart:1 2블록 pageStart:6
				int pageStart =  (nowBlock-1) * pagePerBlock + 1;
				int pageEnd = (pageStart + pagePerBlock <= totalPage) ? (pageStart + pagePerBlock) :  totalPage + 1;
				
				if(totalPage != 0) {
					if(nowBlock > 1) {
			%>
						<a href="javascript:block('<%=nowBlock-1 %>')">prev....</a>
			<%
					}
					out.print("&nbsp;");
					for(;pageStart < pageEnd; pageStart++) {
			%>
						<a href="javascript:pageing('<%=pageStart %>')">
						<%
						if(pageStart == nowPage) {
						%>
							<font color="black">
						<%
						}
						%>
						<span class="pageNumber"><%=pageStart %></span>
						<%
						if(pageStart == nowPage) {
						%>
							</font>
						<%
						}
						%>
						</a>
			<%
					}
					out.print("&nbsp;");
					if(totalBlock > nowBlock) {
			%>
						<a href="javascript:block('<%=nowBlock+1 %>')">...next</a>
			<%
					}
				}
			%>
			</td>
			<!-- 페이징 처리 끝 -->
 			<td colspan="2" align="right">
				<a href="post.jsp"><span class="pageBtn">글쓰기</span></a>&nbsp;
				<a href="javascript:list();"><span class="pageBtn">처음으로</span></a>
				<a href="../index.jsp"><span class="pageBtn">홈으로</span></a>
			</td>
		</tr>
			
		<tr>
			<td colspan="5">
				<hr class="line_operation">
			</td>
		</tr>
		<tr>
			<td colspan="5">								<!-- ↓ action 속성은 설정하지 않으면 내 자신으로 온다. -->
				<form class="list_search" method="post" name="searchFrm" action="list.jsp">
					<select class="list_sel" name="keyField">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input class="list_option" name="keyWord" required>
					<input class="list_option" type="submit" value="찾기">
					<input class="list_option" type="hidden" name="nowPage" value="1">
				</form>
			</td>
		</tr>
	</table>
	<!-- 처음으로 누르면 화면을 reload하기 -->
	<form name="listFrm" method="post" action="">
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
	</form>
	
	<!-- 제목을 누르면 상세보기 페이지 보기 -->
	<form name="readFrm" method="get">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyField" value="<%=keyWord %>">
	</form>
	
    <script src="https://kit.fontawesome.com/6b7a2f6a5d.js"></script>
    <script src="../resource/js/slide.js"></script>
    <script src="../resource/js/jQueryUser.js"></script>
    <script src="../resource/js/todo.js"></script>
</body>
</html>
