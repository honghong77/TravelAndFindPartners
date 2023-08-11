document.addEventListener('DOMContentLoaded', function () {
    const fileInput = document.getElementById('file-input');
    const defaultProfiles = document.querySelectorAll('.default-profiles img');
    const profileImage = document.querySelector('.profile img');

    fileInput.addEventListener('change', function (event) {
        const file = event.target.files[0];
		var imgsrc = document.querySelector('.imgsrc');
        if (file) {
            profileImage.src = URL.createObjectURL(file);
			imgsrc.value = URL.createObjectURL(file);
        }
    });

    defaultProfiles.forEach(function (defaultProfile) {
        defaultProfile.addEventListener('click', function () {
			var imgsrc = document.querySelector('.imgsrc');
			fileInput.value = null;
            profileImage.src = defaultProfile.src;
			imgsrc.value = defaultProfile.src;
        });
    });

    const btnOk = document.querySelector('.btn_ok');
    btnOk.addEventListener('click', function () {
        const fileInput = document.getElementById('file-input');
        const selectedImage = fileInput.files[0];

        if (selectedImage) {
            const reader = new FileReader();

            reader.onload = function(event) {
                const imgBase64 = event.target.result.split(',')[1]; // 이미지를 Base64로 변환하여 서버에 전송
                document.querySelector('input[name="imgsrc"]').value = imgBase64;
            };

            reader.readAsDataURL(selectedImage);
        }
        document.querySelector('form').submit(); // 폼 전송
    });

	function selectDefaultProfile(filename) {
    var encodedFilename = encodeURIComponent(filename);
    var imagePath = "http://localhost:8080/TravelAndFindPartners/profile/" + encodedFilename;
    
    // imagePath를 서버로 전달하거나 다른 로직을 추가할 수 있습니다.
	}
		
});

