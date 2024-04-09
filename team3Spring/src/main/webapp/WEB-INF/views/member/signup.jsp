<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- 제이쿼리 CDN 방식 -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>
</head>
<body>
	<form id="myForm" action="<c:url value="/member/signup"/>"
		method="post">
		<select name="sd_num" required>
			<option value="none">시/도를 선택해주세요</option>
			<c:forEach items="${sidoList}" var="sd">
				<option value="${sd.sd_num}">${sd.sd_name}</option>
			</c:forEach>
		</select> <select name="sgg_num" class="sgg_num" required>
			<option value="none">시/군/구를 선택해주세요</option>
		</select> <select name="emd_num" class="emd_num" required>
			<option value="none">읍/면/동을 선택해주세요</option>
		</select>
		<div>
			<label for="subject">관심 과목</label> <select id="subject"
				name="me_hs_num">
				<option value="none">관심 과목을 선택하세요</option>
				<option value="none">없음</option>
				<c:forEach items="${list}" var="hs">
					<option value="${hs.hs_num}">${hs.hs_title}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<input type="text" id="id" name="me_id" placeholder="아이디">
			<button type="button" class="check-duplicate">중복 확인</button>
			<br>

		</div>
		<div>
			<input type="hidden" id="id2" name="site_id">
		</div>
		<div>
			<input type="password" id="pw" name="me_pw" placeholder="비밀번호"><br>
		</div>
		<div>
			<input type="password" id="pw2" name="me_pw2" placeholder="비밀번호 확인"><br>
		</div>
		<div>
			<input type="text" id="name" name="me_name" placeholder="이름" required><br>
		</div>
		<div>
			<input type="text" id="front-num" name="me_frontNum"
				placeholder="주민등록번호 앞자리" maxlength="6"> <input type="text"
				id="back-num" name="me_backNum" placeholder="주민등록번호 뒷자리"
				maxlength="7" oninput="checkRRN()"><br>
		</div>
		<div>
			<label for="me_gender">성별:</label> <input type="radio" id="male"
				name="me_gender" value="남자">남자 <input type="radio"
				id="female" name="me_gender" value="여자">여자<br>
		</div>
		<div>
			<input type="text" id="job" name="me_job" placeholder="직업"><br>
		</div>
		<div>
			<input type="text" id="phone" name="me_phone" placeholder="폰번호"><br>
		</div>
		<div>
			<input type="text" id="email" name="me_email" placeholder="이메일">
			<button type="button" class="email-btn">중복확인</button>
			<br> <span id="email-text"></span><br>

		</div>
		<div>
			<input type="text" id="address" name="me_address" placeholder="주소"><br>
		</div>
		<div>
			<button type="submit" id="land1" onclick="meIdForm()" class="check">회원가입</button>
		</div>
	</form>
	<!-- me_id입력 시 site_id값도 me_id랑 같은 값 입력 -->
	<script type="text/javascript">
		function meIdForm() {
			var meId = $("#id").val();
			$("#id2").val(meId);
			return true;
		}
	</script>
	<!-- 주민 뒷 자리 1,2,3,4로 시작하면 알맞은 성별 자동 체크 -->
	<script>
		//뒷자리 1,2,3,4 입력시 알맞는 성별 자동 선택
		//주민번호에 숫자 외 다른 글자를 입력하면 입력 안되게 하기 구현 중 
		$(document).ready(
				function() {
					$("#male").prop("disabled", true);
					$("#female").prop("disabled", true);

					$("#back-num").on(
							"input",
							function() {
								var backNum = $(this).val();
								var male = $("#male");
								var female = $("#female");

								male.prop("checked", false);
								female.prop("checked", false);
								male.prop("disabled", true);
								female.prop("disabled", true);

								if (backNum.charAt(0) === '1'
										|| backNum.charAt(0) === '3') {
									male.prop("checked", true);
									female.prop("checked", false);
									female.prop("disabled", true);
									male.prop("disabled", false);
								} else if (backNum.charAt(0) === '2'
										|| backNum.charAt(0) === '4') {
									male.prop("checked", false);
									female.prop("checked", true);
									male.prop("disabled", true);
									female.prop("disabled", false);
								}
							});
				});
	</script>
	<!-- 회원가입 정규 표현식 -->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$("form")
									.validate(
											{
												rules : {
													me_id : {
														required : true,
														regex : /^\w{8,15}$/
													// 아이디는 8~15자의 영문자와 숫자로 이루어져야 함
													},
													me_pw : {
														required : true,
														regex : /^[a-zA-Z0-9!@#$]{8,18}$/
													// 비밀번호는 8~18자의 영문자, 숫자, 특수문자(!@#$)로 이루어져야 함
													},
													me_pw2 : {
														equalTo : pw
													// 비밀번호 확인은 이전 비밀번호와 일치해야 함
													},
													me_name : {
														required : true,
														regex : /^[ㄱ-힣]{2,5}$/
													// 이름은 2~5글자의 한글로 이루어져야 함
													},
													me_frontNum : {
														required : true,
														regex : /^[0-9]{6}$/
													// 주민등록번호 앞자리는 6자리의 숫자로 이루어져야 함
													},
													me_backNum : {
														required : true,
														regex : /^[0-9]{7}$/
													// 주민등록번호 뒷자리는 7자리의 숫자로 이루어져야 함
													},
													me_job : {
														required : true,
														regex : /^[ㄱ-힣]{2,10}$/
													// 직업은 2~10글자의 한글로 이루어져야 함
													},
													me_phone : {
														required : true,
														regex : /^[0-9]{11}$/
													// 전화번호는 11자리의 숫자로 이루어져야 함
													},
													me_email : {
														required : true,
														email : true
													// 이메일 형식이어야 함
													},
													me_address : {
														required : true,
														regex : /^[ㄱ-힣0-9]{1,100}$/
													// 주소는 한글과 숫자로 이루어진 최대 100자여야 함
													}
												},
												messages : {
													me_id : {
														required : "아이디 중복확인을 해주세요.",
														regex : "아이디는 최소 8자에서 15자로 입력해주세요."
													},
													me_pw : {
														required : "필수 항목입니다.",
														regex : "비밀번호는 숫자, 영문, !@#$ 8~18자 입니다."
													},
													me_pw2 : {
														equalTo : "비밀번호와 일치하지 않습니다."
													},
													me_name : {
														required : "필수 항목입니다.",
														regex : "이름은 최대 5자 입니다."
													},
													me_frontNum : {
														required : "필수 항목입니다.",
														regex : "주민번호 앞 자리는 최대 6자이고 숫자만 가능합니다."
													},
													me_backNum : {
														required : "필수 항목입니다.",
														regex : "주민번호 뒷 자리는 최대 7자이고 숫자만 가능합니다."
													},
													me_job : {
														required : "필수 항목입니다.",
														regex : "한글로 입력하세요. 직업은 최대 10자까지 가능합니다."
													},
													me_phone : {
														required : "필수 항목입니다.",
														regex : "전화번호는 '-'제외한 번호를 입력하세요."
													},
													me_email : {
														required : "필수 항목입니다.",
														email : ""
													},
													me_address : {
														required : "필수 항목입니다.",
														regex : "주소를 제대로 입력하세요."
													}
												},
												errorPlacement : function(
														error, element) {
													element
															.addClass("shake-error");
													error
															.addClass("text-danger");
													error.appendTo(element
															.parent());
												},
												success : function(label) {
													var element = $(label)
															.closest('div')
															.find('#pw', '#id',
																	'#email',
																	'#phone');
													element
															.removeClass("shake-error");
													element.siblings(
															".text-danger")
															.remove();
													element.siblings(
															".text-success")
															.remove();
													if (element.val()
															&& !element
																	.next(".text-success").length) {
														element
																.after('<span class="text-success">사용 가능합니다.</span>');
													}
												}
											});

						});
		$.validator.addMethod("regex", function(value, element, regexp) {
			var re = RegExp(regexp);
			return this.optional(element) || re.test(value);
		}, "정규표현식에 맞지 않습니다.")
	</script>
	<!-- 아이디 중복체크 ajax -->
	<script type="text/javascript">
		$(document).ready(
				function() {
					$(".check-duplicate").click(
							function() {
								var id = $("#id").val();
								if (id.length == 0) {
									alert("아이디를 입력해주세요.");
									return;
								}
								if (/[\u3131-\uD79D]/.test(id)
										|| /[!@#$%^&*(),.?":{}|<>]/.test(id)) {
									alert("한글이나 특수문자는 아이디로 사용할 수 없습니다.");
									return;
								}
								if (!/^\w{8,15}$/.test(id)) {
									alert("아이디는 최소 8자에서 15자로 입력 해주세요.")
									return;
								}

								$.ajax({
									url : '<c:url value="/checkId"/>',
									type : "get",
									data : {
										me_id : id
									},
									success : function(response) {

										if (response.check == null) {
											alert("사용 가능한 아이디입니다.");
											return true;
										} else {
											alert("이미 사용 중인 아이디입니다.");
											return false;
										}
									},
									error : function(xhr, status, error) {
										console.error("에러에러", error);
									}
								});
							});
				});
	</script>
	<!-- 시/도,시/군/구,읍/면/동 ajax -->
	<script type="text/javascript">
		function hoIdForm() {

			var hoId = document.getElementById("id").value;
			document.getElementById("id2").value = hoId;
			document.getElementById("myForm").submit();

			//비번 일치 확인
			var pw = document.getElementById("pw").value;
			var pw2 = document.getElementById("pw2").value;

			if (pw !== pw2) {
				console.log("비번 불일치");
				return false;
			} else if (pw === pw2) {
				console.log("비번 일치");
				return true;
			} else {
				return false;
			}
		}

		/* 군 구 리스트 select로 띄우기 시작 */
		$("[name=sd_num]")
				.click(
						function() {
							let sd_num = $("[name=sd_num]").val();
							$
									.ajax({
										method : "post",
										url : '<c:url value="/member/signup/gungoo"/>',
										data : {
											"sd_num" : sd_num
										},
										success : function(data) {
											let str = ""
											for ( let tmp in data) {
												str += ` <option value='\${data[tmp].sgg_num}'>\${data[tmp].sgg_name}</option>`;
											}
											$(".sgg_num").html(str);

										},
										error : function(jqXHR, textStatus,
												errorThrown) {

										}
									});
						})

		/* 읍면동 리스트 select로 띄우기 끝 */

		/* 읍면동 리스트 select로 띄우기 시작 */
		$("[name=sgg_num]")
				.click(
						function() {
							let sgg_num = $("[name=sgg_num]").val();
							$
									.ajax({
										method : "post",
										url : '<c:url value="/member/signup/eupmyeondong"/>',
										data : {
											"sgg_num" : sgg_num
										},
										success : function(data) {
											let str = ""
											for ( let tmp in data) {
												str += ` <option value='\${data[tmp].emd_num}'>\${data[tmp].emd_name}</option>`;
											}
											$(".emd_num").html(str);

										},
										error : function(jqXHR, textStatus,
												errorThrown) {

										}
									});
						})
		/* 읍면동 리스트 select로 띄우기 끝 */
	</script>
	<!-- 회원가입 불필요한 문자 제거하기 -->
	<script>
		$(document).ready(function() {
			$("#id").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^\w]/g, ''));
			});
			$("#name").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^ㄱ-ㅎㅏ-ㅣ가-힣]/g, ''));
			});
			$("#front-num, #back-num").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^\d]/g, ''));
			});
			$("#phone").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^\d]/g, ''));
			});
			$("#address").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^ㄱ-힣]/g, ''));
			});
			$("#email").on("input", function() {
				var inputValue = $(this).val();
				$(this).val(inputValue.replace(/[^a-zA-Z0-9@.]/g, ''));
			});
			$("#job").on("input", function() {
				var inputValue = $(this).val();
				var regex = /^[ㄱ-ㅎ가-힣]*$/;
				if (!regex.test(inputValue)) {
					$(this).val(inputValue.replace(/[^ㄱ-ㅎ가-힣]/g, ''));
				}
			});

		});
	</script>
	<!-- 이메일 중복체크 ajax 미구현-->
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$(".email-btn")
									.click(
											function() {
												var email = $("#email").val();
												if (email.length == 0) {
													alert("이메일을 입력 하세요.");
													return;
												}
												if (/[\u3131-\uD79D]/
														.test(email)
														|| /[!#$%^&*(),?":{}|<>]/
																.test(email)) {
													$("#email-text")
															.text(
																	"한글이나 @,.를 제외한 특수문자는 이메일로 사용할 수 없습니다.")
															.css("color", "red");
													return false;
												}
												$
														.ajax({
															url : '<c:url value="/checkEmail"/>',
															type : "get",
															data : {
																me_email : email
															},
															success : function(
																	response) {
																if (response.checkEmail == null) {
																	alert("사용 가능한 이메일입니다.");
																	return;
																} else {
																	alert("이미 사용중인 이메일입니다.");
																	return;
																}
															},
															error : function(
																	xhr,
																	status,
																	error) {
																alert("이미 사용중인 이메일입니다.");
																return;
															}
														}); // ajax end;
											});
						});
	</script>
	<!-- 폰번호 중복체크 ajax -->
	<script type="text/javascript">
		
	</script>
</body>
</html>