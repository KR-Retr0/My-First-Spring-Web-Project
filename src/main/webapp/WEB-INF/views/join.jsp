<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
function ajaxtest(){
	var element = $("#id");
	$.ajax({
		url : '/join.ajax?id='+document.getElementById("id").value,
		type : 'get',
		success:function(data){
			if($("#id").val()==''){
				alert("ID를 입력하세요.");
				$("#id").focus();
			}else{
				alert(data)
				if(data=="사용가능"){
					element.attr("readonly", true);
					element.css("background-color", "lightgray")
				}else{
					alert("중복")
					element.val("");
					element.focus();
				}
			}
		}
	})
}
</script>
</head>
<body>
	<h1>회원가입</h1>
	ID:
	<form action="/join_req" method="POST" onsubmit="return check()">
	<input type="hidden" id="jsonStr" name="jsonStr">
	<input type="text" name="id" id="id" class="IF1" data-korea="ID"/>
	<input type="button" value="ID중복확인" onclick="ajaxtest()" />
	<br />
	<br /> PW:
	<input type="text" id="pw" name="pw" class="IF2" data-korea="비밀번호">
	<br />
	<br /> PW 확인:
	<input type="text" id="pwcheck" class="IF3" data-korea="비밀번호 확인란">
	<br />
	<br /> 이름:
	<input type="text" id="name" name="nm" class = "IF4" data-korea="이름">
	<br />
	<br /> 성별

	<input type="radio" name="gender" id="gender" class="gender" value="male">남자
	<input type="radio" name="gender" id="gender" class="gender" value="female">여자
	<br />
	<br /> 취미
	<br />
	<br />
	<input type="checkbox" class="like" name="like" value="soccer">축구
	<input type="checkbox" class="like" name="like" value="basketball">농구
	<input type="checkbox" class="like" name="like" value="baseball">야구
	<input type="checkbox" class="like" name="like" value="game">게임
	<br />
	<br/>
		<div id="field"></div>
		<input type=button value="추가하기" onclick=add_item()>
	<br />
	<br /> 가입경로
	<br />
	<br />
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="search">검색
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="recommend">추천
	<input type="radio" name="joinfrom" id="joinfrom" class="joinfrom" value="etc">기타<br>
	<input type="submit" value="submit"/>
	</form>

</body>
<script>
var num=0;
	function elementEmptyCheck(){
		var array=[".IF1",".IF2",".IF3",".IF4"];
		var unchecked = "0";
		var IForCB = "0";
		var arrayValue = "";
		var flag = true;
		var element;
		for(var i=0;i<array.length;i++){
			element = $(array[i]);
			arrayValue = element.val();
			if(arrayValue==''){
				alert(element.data("korea")+"를 입력하세요");
				element.focus();
				flag = false;
				break;
			}
		}
		return flag;
	}
	function pwCheck(pw, rePw){
		var flag = true;
		if(pw !=rePw ){
			flag = false;
		}
		return flag;
	}
	function makeJsonForSns(){
		var jsonOb= {};
		var jsonKey="";
		var jsonValue="";
		for(var i=0;i<=num;i++){
			jsonKey = $('#sns_name').val();
			jsonValue = $('#sns').val();
			jsonOb[jsonKey]= jsonValue;
		}
/* 			ob.insta=$('#snsin').val();
		ob.kakao=$('#snskakao').val(); */
		
		
		var jsonStr = JSON.stringify(jsonOb);
		$("#jsonStr").val(jsonStr);
	}
	function checkBoxCheck(){
		var array=[".gender",".like",".joinfrom","성별","취미","가입 경로"];
		for(var i=0;i<3;i++){
			var arrayObject = $(array[i]);	
			var check="0";
			for(var j=0;j<arrayObject.length;j++){
				if($(arrayObject[j]).is(":checked")){
					check="1";
				}
			}
			if(check=="0"){
				unchecked = array[i+3];
			} 
		}
	}
	function check(){
		checkBoxCheck();
		if(elementEmptyCheck() && pwCheck($(".IF2").val(),$(".IF3").val()) && unchecked=="0"){
			makeJsonForSns()
			return true;
		} else if(unchecked!="0"){
			alert(unchecked+"을 선택하십시오!");
		} else if($("#id").prop("readonly")==false){
			alert("ID중복확인을 해주세요!")
		}
		return false;
	}
	
	function add_item(){
		var div=document.createElement('div');
		div.innerHTML ="<input type=text class='sns_name' style='width:100px'>"+
		"<input type=text class='sns'><br />";
		document.getElementById('field').appendChild(div);
	}
</script>

</html>