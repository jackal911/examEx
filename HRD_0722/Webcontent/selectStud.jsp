<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<header>
	<%@ include file="header.jsp" %>
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
</header>
<nav>
	<%@ include file="nav.jsp" %>
</nav>
<section>
<%
	PreparedStatement pstmt = conn.prepareStatement("select count(studno) from stud0722");
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String num = rs.getString(1);
%>
<h1>학사정보 목록</h1>
총 <%=num %>명의 학사정보가 있습니다.
<table border="1">
	<tr>
		<th>학번</th>
		<th>성명</th>
		<th>학과</th>
		<th>학년</th>
		<th>주소</th>
		<th>연락처</th>
	</tr>
<%
	pstmt = conn.prepareStatement("select * from stud0722");
	rs = pstmt.executeQuery();
	while(rs.next()){
		String studno = rs.getString(1);
		String name = rs.getString(2);
		String dept = rs.getString(3);
		String position = rs.getString(4);
		String adress = rs.getString(5);
		String phone = rs.getString(6);
		
%>
	<tr>
		<td><%=studno %></td>
		<td><%=name %></td>
		<td><%=dept %></td>
		<td><%=position %></td>
		<td><%=adress %></td>
		<td><%=phone %></td>
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