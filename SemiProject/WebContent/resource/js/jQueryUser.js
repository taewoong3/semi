$(function () {
  // 각각 목록 내려오기
  // $(".nav > li").mouseover(function () {
  //   $(this).children(".subMenu").stop().slideDown();
  // });
  // $(".nav > li").mouseout(function () {
  //   $(this).children(".subMenu").stop().slideUp();
  // });

  $(".nav > li").hover(
    function () {
      $(this).children(".subMenu").stop().slideDown();
    },
    function () {
      $(this).children(".subMenu").stop().slideUp();
    }
  );

  // 이미지 왼쪽으로 슬라이드
  setInterval(slide, 2000);

  let x = $("#imgSlide > img");
  let y = 3;
  function slide() {
    y--;
    if (y == 0) {
      x.fadeIn();
      y = 3;
    } else {
      x.eq(y).fadeOut();
    }
  }
});

// siblings() : 형제 요소 선택자
