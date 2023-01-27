function idCheck(id) {
	regFrm.idbtncheck.value="idCheck";
	if(id == "") {
		alert("아이디를 입력하세요.");
		regFrm.id.focus();
		return;
	}
	url = "idCheck.jsp?id=" + id;
	window.open(url, "IDCheck", "width=300, height=200");
}

function inputIdChk() {
	regFrm.idbtncheck.value="idUncheck";
}

/*테스트*/
function test2() {
	//const pw = document.querySelector("#pw");
	let regExp = null;
	
	regExp = /^[0-9]{5,10}$/;
	if(!regExp.test(regFrm.pwd.value)) {
		alert("비밀번호의 길이는 최소 5자 이상 10자 이하로 입력해주세요");
		regFrm.pwd.focus();
		return;
	}
}


function idUnchecked() {
	if(regFrm.idbtncheck.value == "idUncheck") {
		alert("아이디 중복 체크를 해주세요.");
		return;
	}
}

function inputCheck() {
	
	if(regFrm.id.value == "") {
		alert("아이디를 입력하세요.");
		regFrm.id.focus();
		return;
	}
	let idExp = /^[a-z][a-z\d]{3,12}$/i;
	if(!idExp.test(regFrm.id.value)) {
		alert("첫글자는 반드시 영문자하고 영문자, 숫자 포함 총 4~12자로 입력하시오");
		regFrm.id.focus();
		return;
	}
	if(regFrm.idbtncheck.value == "idUncheck") {
		alert("아이디 중복 체크를 해주세요.");
		return;
	}
	if(regFrm.pwd.value == "") {
		alert("비밀번호를 입력하세요.");
		regFrm.pwd.focus();
		return;
	}
	let pwdExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
	if(!pwdExp.test(regFrm.pwd.value)) {
		alert("비밀번호는 영문자, 숫자, 특수문자로 총 8~15자로 입력하시오.");
		regFrm.pwd.focus();
		return;
	}
	if(regFrm.repwd.value == "") {
		alert("비밀번호를 한번 더 입력하세요.");
		regFrm.repwd.focus();
		return;
	}
	if(regFrm.pwd.value != regFrm.repwd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		regFrm.repwd.focus();
		return;
	}
	if(regFrm.name.value == "") {
		alert("이름을 입력하세요");
		regFrm.name.focus();
		return;
	}
	let nameExp = /^[가-힣]{2,5}$/;
	if(!nameExp.test(regFrm.name.value)) {
		alert("이름은 한글로만 2자 이상 5자 이하로 작성해주세요.");
		regFrm.name.focus();
		return;
	}
	if(regFrm.birthday.value == "") {
		alert("생일을 입력하세요");
		regFrm.birthday.focus();
		return;
	}
	if(regFrm.mm.value == "") {
		alert("월을 선택하세요.");
		regFrm.mm.focus();
		return;
	}
	if(regFrm.dd.value == "") {
		alert("일을 입력하세요.");
		regFrm.dd.focus();
		return;
	}
	if(regFrm.gender.value == "") {
		alert("성별을 입력하세요");
		regFrm.gender.focus();
		return;
	}
	if(regFrm.email.value == "") {
		alert("이메일을 입력하세요");
		regFrm.email.focus();
		return;
	}
	let emailExp = /[a-z0-9]+@[a-z]+\.[a-z]+(\.[a-z]+)?/;
	if(!emailExp.test(regFrm.email.value)) {
		alert("이메일 형식으로 다시 작성해주세요.");
		regFrm.email.focus();
		return;
	}
	if(regFrm.zipcode.value == "") {
		alert("우편번호를 검색하세요");
		regFrm.zipcode.focus();
		return;
	}
	
	regFrm.submit();
}