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
        
  // 모달 창 가져오기 
    var modal = document.getElementById("customerServiceModal");

    // 고객 센터 버튼 가져오기
    var btn = document.querySelector(".button.customer-service");

    // 모달 닫기 버튼 가져오기
    var span = document.getElementsByClassName("close")[0];

    // 버튼을 클릭하면 모달 창 열기
    btn.onclick = function() {
      modal.style.display = "block";
    }

    // 모달 창의 닫기 버튼을 클릭하면 모달 닫기
    span.onclick = function() {
      modal.style.display = "none";
    }

    // 모달 바깥을 클릭하면 모달 닫기
    window.onclick = function(event) {
      if (event.target == modal) {
        modal.style.display = "none";
      }
    }       