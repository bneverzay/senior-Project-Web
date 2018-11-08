<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");
	
	String waterunit = request.getParameter("waterunit");
	String electricityunit = request.getParameter("electricityunit");
	
	double getwaterunit = Double.parseDouble(waterunit);
	double getelectricityunit = Double.parseDouble(electricityunit);

	AccommodationDao accommodationdao = new AccommodationDao();
	AccommodationEntity accommodationentity = accommodationdao.findAccommodationEntityByKey(accommodationID);
	
	accommodationentity.setWaterunit(getwaterunit);
	accommodationentity.setElectricityunit(getelectricityunit);

	accommodationdao.updateAccommodationEntity(accommodationentity);
	accommodationdao.closeEntityManager();

	response.sendRedirect(
			"apartment-rental-invoice-management.jsp?lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>