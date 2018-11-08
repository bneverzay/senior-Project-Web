<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.mfu.dao.*"%>
<%@ page import="com.mfu.entity.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.appengine.api.blobstore.*"%>
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

	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
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
				href="house-dashboard.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-dashboard"></i> Dashboard</a></li>
			<li><a
				href="edit-accommodation-house.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-edit"></i> Edit Accommodation</a></li>
			<li><a
				href="house-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-tent"></i> Manage House</a></li>
			<li><a
				href="house-status-house.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-tasks"></i> Status House</a></li>
			<li><a
				href="house-room-picture-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-picture"></i> Manage Room Picture</a></li>
			<li><a
				href="house-booking-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-modal-window"></i> Manage Booking</a></li>
			<li><a
				href="house-renter-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-user"></i> Manage Renter</a></li>
			<li><a
				href="house-rental-invoice-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-credit-card"></i> Manage Rental Invoice</a></li>
			<li><a
				href="reportarepair-management-house.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
					class="glyphicon glyphicon-wrench"></i> Manage Repair</a></li>
			<li><a
				href="feedback-house.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><i
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
							Management <small> House Information</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-edit"></i>
								Edit Accommodation</li>
						</ol>
						<!-- /#Page Header -->
						<!-- Form Input -->
						<form style="margin: 0cm 12cm 0cm 0cm;" method="post"
							action="<%=blobstoreService.createUploadUrl("/save-edit-accommodation-house.jsp")%>"
							enctype="multipart/form-data">
							<div class="form-horizontal">
								<input type="hidden" id="lessorID" name="lessorID"
									value="<%=lessorentity.getKeyStringLessorEntity()%>"> <input
									type="hidden" id="accommodationID" name="accommodationID"
									value="<%=accommodationentity.getKeyStringAccommodationEntity()%>">
								<div class="form-group">
									<div class="col-sm-8" style="margin: 0% 0% 1% 47%;">
										<img id="pictureaccommodation"
											src="/getFileContent?blobkey=<%=accommodationentity.getPictureaccommodation()%>"
											style="width: 200px; height: 200px;" />
									</div>
									<div style="margin-left: 50%;">
										<span class="btn btn-primary btn-file">Upload Picture
											House <input type="file" accept="image/png, image/jpeg"
											id="pictureaccommodation" name="pictureaccommodation"
											value="/getFileContent?blobkey=<%=accommodationentity.getPictureaccommodation()%>"
											onchange="uploadpicture(this);">
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="accommodationname">House
										name:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="accommodationname"
											value="<%=accommodationentity.getAccommodationname()%>"
											maxlength="30" name="accommodationname"
											placeholder="<%=accommodationentity.getAccommodationname()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="address">Address:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="address"
											value="<%=accommodationentity.getAddress()%>" name="address"
											maxlength="60"
											placeholder="<%=accommodationentity.getAddress()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="district">District:</label>
									<div class="col-sm-8">
										<select class="form-control" id="district" name="district"
											style="width: 100%;">
											<%
												String MueangChiangRai = "MueangChiangRai";
												String WiangChai = "WiangChai";
												String ChiangKhong = "ChiangKhong";
												String Thoeng = "Thoeng";
												String Phan = "Phan";
												String PaDaet = "PaDaet";
												String MaeChan = "MaeChan";
												String ChiangSaen = "ChiangSaen";
												String MaeSai = "MaeSai";
												String MaeSuai = "MaeSuai";
												String WiangPaPao = "WiangPaPao";
												String PhayaMengrai = "PhayaMengrai";
												String WiangKaen = "WiangKaen";
												String KhunTan = "KhunTan";
												String MaeFaLuang = "MaeFaLuang";
												String MaeLao = "MaeLao";
												String WiangChiangRung = "WiangChiangRung";
												String DoiLuang = "DoiLuang";
												if (MueangChiangRai.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MueangChiangRai" selected>Mueang
												Chiang Rai</option>
											<%
												} else {
											%>
											<option value="MueangChiangRai">Mueang Chiang Rai</option>
											<%
												}
											%>
											<%
												if (WiangChai.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="WiangChai" selected>Wiang Chai</option>
											<%
												} else {
											%>
											<option value="WiangChai">Wiang Chai</option>
											<%
												}
											%>
											<%
												if (ChiangKhong.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="ChiangKhong" selected>Chiang Khong</option>
											<%
												} else {
											%>
											<option value="ChiangKhong">Chiang Khong</option>
											<%
												}
											%>
											<%
												if (Thoeng.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="Thoeng" selected>Thoeng</option>
											<%
												} else {
											%>
											<option value="Thoeng">Thoeng</option>
											<%
												}
											%>
											<%
												if (Phan.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="Phan" selected>Phan</option>
											<%
												} else {
											%>
											<option value="Phan">Phan</option>
											<%
												}
											%>
											<%
												if (PaDaet.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="PaDaet" selected>Pa Daet</option>
											<%
												} else {
											%>
											<option value="PaDaet">Pa Daet</option>
											<%
												}
											%>
											<%
												if (MaeChan.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MaeChan" selected>Mae Chan</option>
											<%
												} else {
											%>
											<option value="MaeChan">Mae Chan</option>
											<%
												}
											%>
											<%
												if (ChiangSaen.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="ChiangSaen" selected>Chiang Saen</option>
											<%
												} else {
											%>
											<option value="ChiangSaen">Chiang Saen</option>
											<%
												}
											%>
											<%
												if (MaeSai.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MaeSai" selected>Mae Sai</option>
											<%
												} else {
											%>
											<option value="MaeSai">Mae Sai</option>
											<%
												}
											%>
											<%
												if (MaeSuai.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MaeSuai" selected>Mae Suai</option>
											<%
												} else {
											%>
											<option value="MaeSuai">Mae Suai</option>
											<%
												}
											%>
											<%
												if (WiangPaPao.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="WiangPaPao" selected>Wiang Pa Pao</option>
											<%
												} else {
											%>
											<option value="WiangPaPao">Wiang Pa Pao</option>
											<%
												}
											%>
											<%
												if (PhayaMengrai.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="PhayaMengrai" selected>Phaya Mengrai</option>
											<%
												} else {
											%>
											<option value="PhayaMengrai">Phaya Mengrai</option>
											<%
												}
											%>
											<%
												if (WiangKaen.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="WiangKaen" selected>Wiang Kaen</option>
											<%
												} else {
											%>
											<option value="WiangKaen">Wiang Kaen</option>
											<%
												}
											%>
											<%
												if (KhunTan.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="KhunTan" selected>Khun Tan</option>
											<%
												} else {
											%>
											<option value="KhunTan">Khun Tan</option>
											<%
												}
											%>
											<%
												if (MaeFaLuang.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MaeFaLuang" selected>Mae Fa Luang</option>
											<%
												} else {
											%>
											<option value="MaeFaLuang">Mae Fa Luang</option>
											<%
												}
											%>
											<%
												if (MaeLao.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="MaeLao" selected>Mae Lao</option>
											<%
												} else {
											%>
											<option value="MaeLao">Mae Lao</option>
											<%
												}
											%>
											<%
												if (WiangChiangRung.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="WiangChiangRung" selected>Wiang
												Chiang Rung</option>
											<%
												} else {
											%>
											<option value="WiangChiangRung">Wiang Chiang Rung</option>
											<%
												}
											%>
											<%
												if (DoiLuang.equalsIgnoreCase(accommodationentity.getDistrict())) {
											%>
											<option value="DoiLuang" selected>Doi Luang</option>
											<%
												} else {
											%>
											<option value="DoiLuang">Doi Luang</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="province">Province:</label>
									<div class="col-sm-8">
										<select class="form-control" id="province" name="province"
											style="width: 100%;">
											<%
												String ChiangRai = "ChiangRai";
												if (ChiangRai.equalsIgnoreCase(accommodationentity.getProvince())) {
											%>
											<option value="ChiangRai" selected>Chiang Rai</option>
											<%
												} else {
											%>
											<option value="ChiangRai">Chiang Rai</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="telephone">Telephone:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="telephone"
											value="<%=accommodationentity.getTelephone()%>"
											maxlength="10" name="telephone"
											placeholder="<%=accommodationentity.getTelephone()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="email">Email:</label>
									<div class="col-sm-8">
										<input type="email" class="form-control" id="email"
											value="<%=accommodationentity.getEmail()%>" maxlength="30"
											name="email"
											placeholder="<%=accommodationentity.getEmail()%>" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="bank">Bank:</label>
									<div class="col-sm-8">
										<select class="form-control" id="bank" name="bank"
											style="width: 100%;">
											<%
												String KBANK = "KBANK";
												String TMB = "TMB";
												String SCB = "SCB";
												String KTB = "KTB";
												if (KBANK.equalsIgnoreCase(accommodationentity.getBank())) {
											%>
											<option value="KBANK" selected>KBANK</option>
											<%
												} else {
											%>
											<option value="KBANK">KBANK</option>
											<%
												}
											%>
											<%
												if (TMB.equalsIgnoreCase(accommodationentity.getBank())) {
											%>
											<option value="TMB" selected>TMB</option>
											<%
												} else {
											%>
											<option value="TMB">TMB</option>
											<%
												}
											%>
											<%
												if (SCB.equalsIgnoreCase(accommodationentity.getBank())) {
											%>
											<option value="SCB" selected>SCB</option>
											<%
												} else {
											%>
											<option value="SCB">SCB</option>
											<%
												}
											%>
											<%
												if (KTB.equalsIgnoreCase(accommodationentity.getBank())) {
											%>
											<option value="KTB" selected>KTB</option>
											<%
												} else {
											%>
											<option value="KTB">KTB</option>
											<%
												}
											%>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="accountname">Account
										name:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="accountname"
											value="<%=accommodationentity.getAccountname()%>"
											maxlength="30" name="accountname"
											placeholder="<%=accommodationentity.getAccountname()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="accountno">Account
										no:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="accountno"
											value="<%=accommodationentity.getAccountno()%>"
											maxlength="10" name="accountno"
											placeholder="<%=accommodationentity.getAccountno()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="rentrates">Rent
										rates:</label>
									<div class="col-sm-8">
										<input class="form-control" id="rentrates"
											value="<%=accommodationentity.getRentrates()%>" type="number"
											min="0" max="20000" pattern="[0-9]" name="rentrates"
											placeholder="<%=accommodationentity.getRentrates()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="depositrates">Deposit
										rates:</label>
									<div class="col-sm-8">
										<input class="form-control" id="depositrates"
											value="<%=accommodationentity.getDepositrates()%>"
											type="number" min="0" max="20000" pattern="[0-9]"
											name="depositrates"
											placeholder="<%=accommodationentity.getDepositrates()%>"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"
										for="facilitiesinaccommodation">Facilities in room:</label>
								</div>
								<div class="form-group" style="margin: -3.8% 0% 0% 34.5%;">
									<div class="col-sm-20">
										<%
											String airconditioner = "airconditioner";
											String fan = "fan";
											String waterheater = "waterheater";
											String furniture = "furniture";
											String refrigerator = "refrigerator";
											String television = "television";
											if (airconditioner.equalsIgnoreCase(accommodationentity.getAirconditioner())) {
										%>
										<label class="checkbox-inline"><input
											id="airconditioner" name="airconditioner"
											value="airconditioner" type="checkbox" checked>Air-conditioner</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input
											id="airconditioner" name="airconditioner"
											value="airconditioner" type="checkbox">Air-conditioner</label>
										<%
											}
										%>
										<%
											if (fan.equalsIgnoreCase(accommodationentity.getFan())) {
										%>
										<label class="checkbox-inline"><input id="fan"
											name="fan" value="fan" type="checkbox" checked>Fan</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input id="fan"
											name="fan" value="fan" type="checkbox">Fan</label>
										<%
											}
										%>
										<%
											if (waterheater.equalsIgnoreCase(accommodationentity.getWaterheater())) {
										%>
										<label class="checkbox-inline"><input id="waterheater"
											name="waterheater" value="waterheater" type="checkbox"
											checked>Waterheater</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input id="waterheater"
											name="waterheater" value="waterheater" type="checkbox">Waterheater</label>
										<%
											}
										%>
									</div>
									<div class="col-sm-20">
										<%
											if (furniture.equalsIgnoreCase(accommodationentity.getFurniture())) {
										%>
										<label class="checkbox-inline"><input id="furniture"
											name="furniture" value="furniture" type="checkbox" checked>Furniture</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input id="furniture"
											name="furniture" value="furniture" type="checkbox">Furniture</label>
										<%
											}
										%>
										<%
											if (refrigerator.equalsIgnoreCase(accommodationentity.getRefrigerator())) {
										%>
										<label class="checkbox-inline"><input
											id="refrigerator" name="refrigerator" value="refrigerator"
											type="checkbox" checked>Refrigerator</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input
											id="refrigerator" name="refrigerator" value="refrigerator"
											type="checkbox">Refrigerator</label>
										<%
											}
										%>
										<%
											if (television.equalsIgnoreCase(accommodationentity.getTelevision())) {
										%>
										<label class="checkbox-inline"><input id="television"
											name="television" value="television" type="checkbox" checked>Television</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input id="television"
											name="television" value="television" type="checkbox">Television</label>
										<%
											}
										%>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"
										for="facilitiesinaccommodation">Facilities in house:</label>
								</div>
								<div class="form-group" style="margin: -3.8% 0% 0% 34.5%;">
									<%
										String carpark = "carpark";
										String closedcircuitcamera = "closedcircuitcamera";
									%>
									<div class="col-sm-20">
										<%
											if (carpark.equalsIgnoreCase(accommodationentity.getCarpark())) {
										%>
										<label class="checkbox-inline"><input type="checkbox"
											id="carpark" name="carpark" value="carpark" checked>Carpark</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input type="checkbox"
											id="carpark" name="carpark" value="carpark">Carpark</label>
										<%
											}
										%>
										<%
											if (closedcircuitcamera.equalsIgnoreCase(accommodationentity.getClosedcircuitcamera())) {
										%>
										<label class="checkbox-inline"><input type="checkbox"
											id="closedcircuitcamera" name="closedcircuitcamera"
											value="closedcircuitcamera" checked>Closed-circuit
											camera</label>
										<%
											} else {
										%>
										<label class="checkbox-inline"><input type="checkbox"
											id="closedcircuitcamera" name="closedcircuitcamera"
											value="closedcircuitcamera">Closed-circuit camera</label>
										<%
											}
										%>
									</div>
								</div>
							</div>
							<div class="row" style="margin: 2% 0% 0% 51%;">
								<a
									href="house-dashboard.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
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