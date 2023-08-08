document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = document.querySelectorAll('.btn-check');
        const checkboxes2 = document.querySelectorAll('.btn-check2');

        function handleCheckboxChange(event) {
            const checkbox = event.target;
            const label = document.querySelector(`[for="${checkbox.id}"]`);
            const isBtnCheck = checkbox.classList.contains('btn-check');

            // 체크박스가 btn-check인지 btn-check2인지 확인
            if (isBtnCheck) {
                // btn-check 클래스를 가진 체크박스의 선택된 개수를 세어봅니다.
                const selectedCount = document.querySelectorAll('.btn-check:checked').length;

                if (selectedCount <= 3) {
                    // 클래스 토글 및 라벨 업데이트
                    if (checkbox.checked) {
                        label.classList.add('btn-checked');
                        checkbox.classList.add('btn-toggle');
                    } else {
                        label.classList.remove('btn-checked');
                        checkbox.classList.remove('btn-toggle');
                    }
                } else {
                    // 3개를 초과하면 더 이상 선택하지 못하게 막습니다.
                    checkbox.checked = false;
                }
            } else {
                // btn-check2 클래스를 가진 체크박스에 대해서도 비슷한 로직을 적용합니다.
                const selectedCount2 = document.querySelectorAll('.btn-check2:checked').length;

                if (selectedCount2 <= 6) {
                    if (checkbox.checked) {
                        label.classList.add('btn-checked');
                        checkbox.classList.add('btn-toggle');
                    } else {
                        label.classList.remove('btn-checked');
                        checkbox.classList.remove('btn-toggle');
                    }
                } else {
                    checkbox.checked = false;
                }
            }
        }

        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('change', handleCheckboxChange);
        });

        checkboxes2.forEach(function (checkbox) {
            checkbox.addEventListener('change', handleCheckboxChange);
        });

        function getSelectedItems() {
            const selectedItems = [];
            document.querySelectorAll('.btn-checked').forEach(function (label) {
                selectedItems.push(label.textContent);
            });
            return selectedItems;
        }
    });
/*
    function goToProfileSelection() {
        window.location.href = "../0801/WebContent/profile/profile.jsp";
    }
*/
	function getSelectedItems() {
    const selectedItems = [];
    document.querySelectorAll('.btn-checked').forEach(function (label) {
        selectedItems.push(label.textContent);
    });
    return selectedItems;
	}
	
	function goToProfileSelection() {
    const selectedItems = getSelectedItems();

	$('#ct_frm').submit();
	}    
// 서버로 선택한 항목을 전송하는 비동기 요청 (Ajax 등)을 수행합니다.
    // 이때 선택한 항목을 서버로 보내는 방식은 POST 요청 또는 다른 방식을 사용할 수 있습니다.

    // 예시로 jQuery를 사용한 Ajax 요청
/*
    $.ajax({
        url: '/0801/tendency', // 서버의 저장 처리를 수행하는 URL
        method: 'POST',
        data: { selectedItems: selectedItems }, // 선택한 항목을 서버에 전송
		datatype: "json",
        success: function(response) {
            // 서버로부터의 응답 처리
            console.log(response); // 서버 응답을 콘솔에 출력
            window.location.href = "/tendency/WebContent/profile/profile.jsp"; // 다음 페이지로 이동
        },
        error: function(error) {
            console.error(error); // 오류 발생 시 콘솔에 출력
        }
    });
*/
