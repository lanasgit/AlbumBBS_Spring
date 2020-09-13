<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('가입되었습니다. 로그인해 주세요.');");
		out.println("location.href='./list.do';");
	} else {
		out.println("alert('사용중인 아이디입니다');");
		out.println("history.back();");
	}
	out.println("</script>");
%>