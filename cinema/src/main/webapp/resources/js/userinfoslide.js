	window.onload = function() {
    adjustSidebarHeight();
}
     
// 슬라이드바 높이를 조정하는 함수
function adjustSidebarHeight() {
    var sidebar = document.querySelector('.sidebar'); 
    var contentHeight = document.querySelector('.content').offsetHeight; 

    // 콘텐츠 높이가 슬라이드바 높이보다 크다면 슬라이드바 높이를 콘텐츠 높이로 조정
    if (contentHeight > sidebar.offsetHeight) {
        sidebar.style.height = contentHeight + 'px';
    }
}

		//모달창이 작동하는 함수
 		var deleteButton = document.getElementById("deleteButton");
        var modalContainer = document.getElementById("modalContainer");
        var confirmButton = document.getElementById("confirmDeleteButton");
        var cancelButton = document.getElementById("cancelDeleteButton");

        deleteButton.onclick = function() {
            modalContainer.style.display = "block";
        }

        cancelButton.onclick = function() {
            modalContainer.style.display = "none";
        }

        confirmButton.onclick = function() {
             window.location.href = '/userDelete/' + userId;
        }