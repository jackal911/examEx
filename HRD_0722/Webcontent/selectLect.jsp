<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
	section{
		text-align:center;
	}
	h1{
		padding:10px;
	}
	table{
		width:60%;
		margin:0 auto;
		text-align:center;
	}
	div{
		text-align:left;
		text-indent:20%;
	}
</style>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
</header>
<nav>
	<%@ include file="nav.jsp" %>
</nav>
<section>
<%
	PreparedStatement pstmt = conn.prepareStatement("select count(lectid) from lect0722");
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String num = rs.getString(1);
%>
<h1>교과목 목록</h1>
<div>총 <%=num %>개의 교과목이 있습니다.</div>
<table border="1">
	<tr>
		<th>과목코드</th>
		<th>과목명</th>
		<th>학점</th>
		<th>담당강사</th>
		<th>요일</th>
		<th>시작시간</th>
		<th>종료시간</th>
		<th>관리</th>
	</tr>
<%
	pstmt = conn.prepareStatement("select * from lect0722");
	rs = pstmt.executeQuery();
	while(rs.next()){
		String lectid = rs.getString(1);
		String lectname = rs.getString(2);
		String grade = rs.getString(3);
		String prof = rs.getString(4);
		String dayweek = rs.getString(5);
		switch(dayweek){
			case "1":
				dayweek = "월요일";
				break;
			case "2":
				dayweek = "화요일";
				break;
			case "3":
				dayweek = "수요일";
				break;
			case "4":
				dayweek = "목요일";
				break;
			case "5":
				dayweek = "금요일";
				break;
		}
		String starttime = rs.getString(6);
		String endtime = rs.getString(7);
		
%>
	<tr>
		<td><%=lectid %></td>
		<td><%=lectname %></td>
		<td><%=grade %></td>
		<td><%=prof %></td>
		<td><%=dayweek %></td>
		<td><%=starttime %></td>
		<td><%=endtime %></td>
		<td><a href="updateLect.jsp?lectid=<%=lectid %>">수정</a> / <a href="deleteLect.jsp?lectid=<%=lectid %>">삭제</a></td>
	</tr>
<%
	}
%>
</table>
</section>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>
</html>