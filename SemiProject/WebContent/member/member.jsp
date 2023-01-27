<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../resource/css/styles12.css" />
	<script src="../resource/js/script8.js" charset="utf-8"></script>
	<!-- 우편번호 등록을 위한 js 코드 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function findAddr() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            document.getElementById('postcode').value = data.zonecode;
		            /* 
		            document.getElementById('addr').value = data.roadAddress;
		            document.getElementById('addr').value = data.jibunAddress; 
		            */
		            roadAddr = data.roadAddress;
		            jibunAddr = data.jibunAddress;
		            extraAddr = '';
		            
		            if(roadAddr != '') {
		            	if(data.bname != '') {
		            		extraAddr += data.bname;
		            	}
		            	if(data.buildingName != '') {
		            		extraAddr += (extraAddr != '') ? ',' + data.buildingName : data.buildingName;
		            	}
		            	
		            	roadAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
		            	document.getElementById('addr').value = roadAddr;
		            } else if(jibunAddr != '') {
		            	document.getElementById('addr').value = jibunAddr;
		            }
		            regFrm.detailAddress.focus();
		        }
		    }).open();
		}
	</script>
 </head>
 <body>
    <h1 class="member_logo">회원가입</h1>
    <form method="post" name="regFrm" action="memberProc.jsp">
      <div class="row_group">
      
        <!-- 아이디 -->
        <div class="join_row">
          <h3 class="join_title">
            <label for="id">아이디</label>
          </h3>
          <div class="id_checkbox">
            <span class="ps_box id_check_text">
              <input
                type="text"
                id="id"
                name="id"
                min="4"
                maxlength="12"
                onkeydown="inputIdChk();"
              />
            </span>
            <span class="ps_box id_check-btn">
              <input
                class="idChecked"
                type="button"
                value="ID중복확인"
                onclick="idCheck(this.form.id.value);"
              />
            </span>
            <span class="hidden">
              <!-- <input type="hidden" name="idbtncheck" value="idUncheck" /> -->
              <input type="hidden" name="idbtncheck" value="idUncheck" />
            </span>
          </div>
          <span class="error_text"></span>
        </div>

        <!-- 비밀번호 -->
        <div class="join_row">
          <h3 class="join_title">
            <label for="pw">비밀번호</label>
          </h3>
          <span class="ps_box">
            <input type="password" id="pw" name="pwd" min="4" max="15"/>
            <span class="step_url"><i class="fas fa-lock fa-lg"></i></span>
          </span>
          <span class="error_text">필수 정보 입니다.</span>
        </div>

        <!-- 비밀번호 확인 -->
        <div class="join_row">
          <h3 class="join_title">
            <label for="repw">비밀번호 재확인</label>
          </h3>
          <span class="ps_box">
            <input type="password" id="repw" name="repwd" />
            <span class="step_url"><i class="fas fa-user-lock fa-lg"></i></span>
          </span>
          <span class="error_text">필수 정보 입니다.</span>
        </div>

        <!-- 이름 -->
        <div class="join_row">
          <h3 class="join_title">
            <label for="name">이름</label>
          </h3>
          <span class="ps_box">
            <input id="name" name="name" min="2" max="5"/>
            <span class="step_url"></span>
          </span>
          <span class="error_text">필수 정보 입니다.</span>
        </div>

        <!-- 생년월일 -->
        <div class="join_row join-birthday">
          <h3 class="join_title">
            <label for="yy">생년월일</label>
          </h3>
          <div class="bir_wrap">
            <div class="bir_yy bir_ratio">
              <span class="ps_box">
                <input name="birthday" id="yy" placeholder="년(4자)" maxlength="4" min="4" />
              </span>
            </div>
            <div class="bir_mm bir_ratio">
              <span class="ps_box">
                <select name="mm" id="mm" class="sel">
                  <option value="">월</option>
                  <option value="01">1</option>
                  <option value="02">2</option>
                  <option value="03">3</option>
                  <option value="04">4</option>
                  <option value="05">5</option>
                  <option value="06">6</option>
                  <option value="07">7</option>
                  <option value="08">8</option>
                  <option value="09">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                </select>
              </span>
            </div>
            <div class="bir_dd bir_ratio">
              <span class="ps_box">
                <input
                  type="text"
                  id="dd"
                  name="dd"
                  placeholder="일"
                  maxlength="2"
                />
              </span>
            </div>
          </div>
          <span class="error_text">태어난 년도 4자리를 정확히 입력하세요.</span>
        </div>

        <!-- 성별 -->
        <div class="join_row join-sex">
          <h3 class="join_title">
            <label for="gender">성별</label>
          </h3>
          <div class="ps_box gender_code">
            <select name="gender" id="gender" class="sel">
              <option value="" selected>성별</option>
              <option value="m">남자</option>
              <option value="f">여자</option>
              <option value="u">선택안함</option>
            </select>
          </div>
          <span class="error_text">필수 정보 입니다.</span>
        </div>

        <!-- 이메일 -->
        <div class="join_row join-email">
          <h3 class="join_title">
            <label for="email">
              본인 확인 이메일<span class="terms_choice"></span>
            </label>
          </h3>
          <span class="ps_box int_email">
            <input
              type="email"
              id="email"
              name="email"
              placeholder="Ex.)abc@naver.com"
              maxlength="100"
            />
          </span>
        </div>

        <!-- 우편번호 -->
        <div class="zipcode_container">
          <h3 class="join_title">
            <label for="zipcodeName">
              우편번호<span class="terms_choice"></span>
            </label>
          </h3>
          <div class="zip_info">
            <span class="zip_code ps_box">
              <input
                type="text"
                name="zipcode"
                id="postcode"
                placeholder="우편번호"
                readonly
              />
            </span>
            <span class="zipcode_btn ps_box">
              <input
                id="zipcodeName"
                type="button"
                value="우편번호"
                onclick="findAddr();"
              />
            </span>
          </div>
        </div>

        <!-- 주소 -->
        <div class="address_container">
          <h3 class="join_title">
            <label for="zipcodeName">
              주소<span class="terms_choice"></span>
            </label>
          </h3>
          <div class="address_info">
            <span class="address_readCode ps_box">
              <input
                type="text"
                name="address"
                placeholder="주소"
                size="60"
                id="addr"
                readonly
              /><br />
            </span>
            <span class="detailAddress ps_box">
              <input type="text" name="detailAddress" placeholder="상세주소" />
            </span>
          </div>
        </div>

        <!-- 회원가입 버튼 -->
        <div class="member_btn_container">
          <span class="member_btns member_signUp_btn ps_box">
            <input type="button" value="회원가입" onclick="inputCheck();" />
          </span>
          <span class="member_btns member_reset_btn ps_box">
            <input type="reset" value="다시쓰기" />
          </span>
          <span class="member_btns member_login_btn ps_box">
            <input
              type="button"
              value="로그인"
              onclick="location.href='login.jsp'"
            />
          </span>
        </div>
        
      </div>
    </form>

    <script src="https://kit.fontawesome.com/6b7a2f6a5d.js"></script>
 </body>
</html>