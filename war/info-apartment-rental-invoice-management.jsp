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
	String memberID = request.getParameter("memberID");
	MemberDao memberdao = new MemberDao();
	MemberEntity memberentity = memberdao.findMemberEntityByKey(memberID);
	memberdao.closeEntityManager();
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
							Management <small>Apartment Rental Invoice</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-bitcoin"></i>
								Manage Rent</li>
						</ol>
						<!-- /#Page Header -->
						<!-- Form Input -->
						<form style="margin: 0cm 12cm 0cm 0cm;" method="post"
							action="save-info-apartment-rental-invoice-management.jsp?memberID=<%=memberentity.getKeyStringMemberEntity()%>&roomID=<%=roomentity.getKeyStringRoomEntity()%>&lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4" for="rentofroom">Rent
										of room:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="rentofroom"
											name="rentofroom" placeholder="<%=roomentity.getRent()%>"
											disabled="disabled">
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="unitofwaterused">Unit
										of water used:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="unitofwaterused"
											name="unitofwaterused" placeholder="Enter unit of water used"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"
										for="unitofelectricityused">Unit of electricity used:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="unitofelectricityused"
											name="unitofelectricityused"
											placeholder="Enter unit of electricity used" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="internetfee">Internet
										fee:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="internetfee" name="internetfee"
											placeholder="Enter internet fee" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="fitnessfee">Fitness
										fee:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="fitnessfee" name="fitnessfee"
											placeholder="Enter fitness fee" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="swimmingfee">Swimming
										fee:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="swimmingfee" name="swimmingfee"
											placeholder="Enter swimming fee" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="fine">Fine:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="fine" name="fine"
											placeholder="Enter fine" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="otherfee">Other
										fee:</label>
									<div class="col-sm-8">
										<input type="number" min="0" pattern="[0-9]"
											class="form-control" id="otherfee" name="otherfee"
											placeholder="Enter other fee" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="date">Date:</label>
									<div class="col-sm-8">
										<input type="date" class="form-control" id="date" name="date"
											required>
									</div>
								</div>
							</div>
							<div class="row" style="margin: 2% 0% 0% 51.5%;">
								<a
									href="apartment-rental-invoice-management.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
										type="button" class="btn btn-danger">Cancel</button></a>
								<button type="submit" class="btn btn-success">Sent</button>
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