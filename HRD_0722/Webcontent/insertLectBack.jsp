<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String lectid = request.getParameter("lectid");
	String lectname = request.getParameter("lectname");
	String grade = request.getParameter("grade");
	String prof = request.getParameter("prof");
	String dayweek = request.getParameter("dayweek");
	String starttime = request.getParameter("starttime");
	String endtime = request.getParameter("endtime");
	try{
		PreparedStatement pstmt = conn.prepareStatement("insert into lect0722 values(?,?,?,?,?,?,?)");
		pstmt.setString(1, lectid);
		pstmt.setString(2, lectname);
		pstmt.setString(3, grade);
		pstmt.setString(4, prof);
		pstmt.setString(5, dayweek);
		pstmt.setString(6, starttime);
		pstmt.setString(7, endtime);
		pstmt.executeUpdate();
		System.out.println("등록 성공");
	}catch(SQLException e){
		System.out.println("등록 실패");
		e.printStackTrace();
	}
%>
<script>
	location.href('insertLect.jsp');
</script>