<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="javax.persistence.*"%>
<%@ page import="java.util.List"%>
<%
	String lessorID = request.getParameter("lessorID");
	String accommodationID = request.getParameter("accommodationID");
	AccommodationDao accommodationdao = new AccommodationDao();
	AccommodationEntity accommodationentity = accommodationdao.findAccommodationEntityByKey(accommodationID);
	accommodationdao.closeEntityManager();
	String memberID = request.getParameter("memberID");
	String roomID = request.getParameter("roomID");
	RoomDao roomdao = new RoomDao();
	RoomEntity roomentity = roomdao.findRoomEntityByKey(roomID);
	roomdao.closeEntityManager();

	String unitofwaterused = request.getParameter("unitofwaterused");
	String unitofelectricityused = request.getParameter("unitofelectricityused");
	String internetfee = request.getParameter("internetfee");
	String fitnessfee = request.getParameter("fitnessfee");
	String swimmingfee = request.getParameter("swimmingfee");
	String fine = request.getParameter("fine");
	String otherfee = request.getParameter("otherfee");
	String date = request.getParameter("date");

	double wu = accommodationentity.getWaterunit();
	double eu = accommodationentity.getElectricityunit();

	float r = roomentity.getRent();
	float uow = Float.parseFloat(unitofwaterused);
	float uoe = Float.parseFloat(unitofelectricityused);
	float inf = Float.parseFloat(internetfee);
	float fnf = Float.parseFloat(fitnessfee);
	float smf = Float.parseFloat(swimmingfee);
	float f = Float.parseFloat(fine);
	float of = Float.parseFloat(otherfee);

	double caluow = uow * wu;
	double caluoe = uoe * eu;

	double totalrent = r + caluow + caluoe + inf + fnf + smf + f + of;

	RentalInvoiceEntity rentalinvoiceentity = new RentalInvoiceEntity();
	RentalInvoiceDao rentalinvoicedao = new RentalInvoiceDao();

	rentalinvoiceentity.setAccommodationID(accommodationID);
	rentalinvoiceentity.setRoomID(roomID);
	rentalinvoiceentity.setMemberID(memberID);
	rentalinvoiceentity.setRent(roomentity.getRent());
	rentalinvoiceentity.setWaterunit(accommodationentity.getWaterunit());
	rentalinvoiceentity.setElectricityunit(accommodationentity.getElectricityunit());
	rentalinvoiceentity.setUnitofwaterused(Float.parseFloat(unitofwaterused));
	rentalinvoiceentity.setUnitofelectricityused(Float.parseFloat(unitofelectricityused));
	rentalinvoiceentity.setInternetfee(Float.parseFloat(internetfee));
	rentalinvoiceentity.setFitnessfee(Float.parseFloat(fitnessfee));
	rentalinvoiceentity.setSwimmingfee(Float.parseFloat(swimmingfee));
	rentalinvoiceentity.setOtherfee(Float.parseFloat(otherfee));
	rentalinvoiceentity.setFine(Float.parseFloat(fine));
	rentalinvoiceentity.setTotalrent(totalrent);
	rentalinvoiceentity.setDate(date);

	rentalinvoiceentity.setStatuspayment("unpayment");

	rentalinvoicedao.saveRentalInvoiceEntity(rentalinvoiceentity);
	rentalinvoicedao.closeEntityManager();

	response.sendRedirect(
			"house-rental-invoice-management.jsp?lessorID=" + lessorID + "&accommodationID=" + accommodationID);
%>