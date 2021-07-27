<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String lectid = request.getParameter("lectid");
	try{
		PreparedStatement pstmt = conn.prepareStatement("delete from lect0722 where lectid=?");
		pstmt.setString(1, lectid);
		pstmt.executeUpdate();
		System.out.println("등록 성공");
	}catch(SQLException e){
		System.out.println("등록 실패");
		e.printStackTrace();
	}
%>
<script>
	alert('삭제 성공');
	location.href('selectLect.jsp');
</script>