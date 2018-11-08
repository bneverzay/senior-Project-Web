<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PAK NHAI DEE</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/pnd.css">
</head>
<%
	String lessorID = request.getParameter("lessorID");
	LessorDao lessordao = new LessorDao();
	LessorEntity lessorentity = lessordao.findLessorEntityByKey(lessorID);
	lessordao.closeEntityManager();
	String accommodationID = request.getParameter("accommodationID");
	AccommodationDao accommodationdao = new AccommodationDao();
	AccommodationEntity accommodationentity = accommodationdao.findAccommodationEntityByKey(accommodationID);
	accommodationdao.closeEntityManager();
	String roomID = request.getParameter("roomID");
	RoomDao roomdao = new RoomDao();
	RoomEntity roomentity = roomdao.findRoomEntityByKey(roomID);
	roomdao.closeEntityManager();
%>
<body>
	<!-- Navber -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand"
				href="home-lessor.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>">PAK
				NHAI DEE</a>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>
	<!-- /#Navbar -->
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<div class="profile-sidebar">
				<%
					if (lessorentity.getPictureprofile() == null || lessorentity.getPictureprofile() == "") {
				%>
				<div class="profile-userpic">
					<img src="img/userpic.png" alt="">
				</div>
				<%
					} else {
				%>
				<div class="profile-userpic">
					<img
						src="/getFileContent?blobkey=<%=lessorentity.getPictureprofile()%>"
						alt="">
				</div>
				<%
					}
				%>
				<div class="profile-usertitle">
					<div class="profile-usertitle-fullname"><%=lessorentity.getFirstname()%>
						<%=lessorentity.getLastname()%></div>
					<%
						String apartment = "apartment";
						String house = "house";
						if (accommodationentity.getTypeofaccommodation().equalsIgnoreCase(apartment)) {
					%>
					<div class="profile-usertitle-apartmentname"><%=accommodationentity.getAccommodationname()%>
						Apartment
					</div>
					<%
						} else {
					%>
					<div class="profile-usertitle-apartmentname"><%=accommodationentity.getAccommodationname()%>
						House
					</div>
					<%
						}
					%>
				</div>
			</div>
			<li><a
				href="home-lessor.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>"><i
					class="glyphicon glyphicon-home"></i> Home</a></li>
			<li><a
				href="apartment-dashboard.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-dashboard"></i> Dashboard</a></li>
			<li><a
				href="edit-accommodation-apartment.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-edit"></i> Edit Accommodation</a></li>
			<li><a
				href="room-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-tent"></i> Manage Room</a></li>
			<li><a
				href="apartment-status-room.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-tasks"></i> Status Room</a></li>
			<li><a
				href="apartment-room-picture-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-picture"></i> Manage Room Picture</a></li>
			<li><a
				href="apartment-booking-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-modal-window"></i> Manage Booking</a></li>
			<li><a
				href="apartment-renter-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-user"></i> Manage Renter</a></li>
			<li><a
				href="apartment-rental-invoice-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-credit-card"></i> Manage Rental Invoice</a></li>
			<li><a
				href="reportarepair-management-apartment.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-wrench"></i> Manage Repair</a></li>
			<li><a
				href="feedback-apartment.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-comment"></i> Feedback</a></li>
			<li><a href="index.jsp"><i
					class="glyphicon glyphicon-log-out"></i> Logout</a></li>
		</ul>
	</div>
	<!-- /#sidebar-wrapper -->
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Page Content -->
		<div id="page-content-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<!-- Page Header -->
						<h1 class="page-header">
							Management <small>Room Information</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-pencil"></i>
								Edit Room</li>
						</ol>
						<!-- /#Page Header -->
						<!-- Form Input -->
						<form style="margin: 0cm 12cm 0cm 0cm;" method="post"
							action="save-edit-room-apartment.jsp?roomID=<%=roomentity.getKeyStringRoomEntity()%>&lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4" for="roomnumber">Room
										number:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="roomnumber"
											name="roomnumber" maxlength="10"
											value="<%=roomentity.getRoomnumber()%>"
											placeholder="<%=roomentity.getRoomnumber()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="typeroomofapartment">Type
										of room:</label>
									<div class="col-sm-8">
										<%
											String fan = "fan";
											String airconditioner = "airconditioner";
											if (fan.equalsIgnoreCase(roomentity.getTyperoomofapartment())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeroomofapartment" name="typeroomofapartment"
											value="fan" checked>Fan</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeroomofapartment" name="typeroomofapartment"
											value="fan">Fan</label>
										<%
											}
										%>
										<%
											if (airconditioner.equalsIgnoreCase(roomentity.getTyperoomofapartment())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeroomofapartment" name="typeroomofapartment"
											value="airconditioner" checked>Air conditioner</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeroomofapartment" name="typeroomofapartment"
											value="airconditioner">Air conditioner</label>
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="accommodationsize"
										style="margin: 0.2cm 0cm 0cm 0cm;">Room size (sq. m.):</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="99.99" pattern="[0-9]"
											step="0.01" class="form-control" id="accommodationsize"
											name="accommodationsize"
											value="<%=roomentity.getAccommodationsize()%>"
											placeholder="<%=roomentity.getAccommodationsize()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="typeofbed">Type
										of bed:</label>
									<div class="col-sm-8">
										<%
											String singlebed = "singlebed";
											String doublebed = "doublebed";
											if (singlebed.equalsIgnoreCase(roomentity.getTypeofbed())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofbed" name="typeofbed" value="singlebed" checked>Single
											bed</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofbed" name="typeofbed" value="singlebed">Single
											bed</label>
										<%
											}
										%>
										<%
											if (doublebed.equalsIgnoreCase(roomentity.getTypeofbed())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofbed" name="typeofbed" value="doublebed" checked>Double
											bed</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofbed" name="typeofbed" value="doublebed">Double
											bed</label>
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="balconyapartment">Balcony
										apartment:</label>
									<div class="col-sm-8">
										<%
											String Yes = "Yes";
											String No = "No";
											if (Yes.equalsIgnoreCase(roomentity.getBalconyapartment())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="balconyapartment" name="balconyapartment" value="Yes"
											checked>Yes</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="balconyapartment" name="balconyapartment" value="Yes">Yes</label>
										<%
											}
										%>
										<%
											if (No.equalsIgnoreCase(roomentity.getBalconyapartment())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="balconyapartment" name="balconyapartment" value="No"
											checked>No</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="balconyapartment" name="balconyapartment" value="No">No</label>
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="typeofbathroom">Type
										of bathroom:</label>
									<div class="col-sm-8">
										<select class="form-control" id="typeofbathroom"
											name="typeofbathroom" style="width: 100%;">
											<%
												String sharedbathroom = "sharedbathroom";
												String separatebathroom = "separatebathroom";
												if (sharedbathroom.equalsIgnoreCase(roomentity.getTypeofbathroom())) {
											%>
											<option value="sharedbathroom" selected>Shared
												Bathroom</option>
											<%
												} else {
											%>
											<option value="sharedbathroom">Shared Bathroom</option>
											<%
												}
											%>
											<%
												if (separatebathroom.equalsIgnoreCase(roomentity.getTypeofbathroom())) {
											%>
											<option value="separatebathroom" selected>Separate
												Bathroom</option>
											<%
												} else {
											%>
											<option value="separatebathroom">Separate Bathroom</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="maxcapacity">Max
										capacity:</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="3" pattern="[0-9]"
											class="form-control" id="maxcapacity" name="maxcapacity"
											value="<%=roomentity.getMaxcapacity()%>"
											placeholder="<%=roomentity.getMaxcapacity()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="rent">Rent:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="20000" pattern="[0-9]"
											class="form-control" id="rent" name="rent"
											value="<%=roomentity.getRent()%>"
											placeholder="<%=roomentity.getRent()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="deposit">Deposit:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="20000" pattern="[0-9]"
											class="form-control" id="deposit" name="deposit"
											maxlength="5" value="<%=roomentity.getDeposit()%>"
											placeholder="<%=roomentity.getDeposit()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="rentalagreement">Rental
										agreement:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="12" pattern="[0-9]"
											class="form-control" id="rentalagreement"
											value="<%=roomentity.getRentalagreement()%>"
											name="rentalagreement"
											placeholder="<%=roomentity.getRentalagreement()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"
										for="typeofrentalagreement">Type of rental agreement:</label>
									<div class="col-sm-8">
										<%
											String Month = "Month";
											String Year = "Year";
											if (Month.equalsIgnoreCase(roomentity.getTypeofrentalagreement())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofrentalagreement" name="typeofrentalagreement"
											value="Month" checked>Month</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofrentalagreement" name="typeofrentalagreement"
											value="Month">Month</label>
										<%
											}
										%>
										<%
											if (Year.equalsIgnoreCase(roomentity.getTypeofrentalagreement())) {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofrentalagreement" name="typeofrentalagreement"
											value="Year" checked>Year</label>
										<%
											} else {
										%>
										<label class="radio-inline"><input type="radio"
											id="typeofrentalagreement" name="typeofrentalagreement"
											value="Year">Year</label>
										<%
											}
										%>
									</div>
								</div>
							</div>
							<div class="row" style="margin: 2% 0% 0% 51%;">
								<a
									href="room-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
										type="button" class="btn btn-danger">Cancel</button></a>
								<button type="submit" class="btn btn-success">Change</button>
							</div>
						</form>
						<!-- /#Form Input -->
					</div>
				</div>
			</div>
		</div>
		<!-- /#page-content-wrapper -->
	</div>
	<!-- wrapper -->

	<!-- jQuery -->
	<script src="js/jquery-3.1.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

	<!-- Script upload picture -->
	<script src="js/pnd.js"></script>

</body>

</html>