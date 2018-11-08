<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String rentalID = request.getParameter("rentalID");
	String accommodationID = request.getParameter("accommodationID");

	RentalDao rentaldao = new RentalDao();
	RentalEntity rentalentity = rentaldao.findRentalEntityByKey(rentalID);
	
	rentalentity.setStatusstay("movein");
	
	rentaldao.updateRentalEntity(rentalentity);
	rentaldao.closeEntityManager();

	response.sendRedirect(
			"house-booking-management.jsp?lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>