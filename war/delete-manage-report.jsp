<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String administratorID = request.getParameter("administratorID");

	String reviewID = request.getParameter("reviewID");

	ReviewDao reviewdao = new ReviewDao();
	reviewdao.deleteReviewEntity(reviewID);
	reviewdao.closeEntityManager();

	response.sendRedirect("administrator-manage-report.jsp?administratorID=" + administratorID);
%>