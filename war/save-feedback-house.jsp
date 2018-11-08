<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");

	String reviewID = request.getParameter("reviewID");

	ReviewDao reviewdao = new ReviewDao();
	ReviewEntity reviewentity = reviewdao.findReviewEntityByKey(reviewID);
	reviewentity.setStatusreview("reported");
	reviewdao.updateReviewEntity(reviewentity);
	reviewdao.closeEntityManager();

	response.sendRedirect(
			"feedback-house.jsp?lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>