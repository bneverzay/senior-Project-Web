<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String administratorID = request.getParameter("administratorID");
	String accommodationID = request.getParameter("accommodationID");
	String servicefees = request.getParameter("servicefees");

	double getservicefees = Double.parseDouble(servicefees);

	AccommodationDao accommodationdao = new AccommodationDao();
	AccommodationEntity accommodationentity = accommodationdao.findAccommodationEntityByKey(accommodationID);

	accommodationentity.setServicefees(getservicefees);

	accommodationdao.updateAccommodationEntity(accommodationentity);
	accommodationdao.closeEntityManager();

	response.sendRedirect("home-administrator.jsp?administratorID=" + administratorID);
%>