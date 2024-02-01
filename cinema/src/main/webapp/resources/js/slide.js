	window.onload = function() {
    adjustSidebarHeight();
};

// 슬라이드바 높이를 조정하는 함수
function adjustSidebarHeight() {
    var sidebar = document.querySelector('.sidebar'); // 슬라이드바 요소 선택
    var contentHeight = document.querySelector('.content').offsetHeight; // 슬라이드바 안의 콘텐츠 높이

    // 콘텐츠 높이가 슬라이드바 높이보다 크다면 슬라이드바 높이를 콘텐츠 높이로 조정
    if (contentHeight > sidebar.offsetHeight) {
        sidebar.style.height = contentHeight + 'px';
    }
}