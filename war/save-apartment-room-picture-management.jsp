<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");

	RoomPhotoDao roomphotodao = new RoomPhotoDao();
	RoomPhotoEntity roomphotoentity = new RoomPhotoEntity();
	
	roomphotoentity.setAccommodationID(accommodationID);

	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
	List<BlobKey> blobKeys = blobs.get("roomphoto");
	roomphotoentity.setRoomphoto(blobKeys.get(0).getKeyString());

	roomphotodao.saveRoomPhotoEntity(roomphotoentity);
	roomphotodao.closeEntityManager();

	response.sendRedirect("/apartment-room-picture-management.jsp?lessorID=" + lessorID + "&accommodationID="
			+ accommodationID);
%>