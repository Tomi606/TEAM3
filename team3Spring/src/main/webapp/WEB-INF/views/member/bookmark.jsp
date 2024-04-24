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
	
	margin:90px 15px 15px 24px;
    width: 300px;
    height: 200px;
    color: black;
    text-decoration: none;
    box-shadow: 1px 1px 2px 1px #C12DFF;
}
.active{background-color:#fff8f6;color: #ff501b;}
.active1{background-color:#fff8f6;color: #ff501b;}
.active2{background-color:#fff8f6;color: #ff501b;}
.aTag-btn1:hover,
.aTag-btn2:hover{text-decoration:none;box-shadow: 2px 2px 4px 1px #C12DFF; /* 그림자 효과 추가 */}
.hospital-like-list h1,.hospital-area-list h1{margin: 30px auto 50px auto;}
.hospital-list-home{width: 100%;height: 1500px;}
.hospital-list-box{width: 1400px;height: 100%;margin: 0 auto;text-align: center;}
.hospital-like-list{width: 100%;height: 400px;border: 1px solid #c8c8c8;margin-bottom: 150px;}
.hospital-area-list{ width: 100%;height:1000px;border: 1px solid #c8c8c8;display: grid; grid-template-columns:1fr 1fr 1fr 1fr;}
.area-select-all{width: 100%;height: 150px;padding: 30px 0;display: flex;}
.area-select{margin: 0 auto;}
.area-select-box{display: flex;border: 1px solid  #c8c8c8;width: 100%; height: 400px;margin: 100px 0 200px 0;}
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
.box-pagination{width:100%;display: flex;margin-top:60px;}
.pagination{margin: 0 auto;}
</style>
</head>
<body>
<div class="hospital-list-home">
	<div class="hospital-list-box">
		<h1>북마크 리스트..</h1>
		<div class="hospital-area-list">
		</div>
		<div class="box-pagination" style="border: 1px solid black; height: 100px; margin: 0 auto 200px auto">
			<!-- 페이지네이션 시작 -->
			<ul class="pagination justify-content-center"></ul>
			<!-- 페이지네이션 끝 -->
		</div>
	</div>
</div>
<script type="text/javascript">
let page = 1;
getBmkHoList();
function getBmkHoList(){
	
	$.ajax({
    	async : false,
        method : "post",
        data : {
        	"page" : page
        }, 
        url : '<c:url value="/member/bookmark"/>', // URL 수정
        success : function (data){
            let str =""
            if(data.list == null || data.list.length == 0){
                str +=`<h3 style="color: gray;line-height: 200px;text-align: center;">존재하는 병원이 없습니다.</h3>` ;
            }
            else{
                for(let ho of data.list){
                    str += 
                   	`
	                    <a class="aTag-btn1" href="<c:url value='#'/>" style="padding: auto;" data-id="\${ho.hospital.ho_id}>"
							<!-- 병원명,병원ceo명,과목명,주소 넣기 -->
							<h4>\${ho.hospital.ho_name}</h4>
							<p>\${ho.hospital.ho_ceo}</p>
							<p>\${ho.hospital.ho_id}</p>
						</a>
					`; 
                }
            }
            $(".hospital-area-list").html(str);
            displayBmkHoPagination(data.pm);
        }, 
        error : function(jqXHR, textStatus, errorThrown){

        }
    });

}

function displayBmkHoPagination(pm){
    
	let str = '';
	if(pm.prev){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage - 1}">이전</a>
		</li>`;		
	}
	for(let i = pm.startPage; i<= pm.endPage; i++){
		let active = pm.cri.page == i ? 'active' : '';
		str += `
		<li class="page-item \${active}">
			<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
		</li>`;	
	}
	
	if(pm.next){
		str += `
		<li class="page-item">
			<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage + 1}">다음</a>
		</li>`;	
	}
	$('.box-pagination>ul').html(str);
}
$(document).on('click','.box-pagination .page-link',function(){
	page = $(this).data('page');
	getBmkHoList();
});
</script>
</body>
</html>