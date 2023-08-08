function submit_frm_mem(){
    var id = document.getElementById("id").value;
    if (id == "") {
        alert("아이디를 입력해주세요.");
        document.getElementById("id").focus();
        return;   
    }
    if(!(/^[a-z0-9]+@[a-z]+\.[a-z]{2,3}$/.test(id))){
        alert("id 형식은 이메일 형식입니다..");
        document.getElementById("id").focus();
        return;   
    }
    var pw = document.getElementById("pw").value;
    if (pw == "") {
        alert("비밀번호를 입력해주세요.");
        document.getElementById("pw").focus();
        return;   
    }
    if (pw.length < 8) {
        alert("비밀번호는 최소 8글자입니다.");
        document.getElementById("pw").focus();
        return;   
    }
    // /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/
    if (!( /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test( pw ) )) {
        alert("영문, 숫자, 특수기호 조합으로 8-20자리 이상 입력해주세요.");
        document.getElementById("pw").focus();
        return;   
    }
    var name = document.getElementById("name").value;
    if (name == "") {
        alert("이름를 입력해주세요.");
        document.getElementById("name").focus();
        return;   
    }
    var nickname = $("#nickname").val();
    if (nickname == "") {
        alert("닉네임을 입력해주세요.");
        document.getElementById("nickname").focus();
        return;   
    }
    if (nickname.length < 2) {
        alert("닉네임은 최소 2글자 이상이어야 합니다.");
        document.getElementById("nickname").focus();
        return;   
    }

    var gender = document.querySelector('input[name="gender"]:checked');
    if (gender == null) {
        alert("성별을 선택해주세요.");
        document.getElementById("gender").focus();
        return;   
    }
    var birth = document.getElementById("birth").value;
    if (birth == "") {
        alert("생년월일을 입력해주세요.");
        document.getElementById("birth").focus();
        return;
    }

    var regex = /^(19|20)\d{2}-(0[1-9]|1[0-2])-([0-2][1-9]|3[01])$|^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
    if (!regex.test(birth)) {
        alert("생년월일 형식이 올바르지 않습니다. 예시: 19900101");
        document.getElementById("birth").focus();
        return;
    }
    $("#frm_mem").submit();
}

$(".sel_gender").click(function(){
    $(".sel_gender").css("background-color","#cccccc")
    $(this).css("background-color","var(--accent)");
});

$(document).ready(function() {
    // 닉네임 입력 필드를 벗어날 때마다 중복 확인
    $("#nickname").blur(function() {
        checkNickname();
    });
});

function checkNickname() {
    var nickname = $("#nickname").val();
    
    if (nickname === "") {
        return;
    }

    $.ajax({
        type: "POST",
        url: "/0801/checkNickname", // 중복확인 처리를 담당하는 서버 URL
        data: { nickname: nickname },
        dataType: "json",
        success: function(response) {
            if (response.isDuplicate) {
                alert("이미 사용 중인 닉네임입니다.");
            }
        },
        error: function(xhr, status, error) {
            console.error("서버와 통신 중 오류가 발생했습니다.");
        }
    });
}

function submit(id, pw, name, nickname, gender, birth) {
    // 닉네임 중복확인을 위한 AJAX 요청
    var nickname = $("#nickname").val();
    if (nickname == "") {
        alert("닉네임을 입력해주세요.");
        document.getElementById("nickname").focus();
        return;
    }

    $.ajax({
        type: "POST", // 예시로 POST 메서드 사용
        url: "/0801/checkNickname", // 중복확인 처리를 담당하는 서버 URL
        data: { nickname: nickname }, // 서버로 전송할 데이터
        dataType: "json",
        success: function (response) {
            if (response.isDuplicate) {
                alert("이미 사용 중인 닉네임입니다.");
            } else {
                // 닉네임 중복확인을 통과한 경우, 실제 회원가입 처리를 수행
                performSignup();
            }
        },
        error: function (xhr, status, error) {
            console.error("서버와 통신 중 오류가 발생했습니다.");
        }
    });
}

	function performSignup() {
    // 회원가입 처리를 위한 데이터 수집 및 AJAX 요청을 수행하는 로직 추가
    var id = document.getElementById("id").value;
    var pw = document.getElementById("pw").value;
    var name = document.getElementById("name").value;
    var nickname = $("#nickname").val();
    var gender = document.querySelector('input[name="gender"]:checked');
    var birth = document.getElementById("birth").value;

	let data_val = {
            id: id,
            password: pw,
            name: name,
            nickname: nickname,
            gender: gender,
            birth: birth
        };

	$.ajax({
        type: "GET",
        url: "/0801/sign", // SignUpServlet의 URL
        data: data_val,
		datatype: "json",
        success: function (response) {
            // 서버에서 응답을 받았을 때 처리하는 로직
            if (response === "success") {
                alert('회원가입이 완료되었습니다.');
            } else {
                alert('회원가입에 실패했습니다.');
            }
        },
        error: function (xhr, status, error) {
            // 서버와 통신 중 오류가 발생했을 때 처리하는 로직
            alert('서버와 통신 중 오류가 발생했습니다.');
        }
    });
}






