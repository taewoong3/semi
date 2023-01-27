<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="shortcut icon" href="resource/img/logo.png" />
    <link rel="stylesheet" href="resource/css/styles12.css" />
    <style>
    </style>
    <title>World-War</title>
  </head>
  <body>
    <nav id="main-globalnav">
      <div class="main-gn-content">
        <ul class="main-gn-menu">
          <li class="main-gn-submenu">
            <a href="index.jsp"><i class="fas fa-star"></i></a>
          </li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%A0%9C1%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">1차세계대전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%A0%9C2%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84" target="_blank">2차세계대전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/6.25%20%EC%A0%84%EC%9F%81" target="_blank">6.25전쟁</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EC%9E%84%EC%A7%84%EC%99%9C%EB%9E%80" target="_blank">임진왜란</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80%EB%A5%B4%20%ED%95%B4%EC%A0%84" target="_blank">트라팔가르 해전</a></li>
          <li class="main-gn-submenu"><a href="https://namu.wiki/w/%EB%AA%BD%EA%B3%A8%20%EC%A0%9C%EA%B5%AD" target="_blank">몽골제국</a></li>
          <li class="main-gn-submenu"><a href="board/list.jsp">게시판</a></li>
          <li class="main-gn-submenu"><a href="poll/pollList.jsp">투표창</a></li>
          <li class="main-gn-submenu">
          	<%
          	if(id == null) {
          	%>
            	<a href="member/login.jsp"><i class="fas fa-sign-in-alt fa-lg"></i></a>
            <%
          	} else {
            %>
            	<a href="member/logout.jsp"><i class="fas fa-sign-out-alt fa-lg"></i></a>
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
                  <li class="small_nav--list"><a href="board/list.jsp">게시판</a></li>
                  <li class="small_nav--list"><a href="poll/pollList.jsp">투표창</a></li>
                </ul>
              </div>
            </nav>
          </li>
          <li class="main-gn-submenu">
            <a href="index.jsp"><i class="fas fa-star fa-lg"></i></a>
          </li>
          <li class="main-gn-submenu" title="로그인 화면">
          	<%
          	if(id == null) {
          	%>
            	<a href="member/login.jsp"><i class="fas fa-sign-in-alt fa-lg"></i></a>
            <%
          	} else {
            %>
            	<a href="member/logout.jsp"><i class="fas fa-sign-out-alt fa-lg"></i></a>
            <%
          	}
            %>
          </li>
        </ul>
      </div>
    </nav>


    <main class="main_screens">
      <section class="main_screens_column">
        <div class="main_screens_views grid">
          <h1 class="main_screens_text textShadow">War</h1>
          <h3 class="main_screens_subtext textShadow">
            Older men declare war. But it's the youth who must fight and die.
          </h3>
          <div class="main_screens_links">
            <a href="https://ko.wikipedia.org/wiki/%EC%A0%84%EC%9F%81" target="_blank" class="main_screens_link"><span>전쟁이란</span></a>
            <a href="https://ko.wikipedia.org/wiki/%EC%A0%84%EC%9F%81_%EB%AA%A9%EB%A1%9D" target="_blank" class="main_screens_link"><span>역사보기</span></a>
          </div>
        </div>
        <div class="main_screens_imgs grid">
          <img src="resource/img/war.png" alt="그림" />
        </div>
      </section>
      <section class="main_screens_column">
        <div class="main_screens_imgs">
          <img src="resource/img/history.png" alt="그림" width="800" height="519" />
        </div>
        <div class="main_screens_views">
          <h1 class="main_screens_text history_text">역사적 인물</h1>
          <h3 class="main_screens_subtext history_text">
            Only the dead have seen the end of war.
          </h3>
          <div class="main_screens_links">
            <a href="https://namu.wiki/w/%EC%9D%B4%EC%88%9C%EC%8B%A0" target="_blank" class="main_screens_link"><span>역사적 인물</span></a>
          </div>
        </div>
      </section>
      <section class="main_screens_column">
        <div class="main_screens_views">
          <h1 class="main_screens_text">Weapon</h1>
          <h3 class="main_screens_subtext">
            An unjust peace is better than a just war.
          </h3>
          <div class="main_screens_links">
            <a href="https://namu.wiki/w/%ED%95%B5%EB%AC%B4%EA%B8%B0" target="_blank" class="main_screens_link"><span>전쟁무기</span></a>
            <a href="https://namu.wiki/w/%EB%AC%B4%EA%B8%B0" target="_blank" class="main_screens_link"><span>역사보기</span></a>
          </div>
        </div>
        <div class="main_screens_imgs">
          <img src="resource/img/weapon.png" alt="그림" width="800" height="619" />
        </div>
      </section>
    </main>

    <div class="grid_container">
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">1차세계대전</h1>
              <h3 class="grid_subtitle">참호전의 서막</h3>
            </div>
            <div class="grid_links">
              <a href="https://ko.wikipedia.org/wiki/%EC%A0%9C1%EC%B0%A8_%EC%84%B8%EA%B3%84_%EB%8C%80%EC%A0%84" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://namu.wiki/w/%EC%B0%B8%ED%98%B8%EC%A0%84" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">참호전</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <img src="resource/img/1-war.png" alt="그림" />
          </div>
        </div>
      </div>
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">2차세계대전</h1>
              <h3 class="grid_subtitle">핵전쟁의 서막</h3>
            </div>
            <div class="grid_links">
              <a href="https://namu.wiki/w/%EC%A0%9C2%EC%B0%A8%20%EC%84%B8%EA%B3%84%20%EB%8C%80%EC%A0%84/%EC%9B%90%EC%9D%B8" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://namu.wiki/w/%EB%9D%BC%EC%9D%B4%EC%96%B8%20%EC%9D%BC%EB%B3%91%20%EA%B5%AC%ED%95%98%EA%B8%B0" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">다큐 & 영화</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <img src="resource/img/2차전쟁.png" alt="그림" />
          </div>
        </div>
      </div>
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">6.25전쟁</h1>
              <h3 class="grid_subtitle">동족상잔의 비극</h3>
            </div>
            <div class="grid_links">
              <a href="https://ko.wikipedia.org/wiki/6.25_%EC%A0%84%EC%9F%81" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://namu.wiki/w/%ED%83%9C%EA%B7%B9%EA%B8%B0%20%ED%9C%98%EB%82%A0%EB%A6%AC%EB%A9%B0" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">다큐 & 영화</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <img src="resource/img/한국전쟁.png" alt="그림" />
          </div>
        </div>
      </div>
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">임진왜란</h1>
              <h3 class="grid_subtitle">전쟁의 신 - 이순신</h3>
            </div>
            <div class="grid_links">
              <a href="https://namu.wiki/w/%EC%9E%84%EC%A7%84%EC%99%9C%EB%9E%80" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://namu.wiki/w/%ED%95%9C%EC%82%B0:%20%EC%9A%A9%EC%9D%98%20%EC%B6%9C%ED%98%84" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">다큐 & 영화</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <!-- <img src="img/임진왜란.jpg" alt="그림" /> -->
          </div>
        </div>
      </div>
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">트라팔가르 해전</h1>
              <h3 class="grid_subtitle">허레이쇼 넬슨</h3>
            </div>
            <div class="grid_links">
              <a href="https://namu.wiki/w/%ED%8A%B8%EB%9D%BC%ED%8C%94%EA%B0%80%EB%A5%B4%20%ED%95%B4%EC%A0%84" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://www.youtube.com/watch?v=V8o2FnPhnho" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">다큐 & 영화</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <!-- <img src="img/2차전쟁.png" alt="그림" /> -->
          </div>
        </div>
      </div>
      <div class="bg_img">
        <div class="grid_column">
          <div class="grid_info">
            <div class="grid_text">
              <h1 class="grid_title">몽골제국</h1>
              <h3 class="grid_subtitle">최대규모의 단일 제국</h3>
            </div>
            <div class="grid_links">
              <a href="https://ko.wikipedia.org/wiki/%EB%AA%BD%EA%B3%A8_%EC%A0%9C%EA%B5%AD" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">역사보기</span>
              </a>
              <a href="https://namu.wiki/w/%EB%AA%BD%EA%B3%A8(%EC%98%81%ED%99%94)" target="_blank" rel="noopener noreferrer">
                <span class="grid_link_text">다큐 & 영화</span>
              </a>
            </div>
          </div>
          <div class="grid_img">
            <!-- <img src="img/몽골제국3.png" alt="그림" /> -->
          </div>
        </div>
      </div>
    </div>

    <div class="img_slide_container">
      <article id="container">
        <section id="imgSlide">
          <img src="resource/img/fade1.jpg" alt="그림" />
          <img src="resource/img/fade2.jpg" alt="그림" />
          <img src="resource/img/fade3.jpg" alt="그림" />
        </section>
      </article>
    </div>

    <footer class="all_menu">
      <div class="detail_container">
        <nav class="detail_menu">
          <div class="detail_menu_list">
            <label class="detail_menu_label"> 역사 및 알아보기 </label>
            <ul class="detail_menu_subject">
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=_Q3QaktDBPg" target="_blank" rel="noopener noreferrer"
                  >1차세계대전</a
                >
              </li>
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=VkbDRMFYmgw" target="_blank" rel="noopener noreferrer"
                  >2차세계대전</a
                >
              </li>
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=PYY7pDNExG0" target="_blank" rel="noopener noreferrer"
                  >6.25전쟁</a
                >
              </li>
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=8B4a4Ff7NqQ" target="_blank" rel="noopener noreferrer"
                  >임진왜란</a
                >
              </li>
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=-Dmep2w0Cds" target="_blank" rel="noopener noreferrer"
                  >트라팔가르해전</a
                >
              </li>
              <li class="detail_menu_object">
                <a href="https://www.youtube.com/watch?v=45fENjLS85A" target="_blank" rel="noopener noreferrer"
                  >몽골제국</a
                >
              </li>
            </ul>
          </div>
          <div class="detail_menu_list">
            <div class="detail_menu_separated">
              <label class="detail_menu_label"> 역사적 인물 </label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%9D%B4%EC%88%9C%EC%8B%A0" target="_blank" rel="noopener noreferrer"
                    >이순신</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%84%A0%EC%A1%B0(%EC%A1%B0%EC%84%A0)" target="_blank" rel="noopener noreferrer">선조</a>
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EB%8F%84%EC%9A%94%ED%86%A0%EB%AF%B8%20%ED%9E%88%EB%8D%B0%EC%9A%94%EC%8B%9C" target="_blank" rel="noopener noreferrer"
                    >도요토미 히데요시</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://ko.wikipedia.org/wiki/%EC%A0%9C1%EB%8C%80_%EB%84%AC%EC%8A%A8_%EC%9E%90%EC%9E%91_%ED%97%88%EB%A0%88%EC%9D%B4%EC%87%BC_%EB%84%AC%EC%8A%A8" target="_blank" rel="noopener noreferrer"
                    >호레이쇼 넬슨</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%95%84%EB%8F%8C%ED%94%84%20%ED%9E%88%ED%8B%80%EB%9F%AC" target="_blank" rel="noopener noreferrer"
                    >아돌프 히틀러</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%9D%B4%EC%98%A4%EC%8B%9C%ED%94%84%20%EC%8A%A4%ED%83%88%EB%A6%B0" target="_blank" rel="noopener noreferrer"
                    >이오시프 스탈린</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%B9%AD%EA%B8%B0%EC%A6%88%20%EC%B9%B8" target="_blank" rel="noopener noreferrer"
                    >칭기즈칸</a
                  >
                </li>
              </ul>
            </div>
            <div class="detail_menu_separated">
              <label class="detail_menu_label">계정</label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >ID 관리</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >Store 계정</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >iCloud.com</a
                  >
                </li>
              </ul>
            </div>
          </div>
          <div class="detail_menu_list">
            <label class="detail_menu_label"> 최대 영토 </label>
            <ul class="detail_menu_subject">
              <li class="detail_menu_object">
                <a href="https://namu.wiki/w/%EC%9B%90%EB%82%98%EB%9D%BC" target="_blank" rel="noopener noreferrer">몽골</a>
              </li>
              <li class="detail_menu_object">
                <a href="https://namu.wiki/w/%EB%8C%80%EC%98%81%EC%A0%9C%EA%B5%AD" target="_blank" rel="noopener noreferrer">영국</a>
              </li>
              <li class="detail_menu_object">
                <a href="https://namu.wiki/w/%EA%B5%AD%EA%B0%80%EC%82%AC%ED%9A%8C%EC%A3%BC%EC%9D%98%20%EB%8F%85%EC%9D%BC%20%EB%85%B8%EB%8F%99%EC%9E%90%EB%8B%B9" target="_blank" rel="noopener noreferrer">나치</a>
              </li>
              <li class="detail_menu_object">
                <a href="https://namu.wiki/w/%EC%86%8C%EB%A0%A8" target="_blank" rel="noopener noreferrer">소련</a>
              </li>
              <li class="detail_menu_object">
                <a href="https://namu.wiki/w/%EC%9D%BC%EB%B3%B8%20%EC%A0%9C%EA%B5%AD" target="_blank" rel="noopener noreferrer">일본</a>
              </li>
            </ul>
          </div>
          <div class="detail_menu_list">
            <div class="detail_menu_separated">
              <label class="detail_menu_label"> 영화 & 다큐 </label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EB%AA%85%EB%9F%89" target="_blank" rel="noopener noreferrer">명량</a>
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%ED%95%9C%EC%82%B0:%20%EC%9A%A9%EC%9D%98%20%EC%B6%9C%ED%98%84" target="_blank" rel="noopener noreferrer">한산</a>
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EB%9D%BC%EC%9D%B4%EC%96%B8%20%EC%9D%BC%EB%B3%91%20%EA%B5%AC%ED%95%98%EA%B8%B0" target="_blank" rel="noopener noreferrer"
                    >라이언 일병 구하기</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://ko.wikipedia.org/wiki/%ED%9E%88%ED%8B%80%EB%9F%AC:_%EC%95%85%EC%9D%98_%ED%83%84%EC%83%9D" target="_blank" rel="noopener noreferrer"
                    >히틀러 : 악의탄생</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://www.youtube.com/watch?v=myyPPmiPgIQ&list=PLWWERTCipw4yl6NQxCvBS-ZNUfOQJsDpO" target="_blank" rel="noopener noreferrer"
                    >내셔널지오그래픽 : 2차세계대전</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EB%AA%BD%EA%B3%A8(%EC%98%81%ED%99%94)" target="_blank" rel="noopener noreferrer"
                    >몽 골</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%97%90%EB%84%88%EB%AF%B8%20%EC%95%B3%20%EB%8D%94%20%EA%B2%8C%EC%9D%B4%ED%8A%B8" target="_blank" rel="noopener noreferrer"
                    >에너미 앳 더 게이트</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="https://namu.wiki/w/%EC%9D%B8%EC%83%9D%EC%9D%80%20%EC%95%84%EB%A6%84%EB%8B%A4%EC%9B%8C" target="_blank" rel="noopener noreferrer"
                    >인생은 아름다워</a
                  >
                </li>
              </ul>
            </div>
            <div class="detail_menu_separated">
              <label class="detail_menu_label">교육</label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >세계사 교육</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >초중고용 교과서</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >대학 생활을 위한 제품 쇼핑하기</a
                  >
                </li>
              </ul>
            </div>
          </div>
          <div class="detail_menu_list">
            <div class="detail_menu_separated">
              <label class="detail_menu_label"> 가치관 </label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >개인정보 보호</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >협력업체에 대한 책임</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer">환경</a>
                </li>
              </ul>
            </div>
            <div class="detail_menu_separated">
              <label class="detail_menu_label">운영 정보</label>
              <ul class="detail_menu_subject">
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >이벤트</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >연락처</a
                  >
                </li>
                <li class="detail_menu_object">
                  <a href="#" target="_blank" rel="noopener noreferrer"
                    >윤리 및 규정 준수</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </nav>
        <div class="detail_info">
          <div class="miniJust_info">
            <span class="mini_text">
              다양한 쇼핑 방법 :
              <a class="mini_link" href="#">Store를 방문</a>하거나,
              <a class="mini_link" href="#">러셀러</a>를 찾아보거나,
              080-330-8877번으로 전화하세요.
            </span>
          </div>
          <hr />
          <div class="detail_info_rull">
            <div class="detail_info_rull_Contailner">
              <div class="detail_info_rull_Contailner_separated">
                <div class="detail_rull_open_div">
                  <span class="detail_rull_open">
                    Copyright &copy; 2022 Moon Inc. 모든 권리 보유.
                  </span>
                </div>
                <div class="detail_rull_terms_div">
                  <span class="detail_rull_terms">
                    <a href="#">개인정보 처리방침</a> |
                    <a href="#">웹 사이트 이용 약관</a> |
                    <a href="#">판매 및 환불</a> | <a href="#">법적 고지</a> |
                    <a href="#">사이트 맵</a>
                  </span>
                </div>
              </div>
              <div class="detail_country_name">
                <a href="#">대한민국</a>
              </div>
            </div>
            <div class="detail_rull_number">
              <span class="detail_rull_number_text">
                사업자등록번호 : 120-81-84429 | 통신판매업신고번호 : 제
                2011-서울강남-00810호 | 대표이사 : TAEWOONG MOON | 주소 :
                서울특별시 강남구 영동대로 512 | 대표전화 02-1234-5678 | 팩스 :
                02-1234-8976
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="detail_media_container">
        <div class="detail_media_zip">
          <ul class="detail_media_menu">
            <li class="detail_media_list">
              <a href="#">역사 및 알아보기</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">역사적 인물</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">계정</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">최대 영토</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">영화 & 다큐</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">교육</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">가치관</a>
              <a href="#">+</a>
            </li>
            <li class="detail_media_list">
              <a href="#">운영 정보</a>
              <a href="#">+</a>
            </li>
          </ul>
        </div>
        <div class="detail_media_info">
          <div class="detail_media_shopping">
            <span class="mini_text">
              다양한 쇼핑 방법 :
              <a class="mini_link" href="#">Store를 방문</a>하거나,
              <a class="mini_link" href="#">러셀러</a>를 찾아보거나,
              080-330-8877번으로 전화하세요.
            </span>
          </div>
          <div class="detail_media_country">
            <a href="#">대한민국</a>
          </div>
          <div class="detail_media_rull">
            <span class="detail_media__rull_open">
              Copyright &copy; 2022 Moon Inc. 모든 권리 보유.
            </span>
          </div>
          <div class="detail_media_rull_terms">
            <span class="detail_media_rull_terms">
              <a href="#">개인정보 처리방침</a>&ensp;|&ensp;
              <a href="#">웹 사이트 이용 약관</a>&ensp;|&ensp;
              <a href="#">판매 및 환불</a>&ensp;|&ensp;<a href="#">법적 고지</a
              >&ensp;|&ensp;
              <a href="#">사이트 맵</a>
            </span>
          </div>
          <div class="detail_media_rull_number">
            <span class="detail_media_rull_number_text">
              사업자등록번호 : 120-81-84429 | 통신판매업신고번호 : 제
              2011-서울강남-00810호 | 대표이사 :MOON | </span
            ><br />
            <span class="detail_media_rull_number_text">
              주소 : 서울특별시 강남구 영동대로 512 | 대표전화 02-1234-5678 |
              팩스 : 02-1234-8976
            </span>
          </div>
        </div>
      </div>
    </footer>
    
    <div class="todo_container">
      <div class="todo_header">
        <h3 class="todo_title">메모장</h3>
      </div>
      <form id="todo-form">
        <input type="text" placeholder="메모 입력" required />
      </form>
      <ul id="todo-list"></ul>
    </div>

    <script src="https://kit.fontawesome.com/6b7a2f6a5d.js"></script>
    <script src="resource/js/slide.js"></script>
    <script src="resource/js/jQueryUser.js"></script>
    <script src="resource/js/todo.js"></script>
  </body>
</html>
