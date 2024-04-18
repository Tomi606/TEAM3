<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 마이페이지</title>
<style type="text/css">
.body-tag {
width: 100%;
display: felex;flex-direction: column;
align-items: center;
}
 .input-box {
	border:1px solid white;
	width: 100%;height:100%; 
	margin: 0 auto;
	padding: 5px;
} 
.input-tag {
    border: 1px solid #ccc; 
    outline: none;
    margin-bottom: 15px; 
    width: 400px;
    padding: 10px;
}
.input-tag:focus {
    border-bottom-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
.btn {
	text-decoration: none;
	border:1px solid  #C12DFF;
	width: 100px;
}
.btn:hover {
	background-color:  #C12DFF;
	color: white;
}
.signup-btn {
text-align:center;font-size:20px;font-weight:bold;
width: 400px;height:40px;border-radius:0;
padding: 2px;border-bottom: 1px solid  #C12DFF;
margin-left:34px;
}
select {
	margin-left:34px;
    padding: 10px;
    font-size: 16px; 
    border: 1px solid #ccc; 
    background-color: #ffff; 
    outline: none; 
    width: 200px; 
}
select:focus {
    border-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
select:hover {
    background-color: #eaeaea;
}
img {
 width: 30px;
}
.duplicate {
    float:right;
	border-radius:0;
	height: 43px;
}
 
.program{
width: 500px;height: 300px;border: 1px solid black;

}
 
 .hos_my_page_inner{width: 100%; display:flex; flex-wrap: wrap;}
 .program_check_wrap{display: grid; grid-template-columns: 1fr 1fr; grid-gap: 20px;}
 /*아래부터 병원 마이페이지 구현
 패딩,마진은 상 우 하 좌 시계 방향으로 설정 하면 됨.
 */
 .mypage-container{width: 1905px;height:800px;padding: 0 300px 0 300px;display: flex;}
 .mypage-profile{width: 400px;height: 100%;    border-left: 1px solid lightgray;
    border-right: 1px solid lightgray;}
 .profile-img{width: 250px;height: 250px;border:1px solid black;margin: 0 auto;margin-top: 50px;border-radius:100%;  }
 .profile-name{margin: 0 auto;text-align: center;}
 .profile-anything{border: 1px solid black;width: 300px;height: 400px;margin: 0 auto;}
 
 .profile-container{width: 1000px;height: 800px; display: block;}
 .mypage-profile-info{width: 600px;height: 325px;border: 1px solid black;margin: 40px 20px 40px 250px;background-color: #FFE1E6;border-radius:30px; }
 .mypage-profile-detail{width: 600px;height:325px;border: 1px solid black; margin: 0px 20px 80px 250px;background-color: #FFE1E6;border-radius:30px; }
 
 .profile-img-name-container{width: 600px;height: 150px;display: flex;}
 .mypage-img{display:flex;width: 125px;height: 125px;border:1px solid white;margin: 30px 0 0 30px;border-radius:100%;background-color: white;}
 .mypage-img-name{flex-direction: column;flex-wrap: wrap;align-content: space-between;display:flex; width: 400px;margin: 30px 0;height: 125px;padding: 20px;}
 .hr{width: 500px;border:1px solid black;margin:10px auto}
 
 
 .mypage-phone{width: 500px;margin: 0 auto;display: flex;flex-direction: row;justify-content: space-between;}
 .mypage-email{width: 500px;margin: 0 auto;display: flex;flex-direction: row;justify-content: space-between;}
 
 .mypage-hospital-name{display: flex;margin: 40px 48px 0 47px;}
 .mypage-hospital-num{display:flex;margin: 20px 48px 0 47px;}
 .mypage-job{display:flex;margin: 20px 48px 0 47px;flex-direction: row;justify-content: space-between;}
 .mypage-hospital-address{display:flex;margin: 20px 48px 0 47px;}
 
 .new_me_name_hidden{width:180px;display:none;}
 .new_me_name_hidden input{width:250px; /* font-size: 1.5rem; */}
 .name_save_btn_wrap{display:none;}
 
 .new_me_phone_hidden{width:180px;display:none;}
/*  .new_me_phone_hidden input{ font-size: 1.5rem;} */
 .phone_save_btn_wrap{display:none;} 
 
 .new_me_email_hidden{width:180px;display:none;}
 /* .new_me_email_hidden input{} */
 .email_save_btn_wrap{display:none;} 
 
 .new_me_job_hidden{width:180px;display:none;}
 .new_me_job_hidden input{ width:300px;position: relative;}
 .job_save_btn_wrap{display:none;} 
 .box-name2{position: relative;}
.modal {
  display: none; 
  position: fixed; 
  z-index: 990; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgba(0,0,0,0.7);
}
.modal-content {
  background-color: #fefefe; 
  margin: 15% auto; 
  padding: 20px;
  border: 1px solid #888;
  width: 500px;
  text-align: center;
}

.close {
  color: #aaa; 
  margin: 0 24px 8px auto;
  font-size: 50px;
  font-weight: bold; 
}

.close:hover,
.close:focus {
  color: black; 
  text-decoration: none; 
  cursor: pointer;
}
.new_me_pw_hidden input{
width: 300px;
}
</style>
</head>
<body>
<div class="mypage-container">
</div>
<!-- 마이페이지 리스트 -->
<script type="text/javascript">
getMypage();
function getMypage() {
	  $.ajax({
	    async: true,
	    url: '<c:url value="/member/list"/>',
	    type: 'post',
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function(data) {
	      console.log(data.member);
	      getMypageInfo(data.member);
	    },
	    error: function(jqXHR, textStatus, errorThrown) {

	    }
	  });
}
function getMypageInfo(member) {
	if(member == null || member.length == 0)
		return;
	var str =
		`
		<div class="mypage-profile">
		
			<div class="profile-img">
			</div>
			<div class="profile-name">
				<h4>${member.me_id}</h4>
				<p>${member.me_email}</p>
			</div>
			<div class="profile-anything">
				<div>				
					<a href='<c:url value=""/>'>1. 예약 관리</a><br>
					<a href='<c:url value=""/>'>2. 북마크</a><br>
					<a href='<c:url value=""/>'>3. 내 커뮤니티</a>
				</div>
			</div>
		</div>
	<div class="profile-container">
		<div class="mypage-profile-info">
		<div class="profile-img-name-container">
			<div class="mypage-img">
			</div>
			<div class="mypage-img-name">
				<h4 style="display: flex;" class="box-name">\${member.me_name}</h4>
				<div class="new_me_name_hidden">
					<input type='text' id="new_me_name" class="box-name2" value="\${member.me_name}"/>
				</div>
				<p style="margin-right: auto;">\${member.me_email}</p>
				<span class="name_update_btn_wrap"><button type="button" class="name-update">실명수정</button></span>
				<span class="name_save_btn_wrap"><button type="button" class="name_save_btn">수정완료</button></span>
				<span class="pw_update_btn_wrap"><button type="button" class="pw-update">비밀번호 변경</button></span>
				<!-- 모달 창 -->
				<div id="myModal" class="modal">
				  <div class="modal-content">
				    <span class="close">&times;</span>
				    <h2>비밀번호 변경</h2>
				    <!-- 비밀번호 입력 필드가 모달 안으로 이동 -->
				    <label for="old_me_pw">현재 비밀번호를 입력하세요</labe>
				    <div class="new_me_pw_hidden">
				      <input type='text' id="old_me_pw" name="me_pw" class="box-pw2"/>
				    </div>
				    
				    <label for="new_me_pw">새 비밀번호를 입력하세요</labe>
				    <div class="new_me_pw_hidden">
				      <input type='password' id="new_me_pw" name="me_pw" class="box-pw2"/>
				    </div>
				    <label for="new_me_pw">새 비밀번호 확인</labe>
				    <div class="new_me_pw_hidden">
				      <input type='password' id="new_me_pw2"name="me_pw2" class="box-pw2"/>
				    </div>
				    
				    <button type="button" class="pw-update-success-btn">비밀번호 변경하기</button>
			  	</div>
				  <!-- 모달 끝 -->
				</div>
			</div>
		</div>
			<div class="hr"></div>
			<div class="mypage-phone">
				<div class="new_me_phone_hidden">
					<input type='text' id="new_me_phone" class="box-phone2" value="\${member.me_phone}"/>
				</div>	
				<p style="margin-right: auto" class="box-phone">\${member.me_phone}</p>
				<span class="phone_update_btn_wrap"><button type="button" class="phone-update">변경</button></span>
				<span class="phone_save_btn_wrap"><button type="button" class="phone_save_btn">수정완료</button></span>
			</div>
			<div class="hr"></div>
			<div class="mypage-email">
				<div class="new_me_email_hidden">
					<input type='text' id="new_me_email" class="box-email2" value="\${member.me_email}"/>
				</div>	
				<p style="margin-right: auto"  class="box-email">\${member.me_email}</p>
				<span class="email_update_btn_wrap"><button type="button" class="email-update">변경</button></span>
				<span class="email_save_btn_wrap"><button type="button" class="email_save_btn">수정완료</button></span>
			</div>
		
		</div>
		<div class="mypage-profile-detail">
				 <div class="mypage-job">
				 	<h5>직업 : </h5>
					 <div class="new_me_job_hidden">
						<input type='text' id="new_me_job" class="box-job2" value="\${member.me_job}"/>
					</div>	
					<span style="margin-right: auto" class"box-job">\${member.me_job}</span>
					<span class="job_update_btn_wrap"><button type="button" class="job-update">변경</button></span>
					<span class="job_save_btn_wrap"><button type="button" class="job_save_btn">수정완료</button></span>
				</div>
				<div class="hr"></div>
				<div class="mypage-hospital-address">
					<p style="margin-right: auto">\${member.me_address}</p>
					<span><a href="#">변경</a></span>
				</div>
			</div>
 		</div>
		`;	
$('.mypage-container').html(str);
}
</script>
<!--이름 수정 -->
<script type="text/javascript">
function resetAll() {
    $('.box-name').css('display', 'block');
    $('.name_update_btn_wrap').css('display', 'block');
    $('.new_me_name_hidden').css('display', 'none');
    $('.name_save_btn_wrap').css('display', 'none');

    $('.box-phone').css('display', 'block');
    $('.phone_update_btn_wrap').css('display', 'block');
    $('.new_me_phone_hidden').css('display', 'none');
    $('.phone_save_btn_wrap').css('display', 'none');

    $('.box-email').css('display', 'block');
    $('.email_update_btn_wrap').css('display', 'block');
    $('.new_me_email_hidden').css('display', 'none');
    $('.email_save_btn_wrap').css('display', 'none');

    $('.box-job').css('display', 'block');
    $('.job_update_btn_wrap').css('display', 'block');
    $('.new_me_job_hidden').css('display', 'none');
    $('.job_save_btn_wrap').css('display', 'none');
}

$(document).on('click','.name-update', function(){
    resetAll();
    $('.box-name').css('display', 'none');
    $('.name_update_btn_wrap').css('display', 'none');
    $('.new_me_name_hidden').css('display', 'block');
    $('.name_save_btn_wrap').css('display', 'block');
});
/*비밀번호 수정 모델창 띄우기 하기*/
 
  
$(document).on('click','.phone-update', function(){
    resetAll();
    $('.box-phone').css('display', 'none');
    $('.phone_update_btn_wrap').css('display', 'none');
    $('.new_me_phone_hidden').css('display', 'block');
    $('.phone_save_btn_wrap').css('display', 'block');
});

$(document).on('click','.email-update', function(){
    resetAll();
    $('.box-email').css('display', 'none');
    $('.email_update_btn_wrap').css('display', 'none');
    $('.new_me_email_hidden').css('display', 'block');
    $('.email_save_btn_wrap').css('display', 'block');
});

$(document).on('click','.job-update', function(){
    resetAll();
    $('.box-job').css('display', 'none');
    $('.job_update_btn_wrap').css('display', 'none');
    $('.new_me_job_hidden').css('display', 'block');
    $('.job_save_btn_wrap').css('display', 'block');
});

	$(document).on('click', '.name_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    me_name : $('.box-name2').val(),
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/name"/>',
	    type : 'post',
	    data : JSON.stringify(member),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function (data){
	      if(data.res){
	        alert("이름을 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me);
			return;	        
	      }else{
	        alert("이름을 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});

//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	  $('.btn-complete').remove();
	  $('.box-name2').remove();
	  $('.box-btn').show();
	  $('.box-name').show();
	  $(".name-update").show();
}


</script>
<!-- 폰 번호 수정 -->
<script type="text/javascript">

	$(document).on('click', '.phone_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    me_phone : $('.box-phone2').val(),
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/phone"/>',
	    type : 'post',
	    data : JSON.stringify(member),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function (data){
	      if(data.res){
	        alert("휴대폰 번호를 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me);
			return;	        
	      }else{
	        alert("휴대폰 번호를 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});

//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	  $('.btn-complete').remove();
	  $('.box-phone2').remove();
	  $('.box-btn').show();
	  $('.box-phone').show();
	  $(".name-update").show();
}


</script>
<!-- 이메일 수정 -->
<script type="text/javascript">
	$(document).on('click', '.email_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    me_email : $('.box-email2').val(),
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/email"/>',
	    type : 'post',
	    data : JSON.stringify(member),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function (data){
	      if(data.res){
	        alert("이메일을 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me);
			return;	        
	      }else{
	        alert("이메일을 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});

//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	  $('.btn-complete').remove();
	  $('.box-email2').remove();
	  $('.box-btn').show();
	  $('.box-email').show();
	  $(".name-update").show();
}


</script>
<!-- 직업 수정 -->
<script type="text/javascript">
	$(document).on('click', '.job_save_btn', function(){
	  //전송할 데이터를 생성 => 댓글 수정 => 댓글 번호, 댓글 내용
	  let member = {
	    me_job : $('.box-job2').val(),
	    me_id : '${member.me_id}'
	  };
	  console.log(member);
	  //서버에 ajax로 데이터를 전송 후 처리
	  $.ajax({
	    async : true,
	    url : '<c:url value="/member/job"/>',
	    type : 'post',
	    data : JSON.stringify(member),
	    contentType : "application/json; charset=utf-8",
	    dataType : "json",
	    success : function (data){
	      if(data.res){
	        alert("직업을 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me);
			return;	        
	      }else{
	        alert("직업을 수정하지 못했습니다.");
	        return;
	      }
	    },
	    error : function(jqXHR, textStatus, errorThrown){

	    }
	  });
	});
//수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
function initComment(){
	  $('.btn-complete').remove();
	  $('.box-job2').remove();
	  $('.box-btn').show();
	  $('.box-job').show();
	  $(".job-update").show();
}


</script>
<script type="text/javascript">
$(document).ready(function() {
	  // 비밀번호 변경 버튼 클릭 시
	  $(document).on('click', '.pw-update', function() {
	    resetAll();
	    // 모달 창 보이기
	    $("#myModal").css("display", "block");
	  });

	  // 닫기 버튼 클릭 시 모달 닫기
	  $(document).on('click', '.close', function() {
	    $("#myModal").css("display", "none");
	  });

	  // 비밀번호 변경 확인 버튼 클릭 시
	  $(document).on('click', '.pw-update-success-btn', function() {
	    var oldPw = $('#old_me_pw').val();
	    var newPw = $('#new_me_pw').val();
	    var newPwCheck = $('#new_me_pw2').val();

	    if (newPw == newPwCheck) {
	      updatePassword(oldPw, newPw);
	    } else {
	      alert("새로운 비밀번호가 일치하지 않습니다.");
	    }
	  });

	});
	function updatePassword(oldPw, newPw) {
	  let member = {
		  oldPw: oldPw,
		  newPw: newPw,
    	  me_id: '${member.me_id}'
	  };
	  // 비밀번호 업데이트 AJAX 요청
	  $.ajax({
	    async: true,
	    url: '<c:url value="/member/pw"/>',
	    type: 'post',
	    data:  {
	    	oldPw: oldPw,
	    	newPw: newPw,
		    me_id: '${member.me_id}'
		  },
	    success: function(data) {
	      if (data.res) {
	        alert("비밀번호를 수정했습니다.");
	        initComment();
	        getMypageInfo(data.me);
	      } else {
	        alert("비밀번호를 수정하지 못했습니다.");
	      }
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      // 오류 처리
	    }
	  });
	}

	// 수정 버튼을 누른 상태에서 다른 수정 버튼을 누르면 기존에 누른 댓글을 원상태로 돌려주는 함수
	function initComment() {
	  $('.btn-complete').remove();
	  $('.box-pw2').remove();
	  $('.box-btn').show();
	  $('.box-pw').show();
	  $(".job-update").show();
	}
</script>
</body>
</html>