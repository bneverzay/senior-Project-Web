<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String rentalID = request.getParameter("rentalID");
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");

	RentalDao rentaldao = new RentalDao();
	RentalEntity rentalentity = rentaldao.findRentalEntityByKey(rentalID);

	rentalentity.setAccommodationIDforBooking("null");
	rentalentity.setRoomIDforBooking("null");
	rentalentity.setMemberIDforBooking("null");
	rentalentity.setStatusstay("moveout");

	rentaldao.updateRentalEntity(rentalentity);
	rentaldao.closeEntityManager();

	response.sendRedirect(
			"apartment-renter-management.jsp?lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>