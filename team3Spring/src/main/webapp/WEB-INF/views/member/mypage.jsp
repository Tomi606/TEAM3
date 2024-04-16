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
label {
	margin-left: 30px;
}
.program{
width: 500px;height: 300px;border: 1px solid black;

}
 
 .hos_my_page_inner{width: 100%; display:flex; flex-wrap: wrap;}
 .program_check_wrap{display: grid; grid-template-columns: 1fr 1fr; grid-gap: 20px;}
 /*아래부터 병원 마이페이지 구현
 패딩,마진은 상 우 하 좌 시계 방향으로 설정 하면 됨.
 */
 .mypage-container{width: 1905px;height:800px;padding: 0 300px 0 300px;border: 1px solid black;display: flex;}
 .mypage-profile{width: 400px;height: 100%;border: 1px solid black;}
 .profile-img{width: 250px;height: 250px;border:1px solid black;margin: 0 auto;margin-top: 50px;border-radius:100%;  }
 .profile-name{margin: 0 auto;text-align: center;}
 .profile-anything{border: 1px solid black;width: 300px;height: 400px;margin: 0 auto;}
 
 .profile-container{width: 1000px;height: 800px;border: 1px solid black; display: block;background-color: lightgray;}
 .mypage-profile-info{width: 600px;height: 325px;border: 1px solid black;margin: 40px 20px 40px 250px;background-color: pink;border-radius:30px; }
 .mypage-profile-detail{width: 600px;height:325px;border: 1px solid black; margin: 0px 20px 80px 250px;background-color: pink;border-radius:30px; }
 
 .profile-img-name-container{width: 600px;height: 150px;display: flex;}
 .mypage-img{display:flex;width: 125px;height: 125px;border:1px solid white;margin: 30px 0 0 30px;border-radius:100%;background-color: white;}
 .mypage-img-name{flex-direction: column;flex-wrap: wrap;align-content: space-between;display:flex; width: 400px;margin: 30px 0;height: 125px;padding: 20px;}
 .hr{width: 500px;border:1px solid black;margin:10px auto}
 
 
 .mypage-phone{width: 500px;margin: 0 auto;display: flex;}
 .mypage-email{width: 500px;margin: 0 auto;display: flex;}
 
 .mypage-hospital-name{display: flex;margin: 40px 48px 0 47px;}
 .mypage-hospital-num{display:flex;margin: 20px 48px 0 47px;}
 .mypage-hospital-address{display:flex;margin: 20px 48px 0 47px;}
 
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
	    // 데이터가 JSON 형식이라면 JSON.stringify()를 사용하여 객체를 문자열로 변환
	    // 서버로 보낼 데이터 타입
	    contentType: "application/json; charset=utf-8",
	    // 서버에서 보낸 데이터의 타입
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
		<h3>회원 정보 수정</h3>
		<div class="mypage-profile-info">
		<div class="profile-img-name-container">
			<div class="mypage-img">
			</div>
			<div class="mypage-img-name">
				<h4 style="display: flex;" class="box-name">\${member.me_name}</h4>
				<p style="margin-right: auto;">\${member.me_email}</p>
				<span ><button type="button" class="name-update">실명수정</button></span>
				<span ><a href="#" class="pw-update">비밀번호 변경</a></span>
			</div>
		</div>
			<div class="hr"></div>
			<div class="mypage-phone">
				<p style="margin-right: auto">\${member.me_phone}</p>
				<span><a href="#">변경</a></span>
			</div>
			<div class="hr"></div>
			<div class="mypage-email">
				<p style="margin-right: auto">\${member.me_email}</p>
				<span><a href="#">변경</a></span>
			</div>
		
		</div>
		<div class="mypage-profile-detail">
				<div class="mypage-hospital-name" >
					<h5 style="margin-right: auto">\${member.me_name}</h5>
					<span><a href="#">변경</a></span>
				</div>
				<div class="hr"></div>
				 <div class="mypage-hospital-address">
				 	<h5>직업 : </h5>
					<span style="margin-right: auto">\${member.me_job}</span>
					<span><a href="#">변경</a></span>
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
$(document).on('click','.name-update', function(){
	  initComment();
	  let nameBox = $(".box-name");
	  //댓글을 수정할 수 있는 textarea로 변경
	  let me_name = nameBox.text();
	  let str = `<input class="form-control box-name2" value="\${me_name}">`;
	  nameBox.after(str);
	  nameBox.hide();
	  
	  //수정/삭제 버튼을 감추고
	  $(".name-update").hide();
	  
	  //수정 완료 버튼을 추가
	  let me_id = '${member.me_id}';
	  str = `<button class="btn btn-outline-warning btn-complete">수정 완료</button>`;
	  $(".box-name").after(str);
	});

	$(document).on('click', '.btn-complete', function(){
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

</body>
</html>