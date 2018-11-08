<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");
	String roomID = request.getParameter("roomID");

	String roomnumber = request.getParameter("roomnumber");
	String typeroomofapartment = request.getParameter("typeroomofapartment");
	String accommodationsize = request.getParameter("accommodationsize");
	String typeofbed = request.getParameter("typeofbed");
	String balconyapartment = request.getParameter("balconyapartment");
	String typeofbathroom = request.getParameter("typeofbathroom");
	String maxcapacity = request.getParameter("maxcapacity");
	String getrent = request.getParameter("rent");
	String getdeposit = request.getParameter("deposit");
	float rent = Float.parseFloat(getrent);
	float deposit = Float.parseFloat(getdeposit);
	String rentalagreement = request.getParameter("rentalagreement");
	String typeofrentalagreement = request.getParameter("typeofrentalagreement");
	
	RoomDao roomdao = new RoomDao();
	RoomEntity roomentity = roomdao.findRoomEntityByKey(roomID);

	roomentity.setRoomnumber(roomnumber);
	roomentity.setTyperoomofapartment(typeroomofapartment);
	roomentity.setAccommodationsize(accommodationsize);
	roomentity.setTypeofbed(typeofbed);
	roomentity.setBalconyapartment(balconyapartment);
	roomentity.setTypeofbathroom(typeofbathroom);
	roomentity.setMaxcapacity(maxcapacity);
	roomentity.setRent(rent);
	roomentity.setDeposit(deposit);
	roomentity.setRentalagreement(rentalagreement);
	roomentity.setTypeofrentalagreement(typeofrentalagreement);

	roomdao.updateRoomEntity(roomentity);
	roomdao.closeEntityManager();

	response.sendRedirect("edit-room-apartment.jsp?roomID=" + roomID + "&lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>
