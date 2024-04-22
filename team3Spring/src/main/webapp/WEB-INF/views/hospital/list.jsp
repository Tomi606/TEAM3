<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원 리스트</title>
<style type="text/css">
.aTag-btn1{
margin-right: auto;
} 
.aTag-btn2{
margin-left: auto;
} 
.aTag-btn1,
.aTag-btn2{
    display: inline-block;
    width: 300px;
    height: 200px;
    color: black;
    text-decoration:none;
    text-align: center;
    text-decoration: none;
    box-shadow: 1px 1px 2px 1px #C12DFF;
}
.active{background-color:#fff8f6;color: #ff501b;}
.active1{background-color:#fff8f6;color: #ff501b;}
.active2{background-color:#fff8f6;color: #ff501b;}
.aTag-btn1:hover,
.aTag-btn2:hover{text-decoration:none;box-shadow: 2px 2px 4px 1px #C12DFF; /* 그림자 효과 추가 */}
.hospital-like-list h1,.hospital-area-list h1{margin: 30px auto 50px auto;}
.hospital-list-home{width: 100%;height: 2500px;}
.hospital-list-box{width: 1400px;height: 100%;margin: 0 auto;text-align: center;}
.hospital-like-list{width: 100%;height: 800px;border: 1px solid #c8c8c8;margin-bottom: 50px;}
.hospital-area-list{ width: 100%;height:1000px;border: 1px solid #c8c8c8;}
.area-select-all{width: 100%;height: 150px;padding: 30px 0;display: flex;}
.area-select{margin: 0 auto;}
.area-select-box{display: flex;border: 1px solid  #c8c8c8;width: 100%; height: 400px;margin: 100px 0 145px 0;}
.area-select-box li{list-style: none;}
.area-select-sido{width: 200px;height: 100%;text-align: left;list-style: none;}
.area-select-sgg{width: 200px;text-align: left;}
.area-select-emd{text-align: left;display: flex;width: 997px;flex-direction: column;}
.sido-list{overflow-y: auto;height: 86%;border-right: 1px solid  #c8c8c8;}
.sgg-list{overflow-y: auto;height: 86%;border-right: 1px solid #c8c8c8;}
.emd-list {width: 997px;white-space:normal; overflow-y:auto;}
.sido-list li {display: inline-block;width: 100%;padding: 7px;}
.sgg-list li {display: inline-block;padding: 7px 0; width: 100%;}
.emd-list li {display: inline-block;padding: 20px;width: 33%;text-align: left;}
.area-title{text-align: center;padding: 15px;border-bottom:1px solid  #c8c8c8;border-right: 1px solid  #c8c8c8; }
.area-title-emd{text-align: center;padding: 15px;width: 997px;border-bottom:1px solid #c8c8c8;}
.pagination-box{width:100%;display: flex;margin-top:60px;}
.pagination{margin: 0 auto;}

 
</style>
</head>
<body>
<div class="hospital-list-home">
	<div class="hospital-list-box">
		<div class="area-select-box">
			<div class="area-select-sido">
				<div class="area-title">
					<span>시도</span>
				</div>
				<div class="sido-list">
					<div>
					 <c:forEach items="${sidoList}" var="sd">
						<li role="button" data-num="${sd.sd_num}" class="li-click" id="sd_name"
						>${sd.sd_name}</li>
					 </c:forEach>
					</div>
				</div>
			</div>
			<div class="area-select-sgg">
				<div class="area-title">
					<span>시군구</span>
				</div>
				<div class="sgg-list">
					<div class="sgg_num">

					</div>
				</div>	
			</div>
			<div class="area-select-emd">
				<div class="area-title-emd">
					<span>읍면동</span>
				</div>
				<div class="emd-list">
					<div class="emd_num">

					</div>
				</div>	
			</div>
		</div>
		<div class="hospital-like-list">
			<h1>내 관심 병원</h1>
			<c:choose>
				<c:when test="${empty hoList}">
					<h2>등록된 병원이 없습니다.</h2>
				</c:when>
				<c:otherwise>
					<c:forEach items="${hoList}" var="ho">
					<!-- 수정 해야 ㅎ ㅏㅁ -->
						<a class="aTag-btn1" href="<c:url value='#'/>" style="padding: auto;">
						<!-- 병원명,병원ceo명,과목명,주소 넣기 -->
							<h4>${ho.ho_name}</h4>
							<p>${ho.ho_ceo}</p>
							<p>${ho.ho_id}</p>
						</a>
					</c:forEach>	
				</c:otherwise>
			</c:choose>
			<div class="pagination-box">
				<!-- 페이지네이션 시작 -->
				<div class="pagination">
					123
				</div>
				<!-- 페이지네이션 끝 -->
			</div>
		</div>
		<div class="hospital-area-list">
		<!-- 포이치 쓰기 -->
			<h1>우리 동네 병원</h1>
			<c:choose>
				<c:when test="${empty hoList}">
					<h2>등록된 병원이 없습니다.</h2>
				</c:when>
				<c:otherwise>
					<c:forEach items="${hoList}" var="ho">
					<!-- 수정 해야 ㅎ ㅏㅁ -->
						
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<div class="pagination-box">
				<!-- 페이지네이션 시작 -->
				123
				<!-- 페이지네이션 끝 -->
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">

/* 군 구 리스트 select로 띄우기 시작 */
$(document).on('click', '#sd_name', function(){
	let str1 = '';
	$(".emd_num").html(str1);
	let sd_num = $(this).data('num');
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/member/signup/gungoo"/>', 
		data : {"sd_num" : sd_num}, 
		success : function (data){
			let str =""
			for(let tmp in data){
				str += ` <li role="button" data-num='\${data[tmp].sgg_num}' id="sgg_name">\${data[tmp].sgg_name}</li>`;
			}
			$(".sgg_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})

$(document).on('click', '#sgg_name', function(){
	
	let sgg_num = $(this).data('num');
	if(sgg_num == 'none'){
		sgg_num = 1;
	}
	$.ajax({
		async : false,
		method : "post",
		url : '<c:url value="/member/signup/eupmyeondong"/>', 
		data : {"sgg_num" : sgg_num}, 
		success : function (data){
			
			console.log(data);
			let str =""
			if(data == null ||data.length == 0){
				str +=`<h3 style="color: gray;line-height: 200px;text-align: center;">존재하는 지역이 없습니다.</h3>` ;
			}
			else{
				for(let tmp in data){
					str += ` <li role="button" data-num='\${data[tmp].emd_num}' id="emd_name">\${data[tmp].emd_name}</li>`;
				}
			}
			$(".emd_num").html(str);
			
		}, 
		error : function(jqXHR, textStatus, errorThrown){

		}
	});
})
$(document).on('click', '#emd_name', function(){
    let emd_num = $(this).data('num');
    console.log(emd_num)
    $.ajax({
    	async : false,
        method : "post",
        url : '<c:url value="/hospital/emd/list"/>', // URL 수정
        data : {"emd_num" : emd_num}, 
        success : function (data){
            console.log(data);
            let str =""
            if(data == null || data.length == 0){
                str +=`<h3 style="color: gray;line-height: 200px;text-align: center;">존재하는 병원이 없습니다.</h3>` ;
            }
            else{
                for(let ho in data){
                    str += `<a class="aTag-btn1" href="<c:url value='#'/>" style="padding: auto;" data-id="\${ho.ho_id}>"
						<!-- 병원명,병원ceo명,과목명,주소 넣기 -->
						<h4>\${data[ho].ho_name}</h4>
						<p>\${data[ho].ho_ceo}</p>
						<p>\${data[ho].ho_id}</p>
				</a>`; 
                }
            }
            $(".hospital-area-list").html(str);
            
        }, 
        error : function(jqXHR, textStatus, errorThrown){

        }
    });
});
$(document).on('click', '#emd_name', function(){
    let emd_num = $(this).data('num');
    console.log(emd_num)
    $.ajax({
    	async : false,
        method : "post",
        url : '<c:url value="/hospital/like/list"/>', // URL 수정
        data : {"emd_num" : emd_num}, 
        success : function (data){
            console.log(data);
            let str =""
            if(data == null || data.length == 0){
                str +=`<h3 style="color: gray;line-height: 200px;text-align: center;">존재하는 병원이 없습니다.</h3>` ;
            }
            else{
                for(let ho in data){
                    str += `<a class="aTag-btn1" href="<c:url value='#'/>" style="padding: auto;" data-id="\${ho.ho_id}>"
						<!-- 병원명,병원ceo명,과목명,주소 넣기 -->
						<h4>\${data[ho].ho_name}</h4>
						<p>\${data[ho].ho_ceo}</p>
						<p>\${data[ho].ho_id}</p>
				</a>`; 
                }
            }
            $(".hospital-area-list").html(str);
            
        }, 
        error : function(jqXHR, textStatus, errorThrown){

        }
    });
});

$(".sido-list li").click(function() {
    $(".sido-list li").removeClass("active");
    $(this).addClass("active");
});
$(document).on('click', '#sgg_name', function() {
    if (!$(this).hasClass("active")) {
        $(".active1").removeClass("active1");
        $(this).addClass("active1");
    }
});
$(document).on('click', '#emd_name', function() {
    if (!$(this).hasClass("active")) {
        $(".active2").removeClass("active2");
        $(this).addClass("active2");
    }
});

$(".sido-list [data-num=${la.la_sd_num}]").click();
$(".sgg-list [data-num=${la.la_sgg_num}]").click();
$(".emd-list [data-num=${la.la_emd_num}]").click(); 
</script>

</body>
</html>