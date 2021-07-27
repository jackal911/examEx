<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		font-size:30px;
	}
	table th{
		width:35%;
		text-align:center;
	}
	table td{
		width:65%;
		text-align:left;
	}
	input,select,option{
		font-size:20px;
		height:30px;
		width:500px;
		text-align:center;
	}
</style>
<script>
	function ok(){
		if(!form1.studno.value){
			alert('학번 입력해');
			form1.studno.focus();
		}else{
			alert('등록 성공');
			form1.submit();
		}
	}
</script>
</header>
<nav>
	<%@ include file="nav.jsp" %>
</nav>
<section>
<h1>학사 정보 등록 화면</h1>
<form name=form1 method="post" action="insertStudBack.jsp">
<table border="1">
<tr>
	<th>학번</th>
	<td><input type="text" name="studno"></td>
</tr>
<tr>
	<th>성명</th>
	<td><input type="text" name="name"></td>
</tr>
<tr>
	<th>학과</th>
	<td>
		<select name="dept">
			<option value="1">컴퓨터공학과</option>
			<option value="2">기계공학과</option>
			<option value="3">전자과</option>
			<option value="4">영문학과</option>
			<option value="5">일어과</option>
			<option value="6">경영학과</option>
			<option value="7">무역학과</option>
			<option value="8">교육학과</option>
		</select>
	</td>
</tr>
<tr>
	<th>학년</th>
	<td>
		<select name="position">
			<option value="1">1학년</option>
			<option value="2">2학년</option>
			<option value="3">3학년</option>
			<option value="4">4학년</option>
		</select>
	</td>
</tr>
<tr>
	<th>주소</th>
	<td><input type="text" name="address"></td>
</tr>
<tr>
	<th>연락처</th>
	<td><input type="text" name="phone"></td>
</tr>
<tr>
	<th colspan="2">
		<input type="button" value="등록" onclick="ok()">
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</th>
</tr>
</table>
</form>	
</section>
<footer>
	<%@ include file="footer.jsp" %>
</footer>
</body>
</html>