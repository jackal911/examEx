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
		font-size:30px;
	}
	table th{
		width:35%;
		text-align:center;
		font-weight:bold;
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
	.radio{
		height:20px;
		width:20px;
	}
</style>
<script>
	function ok(){
		if(!form1.lectid.value){
			alert('교과목 코드 입력해');
			form1.lectid.focus();
		}else if(!form1.lectname.value){
			alert('교과목명 입력해');
			form1.lectname.focus();
		}else if(!form1.grade.value){
			alert('학점 입력해');
			form1.grade.focus();
		}else if(!form1.prof.value){
			alert('담당강사 입력해');
			form1.prof.focus();
		}else if(!form1.starttime.value){
			alert('시작시간 입력해');
			form1.starttime.focus();
		}else if(!form1.endtime.value){
			alert('종료시간 입력해');
			form1.endtime.focus();
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
<%
	String lectid = request.getParameter("lectid");
	PreparedStatement pstmt = conn.prepareStatement("select * from lect0722 where lectid=?");
	pstmt.setString(1, lectid);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	String lectname = rs.getString(2);
	String grade = rs.getString(3);
	String prof = rs.getString(4);
	String dayweek = rs.getString(5);
	String starttime = rs.getString(6);
	String endtime = rs.getString(7);
%>
<h1>교과목 정보 수정</h1>
<form name=form1 method="post" action="updateLectBack.jsp">
<table border="1">
<tr>
	<th>교과목 코드</th>
	<td><input type="text" name="lectid" value="<%=lectid%>" readonly></td>
</tr>
<tr>
	<th>과 목 명</th>
	<td><input type="text" name="lectname" value="<%=lectname %>"></td>
</tr>
<tr>
	<th>학 점</th>
	<td><input type="text" name="grade" value="<%=grade %>"></td>
</tr>
<tr>
	<th>담 당 강 사</th>
	<td>
		<select name="prof">
			<option value="">담당강사 선택</option>
			<option value="강교수" <%if(prof.equals("강교수")){%>selected<%}%>>강교수</option>
			<option value="이교수" <%if(prof.equals("이교수")){%>selected<%}%>>이교수</option>
			<option value="우교수" <%if(prof.equals("우교수")){%>selected<%}%>>우교수</option>
			<option value="최교수" <%if(prof.equals("최교수")){%>selected<%}%>>최교수</option>
			<option value="박교수" <%if(prof.equals("박교수")){%>selected<%}%>>박교수</option>
		</select>
	</td>
</tr>
<tr>
	<th>요 일</th>
	<td>
		<input class="radio" type="radio" name="dayweek" value="1" id="1" <%if(dayweek.equals("1")){%>checked<%}%>>
		<label for="1">월</label>
		<input class="radio" type="radio" name="dayweek" value="2" id="2" <%if(dayweek.equals("2")){%>checked<%}%>>
		<label for="2">화</label>
		<input class="radio" type="radio" name="dayweek" value="3" id="3" <%if(dayweek.equals("3")){%>checked<%}%>>
		<label for="3">수</label>
		<input class="radio" type="radio" name="dayweek" value="4" id="4" <%if(dayweek.equals("4")){%>checked<%}%>>
		<label for="4">목</label>
		<input class="radio" type="radio" name="dayweek" value="5" id="5" <%if(dayweek.equals("5")){%>checked<%}%>>
		<label for="5">금</label>
	</td>
</tr>
<tr>
	<th>시 작</th>
	<td><input type="text" name="starttime" value="<%=starttime %>"></td>
</tr>
<tr>
	<th>종 료</th>
	<td><input type="text" name="endtime" value="<%=endtime %>"></td>
</tr>
<tr>
	<th colspan="2">
		<input type="button" value="목록" onclick="location.href='selectLect.jsp'">
		<input type="button" value="완료" onclick="ok()">
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