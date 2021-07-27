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
		PreparedStatement pstmt = conn.prepareStatement(
				"update lect0722 set lectname=?,grade=?,prof=?,dayweek=?,starttime=?,endtime=? where lectid=?");
		pstmt.setString(1, lectname);
		pstmt.setString(2, grade);
		pstmt.setString(3, prof);
		pstmt.setString(4, dayweek);
		pstmt.setString(5, starttime);
		pstmt.setString(6, endtime);
		pstmt.setString(7, lectid);
		pstmt.executeUpdate();
		System.out.println("수정 성공");
	}catch(SQLException e){
		System.out.println("수정 실패");
		e.printStackTrace();
	}
%>
<script>
	location.href('selectLect.jsp');
</script>