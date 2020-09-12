<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int flag = (Integer)request.getAttribute("flag");
	String id = request.getParameter("id");
	
	out.println("<script type='text/javascript'>");
	if (flag == 0) {
		out.println("alert('로그인 성공');");
		session.setAttribute("s_id", id);
		out.println("location.href='./list.do';");
	} else {
		out.println("alert('아이디와 비밀번호를 확인해주세요');");
		out.println("history.back();");
	}
	out.println("</script>");
%>