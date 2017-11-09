<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
var num=0;

function check(){
	var array=[".IF1",".IF2",".IF3",".IF4"];
	var bool = "0";
	var IForCB = "0";
	for(var i=0;i<array.length;i++){
		if(bool=="0"){
			if($(array[i]).val()==''){
				bool = array[i];
			}
		}
	}
	if(bool==0&&$(".IF2").val()!=$(".IF3").val()){
		bool="wrong pw";
	}
	if (bool != "wrong pw"&&bool != "0"){
		alert($(bool).data("korea")+"를 입력하세요.");
		$(bool).focus();
	}else if(bool =="wrong pw"){
		alert("패스워드가 일치하지 않습니다.");
		$(".IF3").focus();
	}
	if(bool!="0"){
		IForCB="IF";
	}
	
	array=[".gender",".like",".joinfrom","성별","취미","가입 경로"];
	for(var i=0;i<3;i++){
		 if(bool=="0"){
			var arrayObject = $(array[i]);
			var check="0";
			for(var j=0;j<arrayObject.length;j++){
				if($(arrayObject[j]).is(":checked")){
					check="1";
				}
			}
			if(check=="0"){
				bool = array[i+3];
			}
		} 
	}
	if(bool!="0"&&IForCB=="0"){
		alert(bool+"을 선택하십시오!");
	}
	if(bool=="0"&&$("#id").prop("readonly")==false){
		alert("ID중복확인을 해주세요!")
		return false;
	}else if(bool=="0"){
		var ob= {};
		for(var i=0;i<=$('#sns_name').size();i++){
			ob[$(('#sns_name').eq(i)).val()]=$(('#sns').eq(i)).val();
		} 
/* 			ob.insta=$('#snsin').val();
		ob.kakao=$('#snskakao').val(); */
		
		
		var Json = JSON.stringify(ob);
		
		$.ajax({
			url : '/snsSend?Json='+Json,
			type : 'POST'
		})
		return true;
	}else{
		return false;
	}
}

$(document).ready(function() {
	$("#id").attr("readonly", true);
	$("#id").css("background-color", "lightgray")	
	
		var gender = $('#genderdata').val();
		var hobbydata = $('#hobbydata').val();
		var joinFrom = $('#fromdata').val();
		var snsJsonData = $('#snsdata').val();
		
		var hobby = hobbydata.split(','); //쉼표 단위로 잘라냄
		
		$('.like').each(function(index){
			for(var i=0;i<hobby.length;i++){
				if($(this).attr('value')==hobby[index]){
					$(this).prop('checked', true);
				}
			}
		});
		
		$('.gender').each(function(){
			if($(this).attr('value')==gender){
				$(this).attr("checked", true);
				return false;
			}
		});
		
		$('.joinfrom').each(function(){
			if($(this).attr('value')==joinFrom){
				$(this).attr("checked", true);
				return false;
			}
		});
		
		var snsData = $.parseJSON(snsJsonData);
		$.each(snsData, function(key, value){
			var div=document.createElement('div');
			div.innerHTML ="<input type=text class=\"sns_name\" style=\"width:100px\" value=\""+key+"\"><input type=text class=\"sns\" value=\""+value+"\"><br />";
			document.getElementById('field').appendChild(div);
		})
	});
	
function add_item(){
	var div=document.createElement('div');
	div.innerHTML ="<input type=text class=\"sns_name\" style=\"width:100px\"><input type=text class=\"sns\"><br />";
	document.getElementById('field').appendChild(div);
}
function del_item(){
	$(".sns_name").eq($(".sns_name").size()-1).parent().remove();
}
</script>
</head>
<body>
	<h1>Welcome! ${vo.getId()}</h1>
	<input type="hidden" id="hobbydata" value=${vo.getHobby() }>
	<input type="hidden" id="genderdata" value=${vo.getGender() }>
	<input type="hidden" id="fromdata" value=${vo.getJoinfrom() }>
	<input type="hidden" id="snsdata" value=${vo.getSns() }>
	<br> ID
	
	<form action="/updateUser" method="POST" onsubmit="return check()">
	<input type="text" id="id" name="id" value=${vo.getId() } class="IF1" data-korea='ID'><br> 패스워드
	<input type="text" id="pw" name="pw" value=${vo.getPw() } class="IF2" data-korea='패스워드'><br>패스워드 확인
	<input type="text" id="pwcheck" class="IF3" data-korea="비밀번호 확인란"><br> 이름
	<input type="text" id="name" name="nm" class="IF4" value=${vo.getName() } data-korea='이름'><br>
	
	<br /> 성별

	<input type="radio" name="gender" id="gender" class="gender" value="male">남자
	<input type="radio" name="gender" id="gender" class="gender" value="female">여자
	<br/>
	<input type="checkbox" class="like" name="like" value="soccer">축구
	<input type="checkbox" class="like" name="like" value="basketball">농구
	<input type="checkbox" class="like" name="like" value="baseball">야구
	<input type="checkbox" class="like" name="like" value="game">게임	
		<br />
		<div id="field"></div>
		<input type=button value="추가하기" onclick=add_item()>
		<input type=button value="제거하기" onclick=del_item()>
		
		<br/>
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="search">검색
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="recommend">추천
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="etc">기타<br>
	<br />
	<input type="submit" value="submit"/>
	</form>
</body>
</html>