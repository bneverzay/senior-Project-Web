<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%
	String lessorID = request.getParameter("lessorID");

	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String gender = request.getParameter("gender");
	String birthdate = request.getParameter("birthdate");
	String address = request.getParameter("address");
	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");

	LessorDao lessordao = new LessorDao();
	LessorEntity lessorentity = lessordao.findLessorEntityByKey(lessorID);
	
	lessorentity.setFirstname(firstname);
	lessorentity.setLastname(lastname);
	lessorentity.setGender(gender);
	lessorentity.setBirthdate(birthdate);
	lessorentity.setAddress(address);
	lessorentity.setTelephone(telephone);
	lessorentity.setEmail(email);

	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
	List<BlobKey> blobKeys = blobs.get("pictureprofile");
	if (blobKeys != null && blobKeys.size() > 0) {
		lessorentity.setPictureprofile(blobKeys.get(0).getKeyString());
	}

	lessordao.updateLessorEntity(lessorentity);
	lessordao.closeEntityManager();

	response.sendRedirect("/manage-account.jsp?lessorID=" + lessorID);
%>