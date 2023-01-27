$(function () {  
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