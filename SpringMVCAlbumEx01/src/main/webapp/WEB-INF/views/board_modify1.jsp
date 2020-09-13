<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="albummodel1.BoardTO" %>
<%
//주소창에 주소를 직접 입력하면 로그인하지 않아도 들어가짐. 그 방지 차원으로 시작 부분에서 세션 검사 실행.
if(session.getAttribute("s_id") == null)   {     
	out.println("<script type='text/javascript'>");
	out.println("alert('로그인이 필요합니다.');");
	out.println("location.href='./list.do';");
	out.println("</script>");
} else {
	BoardTO to = (BoardTO)request.getAttribute("to");
	
	String seq = to.getSeq();
	String cpage = to.getCpage();
	String subject = to.getSubject();
	String writer = to.getWriter();
	String content = to.getContent();
	String mail[] = null;
	if (to.getMail().equals("")) {
		mail = new String[] {"", ""};
	} else {
		mail = to.getMail().split("@");
	}
	String filename = to.getFilename();
	Long filesize = to.getFilesize();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>앨범 게시판</title>
<link rel="stylesheet" type="text/css" href="./css/board_write.css">
</head>

<body>
<!-- 상단 디자인 -->
<div class="contents1"> 
	<div class="con_title"> 
		<p style="margin: 0px; text-align: right">
			<img style="vertical-align: middle" alt="" src="./images/home_icon.gif" /> &gt; 커뮤니티 &gt; <strong>여행지리뷰</strong>
		</p>
	</div> 

	<form action="./modify_ok.do" method="post" name="mfrm" enctype="multipart/form-data">
		<input type="hidden" name="seq" value="<%=seq %>" />
		<input type="hidden" name="cpage" value="<%=cpage %>" />
		<div class="contents_sub">
		<!--게시판-->
			<div class="board_write">
				<table>
				<tr>
					<th class="top">글쓴이</th>
					<td class="top" colspan="3"><input type="text" name="writer" value="<%=writer %>" class="board_write_input_100" maxlength="10" /></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3"><input type="text" name="subject" value="<%=subject %>" class="board_write_input" /></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="3"><input type="password" name="password" value="" class="board_write_input_100"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="3">
						<textarea name="content" id="content" class="board_editor_area"><%=content %></textarea>
					</td>
				</tr>
				<tr>
					<th>파일첨부</th>
					<td colspan="3">
						기존 파일 : <%=filename %>(<%=filesize %>KB)<br /><br />
						<input type="file" id="file" name="upload" value="" class="board_write_input" />
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="3"><input type="text" name="mail1" value="<%=mail[0] %>" class="board_write_input_100"/> @ <input type="text" name="mail2" value="<%=mail[1] %>" class="board_write_input_100"/></td>
				</tr>
				</table>
			</div>

			<div class="btn_area">
				<div class="align_left">			
					<input type="button" value="목록" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='list.do?cpage=<%=cpage %>'" />
					<input type="button" value="보기" class="btn_list btn_txt02" style="cursor: pointer;" onclick="location.href='view.do?cpage=<%=cpage %>&seq=<%=seq %>'" />
				</div>
				<div class="align_right">			
					<input type="button" id="mbtn" value="수정" class="btn_write btn_txt01" style="cursor: pointer;" />
				</div>	
			</div>	
			<!--//게시판-->
		</div>
	</form>
</div>
<!-- 하단 디자인 -->
</body>

<script type="text/javascript" src="./smart_editor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	window.onload = function() {
		document.getElementById('mbtn').onclick = function() {
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			if (document.mfrm.subject.value.trim() == '') {
				alert('제목을 입력하셔야 합니다.');
				return false;
			}
			if (document.mfrm.password.value.trim() == '') {
				alert('비밀번호를 입력하셔야 합니다.');
				return false;
			}
			if (document.getElementById('file').value != ''){
		    	//이미지 파일 확장자만 업로드 허용
		    	var reg = /(.*?)\.(jpg|jpeg|png|gif|bmp|JPG|JPEG|PNG|GIF|BMP)$/;
		        if (!file.value.match(reg)) {
		            alert("해당 파일은 이미지 파일이 아닙니다.");
		            return false;
		        }
		    }
			document.mfrm.submit();
		};
	};
	
	var editor_object = []; 
	nhn.husky.EZCreator.createInIFrame({ 
		oAppRef : editor_object, 
		elPlaceHolder: "content", 
		sSkinURI: "./smart_editor/SmartEditor2Skin.html", 
		fCreator : "createSEditor2",
		htParams : {  
			bUseToolbar : true,  
			bUseVerticalResizer : true,  
			bUseModeChanger : true, 
		} 
	});
</script>
</html>
<%
   }
%>