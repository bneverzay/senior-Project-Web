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
	String rentalID = request.getParameter("rentalID");
	
	RentalDao rentaldao = new RentalDao();
	RentalEntity rentalentity = rentaldao.findRentalEntityByKey(rentalID);
	
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
	List<BlobKey> blobKeys = blobs.get("rentalagreement");
	rentalentity.setRentalagreement(blobKeys.get(0).getKeyString());

	rentaldao.updateRentalEntity(rentalentity);
	rentaldao.closeEntityManager();

	response.sendRedirect("/house-rental-agreement.jsp?lessorID=" + lessorID + "&accommodationID="
			+ accommodationID + "&rentalID=" + rentalID);
%>