$(function () {
  $(".hidden_ul .hidden_list").hover(
    function () {
      $(this).children(".hidden_nav").stop().slideDown();
    },
    function () {
      $(this).children(".hidden_nav").stop().slideUp();
    }
  );
});

