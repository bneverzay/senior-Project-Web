<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String keyrentalID = request.getParameter("rentalID");
	String keyaccommodationID = request.getParameter("accommodationID");

	RentalDao rentaldao = new RentalDao();
	RentalEntity rentalentity = rentaldao.findRentalEntityByKey(keyrentalID);

	rentalentity.setStatusbooking("approve");

	rentaldao.updateRentalEntity(rentalentity);
	rentaldao.closeEntityManager();

	response.sendRedirect(
			"house-booking-management.jsp?lessorID=" + lessorID + "&accommodationID=" + keyaccommodationID);
%>