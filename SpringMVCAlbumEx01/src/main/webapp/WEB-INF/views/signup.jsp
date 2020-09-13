<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./css/board_write.css">
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('btn').onclick = function() {
			if (document.frm.id.value.trim() == '') {
	      		alert('아이디를 입력해주세요.');
		  		return false;
			}
			if (document.frm.password.value.trim() == '') {
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			if (document.frm.password2.value.trim() == '') {
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			if (document.frm.name.value.trim() == '') {
				alert('이름을 입력해주세요.');
				return false;
			}
			if (document.frm.info.checked == false) {
			    alert('동의를 하셔야 합니다.');
			 	return false;
			}
			if (document.frm.password.value != document.frm.password2.value) {
				alert('비밀번호가 다릅니다.');
				return false;
			}
			document.frm.submit();
		};
	};
</script>
</head>

<body>
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 

	<form action="./signup_ok.do" method="post" name="frm">
		<div class="contents_sub">
			<div class="board_write">
				<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" placeholder="아이디" size="30" maxlength="15" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" placeholder="비밀번호" size="30" maxlength="15" /></td>
				</tr>
				<tr>
					<th>비밀번호 재확인</th>
					<td><input type="password" name="password2" placeholder="비밀번호 재확인" size="30" maxlength="15" /></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" placeholder="이름" size="30" /></td>
				</tr>
				<tr>
					<th>이메일 (선택)</th>
					<td><input type="text" name="email1" value="" /> @ <input type="text" name="email2" value="" /></td>
				</tr>
				</table>
				
				<table>	
				<tr>
					<td style="text-align:left;border:1px solid #e0e0e0;background-color:f9f9f9;padding:5px">
						<div style="padding-top:7px;padding-bottom:5px;font-weight:bold;padding-left:7px;font-family: Gulim,Tahoma,verdana;">※ 개인정보 수집 및 이용에 관한 안내</div>
						<div style="padding-left:10px;">
							<div style="width:97%;height:95px;font-size:11px;letter-spacing: -0.1em;border:1px solid #c5c5c5;background-color:#fff;padding-left:14px;padding-top:7px;"> 
								 1. 수집 개인정보 항목 : 회사명, 담당자명, 메일 주소, 전화번호, 홈페이지 주소, 팩스번호, 주소 <br />
								 2. 개인정보의 수집 및 이용목적 : 제휴신청에 따른 본인확인 및 원활한 의사소통 경로 확보 <br />
								 3. 개인정보의 이용기간 : 모든 검토가 완료된 후 3개월간 이용자의 조회를 위하여 보관하며, 이후 해당정보를 지체 없이 파기합니다. <br />
								 4. 그 밖의 사항은 개인정보취급방침을 준수합니다.
							</div>
						</div>
						<div style="padding-top:7px;padding-left:5px;padding-bottom:7px;font-family: Gulim,Tahoma,verdana;">
							<input type="checkbox" name="info" value="1" class="input_radio" > 개인정보 수집 및 이용에 대해 동의합니다.(필수)
						</div>
					</td>
				</tr>
				</table>
			</div>

			<div class="btn_area">
				<div class="align_right">			
					<input type="button" value="가입하기" id="btn" class="btn_write btn_txt01" style="cursor: pointer;" />					
				</div>	
			</div>	
		</div>
	</form>
</div>
</body>
</html>