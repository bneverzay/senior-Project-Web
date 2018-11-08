<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");

	String roomphotoID = request.getParameter("roomphotoID");

	RoomPhotoDao roomphotodao = new RoomPhotoDao();
	roomphotodao.deleteRoomPhotoEntity(roomphotoID);
	roomphotodao.closeEntityManager();

	response.sendRedirect("apartment-room-picture-management.jsp?lessorID=" + lessorID + "&accommodationID="
			+ accommodationID);
%>