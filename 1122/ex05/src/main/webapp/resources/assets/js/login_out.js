/**
 * 
 */

 function logout(){
	    $.ajax({
	        type: "POST",
	        url: "/main/logout",
	        success: function(response) {
	            console.log(response); // 서버 응답 확인
	            // 서버로부터 받은 리디렉션 URL을 사용하여 페이지 이동
	            window.location.href = "/main/login";
	        },
	        error: function(xhr, status, error) {
	            alert("로그아웃 중 오류가 발생했습니다.");
	        }
		});
	};

	
$(document).ready(function() {
    // 세션 상태 확인
    checkSession();

    function checkSession() {
        $.ajax({
            url: '/path/to/session-check-endpoint',
            type: 'GET',
            success: function(response) {
                if(!response.isLoggedIn) {
                    window.location.href = '/main/login'; // 세션이 없으면 로그인 페이지로 리디렉션
                }
            }
        });
    }
});