<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
 <!-- 제이쿼리 CDN 방식 -->
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/jquery.validate.min.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.js" ></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.9/additional-methods.min.js" ></script>
<style type="text/css">

.input-box{
	border:1px solid white;
	width: 547px;height:100%; 
	text-align: center;
	
}

.input-tag:focus {
    border-bottom-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
.insert-box{
	margin: auto 0;
	text-align: center; 
	margin-bottom: 50px;
	
}
.insert-info{
	border: solid 1px red;
	height: 100px; width: 100%;
	margin-top: 10px;
	padding: 10px;
	display: flex;
}
.btn{
	text-decoration: none;
	border:1px solid  #C12DFF;
	width: 100px;
}
.btn:hover {
	background-color:  #C12DFF;
	color: white;
}

select {
	margin-left:34px;
    padding: 10px;
    font-size: 16px; 
    border: 1px solid #ccc; 
    background-color: #ffff; 
    outline: none; 
    width: 500px; 
}
select:focus {
    border-color:  #C12DFF; 
    box-shadow: 0 0 5px rgba(0, 0, 255, 0.5);
}
select:hover {
    background-color: #eaeaea;
}



</style>
</head>
<body>
<div class="input-box">	
	<div class="insert-box">
		<label for="item">세부 항목</label>
	    <input  type="text" id="item" name="it_name" placeholder="등록하고 싶은 항목을 입력하세요" autofocus="autofocus" class="input-tag">
	    <textarea name="it_explanation"></textarea>
	    <a class="btn item-inset-btn">등록</a>
	    <div class="insert-info">
	    	
	    </div>
	</div>	 
	<div>
    	<button type="submit" id="land1" onclick="meIdForm()" class="check btn signup-btn">회원가입</button>
	</div>
</div>	
</body>

<script type="text/javascript">
	$(".item-inset-btn").click(function(){
		let it_name = $("[name=it_name]").val();
		let it_explanation = $("[name=it_explanation]").val();
		console.log(it_name + it_explanation)
		$.ajax({
			url:'<c:url value = "/item/insert"/>',
			type : 'post',
			data : {
				"it_name" : it_name,
				"it_explanation" : it_explanation	
			},
			success : function(data){
				console.log(data);
			}
		});
	});
</script>
</html>