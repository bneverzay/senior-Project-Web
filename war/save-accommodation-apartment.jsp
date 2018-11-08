<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
<%
	String lessorID = request.getParameter("lessorID");

	String accommodationname = request.getParameter("accommodationname");
	String typeofapartment = request.getParameter("typeofapartment");
	String address = request.getParameter("address");
	String district = request.getParameter("district");
	String province = request.getParameter("province");

	String telephone = request.getParameter("telephone");
	String email = request.getParameter("email");
	String bank = request.getParameter("bank");
	String accountname = request.getParameter("accountname");
	String accountno = request.getParameter("accountno");
	String rentrates = request.getParameter("rentrates");
	String depositrates = request.getParameter("depositrates");

	String fan = request.getParameter("fan");
	String airconditioner = request.getParameter("airconditioner");
	String waterheater = request.getParameter("waterheater");
	String refrigerator = request.getParameter("refrigerator");
	String television = request.getParameter("television");
	String furniture = request.getParameter("furniture");

	String carpark = request.getParameter("carpark");
	String closedcircuitcamera = request.getParameter("closedcircuitcamera");
	String elevator = request.getParameter("elevator");
	String washingmachine = request.getParameter("washingmachine");
	String drinkingwaterdispenser = request.getParameter("drinkingwaterdispenser");
	String swimmingpool = request.getParameter("swimmingpool");
	String fitness = request.getParameter("fitness");
	String keycard = request.getParameter("keycard");

	AccommodationEntity accommodationentity = new AccommodationEntity();

	accommodationentity.setLessorID(lessorID);
	
	accommodationentity.setTypeofaccommodation("apartment");
	accommodationentity.setAccommodationname(accommodationname);
	accommodationentity.setTypeofapartment(typeofapartment);
	accommodationentity.setAddress(address);
	accommodationentity.setDistrict(district);
	accommodationentity.setProvince(province);

	accommodationentity.setTelephone(telephone);
	accommodationentity.setEmail(email);
	accommodationentity.setBank(bank);
	accommodationentity.setAccountname(accountname);
	accommodationentity.setAccountno(accountno);
	accommodationentity.setRentrates(rentrates);
	accommodationentity.setDepositrates(depositrates);

	accommodationentity.setFan(fan);
	accommodationentity.setAirconditioner(airconditioner);
	accommodationentity.setWaterheater(waterheater);
	accommodationentity.setRefrigerator(refrigerator);
	accommodationentity.setTelevision(television);
	accommodationentity.setFurniture(furniture);

	accommodationentity.setCarpark(carpark);
	accommodationentity.setClosedcircuitcamera(closedcircuitcamera);
	accommodationentity.setElevator(elevator);
	accommodationentity.setWashingmachine(washingmachine);
	accommodationentity.setDrinkingwaterdispenser(drinkingwaterdispenser);
	accommodationentity.setSwimmingpool(swimmingpool);
	accommodationentity.setFitness(fitness);
	accommodationentity.setKeycard(keycard);
	
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(request);
	List<BlobKey> blobKeys = blobs.get("pictureaccommodation");
	if (blobKeys != null && blobKeys.size() > 0) {
		accommodationentity.setPictureaccommodation(blobKeys.get(0).getKeyString());
	}

	AccommodationDao accommodationdao = new AccommodationDao();
	accommodationdao.saveAccommodationEntity(accommodationentity);
	accommodationdao.closeEntityManager();

	response.sendRedirect("/accommodation-management.jsp?lessorID=" + lessorID);
%>