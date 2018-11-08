<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");
	String roomID = request.getParameter("roomID");

	String housenumber = request.getParameter("housenumber");
	String numberofbedroom = request.getParameter("numberofbedroom");
	String typeofbed = request.getParameter("typeofbed");
	String numberofbathroom = request.getParameter("numberofbathroom");
	String typeofbathroom = request.getParameter("typeofbathroom");
	String livingroom = request.getParameter("livingroom");
	String kitchenroom = request.getParameter("kitchenroom");
	String accommodationsize = request.getParameter("accommodationsize");
	String maxcapacity = request.getParameter("maxcapacity");
	String getrent = request.getParameter("rent");
	String getdeposit = request.getParameter("deposit");
	float rent = Float.parseFloat(getrent);
	float deposit = Float.parseFloat(getdeposit);
	String rentalagreement = request.getParameter("rentalagreement");
	String typeofrentalagreement = request.getParameter("typeofrentalagreement");

	RoomDao roomdao = new RoomDao();
	RoomEntity roomentity = roomdao.findRoomEntityByKey(roomID);

	roomentity.setHousenumber(housenumber);
	roomentity.setNumberofbedroom(numberofbedroom);
	roomentity.setTypeofbed(typeofbed);
	roomentity.setNumberofbathroom(numberofbathroom);
	roomentity.setTypeofbathroom(typeofbathroom);
	roomentity.setLivingroom(livingroom);
	roomentity.setKitchenroom(kitchenroom);
	roomentity.setAccommodationsize(accommodationsize);
	roomentity.setMaxcapacity(maxcapacity);
	roomentity.setRent(rent);
	roomentity.setDeposit(deposit);
	roomentity.setRentalagreement(rentalagreement);
	roomentity.setTypeofrentalagreement(typeofrentalagreement);

	roomdao.updateRoomEntity(roomentity);
	roomdao.closeEntityManager();

	response.sendRedirect("edit-house-house.jsp?roomID=" + roomID + "&lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>