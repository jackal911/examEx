<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	Connection conn = null;
	request.setCharacterEncoding("utf-8");
	try{
		Class.forName("oracle.jdbc.OracleDriver");
		conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		System.out.println("성공!");
	}catch(Exception e){
		System.out.println("연결 실패");
		e.printStackTrace();
	}
%>