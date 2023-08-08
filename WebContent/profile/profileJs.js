document.addEventListener('DOMContentLoaded', function () {
    const fileInput = document.getElementById('file-input');
    const defaultProfiles = document.querySelectorAll('.default-profiles img');
    const profileImage = document.querySelector('.profile img');

    fileInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
        if (file) {
            profileImage.src = URL.createObjectURL(file);
        }
    });

    defaultProfiles.forEach(function (defaultProfile) {
        defaultProfile.addEventListener('click', function () {
            profileImage.src = defaultProfile.src;
        });
    });
});

function goToLoginPage() {
    window.location.href = "/0801/login"; 
}

function saveProfileSelection() {
    const selectedProfileImageSrc = document.querySelector('.profile img').src;
    const userId = '<%= session.getAttribute("userId") %>';

    // 서버에 선택한 프로필 정보를 전송하고 업데이트합니다.
    fetch('/0801/src/profile', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            userId: userId,
            selectedProfileImageSrc: selectedProfileImageSrc,
        }),
    }).then(response => {
        if (response.ok) {
            goToLoginPage();
        } else {
            console.error('프로필 정보 업데이트 실패');
        }
    }).catch(error => {
        console.error('네트워크 에러:', error);
    });
}