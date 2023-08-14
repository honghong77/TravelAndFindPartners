<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="signStyle.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>

<body>
	<section class="sign">
        <h2>회원가입</h2>
        <div style="text-align: left;width: 100%;">입력사항<span class="strong_text">(필수)</span></div>
        <form id="frm_mem" method="post" action="/TravelAndFindPartners/sign">
            <table>
                <tr>
                    <!-- <td><span>id</span></td> -->
                    <td>
                        <div>
                            <input type="text" name="id" id="id" placeholder="이메일 주소"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <!-- <td><span>pw</span></td> -->
                    <td>
                        <div>
                            <input type="password" name="password" id="pw" maxlength='20'placeholder="비밀번호(8자~20자,영문+숫자+특수문자 사용)" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <!-- <td><span>이름</span></td> -->
                    <td>
                        <div>
                            <input type="text" name="name" id="name" placeholder="이름"/>
                        </div>
                    </td>
                </tr>
                <tr>
                    <!-- <td><span>nickname</span></td> -->
                    <td>
                        <div>
                            <input type="text" name="nickname" id="nickname" maxlength='6'placeholder="닉네임(2자 ~ 6자)" oninput="checkNicknameDuplication()"/>
                        </div>
                        <div id="nicknameCheckResult"></div>
                    </td>
                </tr>
                <tr>
                    <!-- <td><span>성별</span></td> -->
                    <td class="gender">
                        <input type="radio" name="gender" value="남자" id="man"/>
                        <label for="man" class="sel_gender">남자</label>
                        <input type="radio" name="gender" value="여자" id="woman"/>
                        <label for="woman" class="sel_gender">여자</label>
                    </td>
                </tr>
                <tr>
                    <!-- <td><span>생년월일</span></td> -->
                    <td>
                        <div>
                            <input type="text" name="birth" id="birth" placeholder="생년월일 (예 19950101)">
                        </div>
                    </td>
                </tr>
            </table>
        </form>
        <span class="btn_ok" onclick="submit_frm_mem()">가입하기</span>
    </section>
</body>
<script src="sign.js"></script>
</html>