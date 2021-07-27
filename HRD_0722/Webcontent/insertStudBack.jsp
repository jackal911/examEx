<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	try{
		PreparedStatement pstmt = conn.prepareStatement("insert into stud0722 values(?,?,?,?,?,?)");
		pstmt.setString(1, studno);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.executeUpdate();
		System.out.println("등록 성공");
	}catch(SQLException e){
		System.out.println("등록 실패");
		e.printStackTrace();
	}
%>
<script>
	location.href('insertStud.jsp');
</script>