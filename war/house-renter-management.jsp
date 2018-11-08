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
	String keyaccommodationID = request.getParameter("accommodationID");
	AccommodationDao accommodationdao = new AccommodationDao();
	AccommodationEntity accommodationentity = accommodationdao.findAccommodationEntityByKey(keyaccommodationID);
	accommodationdao.closeEntityManager();
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
							Management <small>Renter Information</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-user"></i>
								Manage Renter</li>
						</ol>
						<!-- /#Page Header -->
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<!-- table -->
								<table class="table table-striped">
									<tbody>
										<!-- Column -->
										<tr>
											<th>No.</th>
											<th>Name</th>
											<th>Gender</th>
											<th>Birth Date</th>
											<th>Occupation</th>
											<th>Address</th>
											<th>Phone</th>
											<th>Email</th>
											<th>House Number</th>
											<th>Check In</th>
											<th>Check Out</th>
											<th>Rental Agreement</th>
											<th>Action</th>
										</tr>
										<!-- /#Column -->
										<%
											RentalDao rentaldao = new RentalDao();
											List<RentalEntity> rentalentity = rentaldao.getAllRentalEntitys();
											MemberDao memberdao = new MemberDao();
											List<MemberEntity> memberentity = memberdao.getAllMemberEntitys();
											RoomDao roomdao = new RoomDao();
											List<RoomEntity> roomentity = roomdao.getAllRoomEntitys();
											for (MemberEntity member : memberentity) {
												for (RoomEntity room : roomentity) {
													for (RentalEntity rental : rentalentity) {
										%>
										<!-- Row -->
										<tr>
											<%
												int no = 0;
															if (accommodationentity.getKeyStringAccommodationEntity()
																	.equalsIgnoreCase(rental.getAccommodationID())
																	&& room.getKeyStringRoomEntity().equalsIgnoreCase(rental.getRoomID())
																	&& member.getKeyStringMemberEntity().equalsIgnoreCase(rental.getMemberID())
																	&& rental.getStatusstay().equalsIgnoreCase("movein")) {
																no++;
											%>
											<td><%=no%></td>
											<td><%=member.getFirstname()%> <%=member.getLastname()%></td>
											<td><%=member.getGender()%></td>
											<td><%=member.getBirthdate()%></td>
											<td><%=member.getOccupation()%></td>
											<td><%=member.getAddress()%></td>
											<td><%=member.getTelephone()%></td>
											<td><%=member.getEmail()%></td>
											<td><%=room.getHousenumber()%></td>
											<td><%=rental.getMoveinaccommodation()%></td>
											<td><%=rental.getMoveoutaccommodation()%></td>
											<td>
												<!-- View Rental Agreement --> <a
												href="house-view-rental-agreement.jsp?rentalID=<%=rental.getKeyStringRentalEntity()%>&lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
														type="button" class="btn btn-block btn-primary">
														<i class="glyphicon glyphicon-eye-open"></i> View
													</button></a> <!-- /.View Rental Agreement -->
											</td>
											<td>
												<!-- Remove Renter --> <a
												href="save-move-out-house-renter-management.jsp?rentalID=<%=rental.getKeyStringRentalEntity()%>&lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
														type="button" class="btn btn-block btn-danger">
														<i class="glyphicon glyphicon-log-out"></i> Move Out
													</button></a> <!-- /.Remove Renter -->
											</td>
											<%
												}
											%>
										</tr>
										<!-- /#Row -->
										<%
											}
												}
											}
										%>
									</tbody>
								</table>
								<!-- /#table -->
							</div>
							<!-- box-body -->
							<div class="box-footer clearfix">
								<ul class="pagination pagination-sm no-margin pull-right">
									<li><a href="#">«</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">»</a></li>
								</ul>
							</div>
						</div>
						<!-- /#box-body -->
						<!-- /#Description Box -->
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