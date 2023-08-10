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

