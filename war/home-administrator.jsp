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
	String administratorID = request.getParameter("administratorID");
	AdministratorDao administratordao = new AdministratorDao();
	AdministratorEntity administratorentity = administratordao.findAdministratorEntityByKey(administratorID);
	administratordao.closeEntityManager();

	MemberDao memberdao = new MemberDao();
	List<MemberEntity> memberentity = memberdao.getAllMemberEntitys();
	LessorDao lessordao = new LessorDao();
	List<LessorEntity> lessorentity = lessordao.getAllLessorEntitys();
	AccommodationDao accommodationdao = new AccommodationDao();
	List<AccommodationEntity> accommodationentity = accommodationdao.getAllAccommodationEntitys();
	RoomDao roomdao = new RoomDao();
	List<RoomEntity> roomentity = roomdao.getAllRoomEntitys();
	RentalDao rentaldao = new RentalDao();
	List<RentalEntity> rentalentity = rentaldao.getAllRentalEntitys();
%>
<body>
	<!-- Navber -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand"
				href="home-administrator.jsp?administratorID=<%=administratorentity.getKeyStringAdministratorEntity()%>">PAK
				NHAI DEE</a>
		</div>
	</div>
	<!-- /.container-fluid --> </nav>
	<!-- /#Navbar -->
	<!-- Sidebar -->
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<div class="profile-sidebar">
				<div class="profile-userpic">
					<img src="img/administrator.png" alt="">
				</div>
				<div class="profile-usertitle">
					<div class="profile-usertitle-fullname"></div>
					<div class="profile-usertitle-apartmentname">Welcome TO
						Administrator</div>
				</div>
			</div>
			<li><a
				href="home-administrator.jsp?administratorID=<%=administratorentity.getKeyStringAdministratorEntity()%>"><i
					class="glyphicon glyphicon-home"></i> Home</a></li>
			<li><a
				href="administrator-manage-lessor.jsp?administratorID=<%=administratorentity.getKeyStringAdministratorEntity()%>"><i
					class="glyphicon glyphicon-user"></i> Manage Lessor</a></li>
			<li><a
				href="administrator-manage-report.jsp?administratorID=<%=administratorentity.getKeyStringAdministratorEntity()%>"><i
					class="glyphicon glyphicon-list-alt"></i> Manage Report</a></li>
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
							Dashboard <small>Statistics Overview</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-dashboard"></i>
								Dashboard</li>
						</ol>
						<!-- /#Page Header -->

						<h3>Statistics</h3>
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<!-- table -->
								<table class="table table-bordered">
									<tbody>
										<!-- Column -->
										<tr class="danger">
											<th>Number of lessors</th>
											<th>Number of Apartments</th>
											<th>Number of Houses</th>
											<th>Number of Members</th>
										</tr>
										<!-- /#Column -->
										<!-- Row -->
										<%
											int cls = 0;
											for (LessorEntity countlessor : lessorentity) {
												if (countlessor.getStatuslessor().equalsIgnoreCase("approve")) {
													cls += 1;
												}
											}

											int cam = 0;
											for (AccommodationEntity countapartment : accommodationentity) {
												if (countapartment.getTypeofaccommodation().equalsIgnoreCase("apartment")) {
													cam += 1;
												}
											}

											int ch = 0;
											for (AccommodationEntity counthouse : accommodationentity) {
												if (counthouse.getTypeofaccommodation().equalsIgnoreCase("house")) {
													ch += 1;
												}
											}

											int cm = 0;
											for (MemberEntity countmember : memberentity) {
												cm += 1;
											}
										%>
										<tr>
											<td><%=cls%></td>
											<td><%=cam%></td>
											<td><%=ch%></td>
											<td><%=cm%></td>
										</tr>

										<!-- /#Row -->
									</tbody>
								</table>
								<!-- /#table -->
							</div>
						</div>
						<!-- /#box-body -->
						<!-- /#Description Box -->

						<h3>Commission</h3>
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<!-- table -->
								<table class="table table-bordered">
									<tbody>
										<!-- Column -->
										<tr class="info">
											<th>No.</th>
											<th>Lessor Name</th>
											<th>Accommodation Name</th>
											<th>Type of Apartment</th>
											<th>Deposit Rates</th>
											<th>Service Fees</th>
											<th>Total</th>
										</tr>
										<!-- /#Column -->
										<!-- Row -->
										<%
											int no = 0;
											double total = 0;
											double totalamount = 0;
											for (LessorEntity lessor : lessorentity) {
												for (AccommodationEntity accommodation : accommodationentity) {
													for (RoomEntity room : roomentity) {
														for (RentalEntity rental : rentalentity) {
															if (lessor.getKeyStringLessorEntity().equalsIgnoreCase(accommodation.getLessorID())
																	&& accommodation.getKeyStringAccommodationEntity()
																			.equalsIgnoreCase(room.getAccommodationID())
																	&& room.getKeyStringRoomEntity().equalsIgnoreCase(rental.getRoomID())
																	&& rental.getStatuspayment().equalsIgnoreCase("paymented")) {
																no++;
										%>
										<tr>
											<td><%=no%></td>
											<td><%=lessor.getFirstname()%> <%=lessor.getLastname()%></td>
											<%
												if (accommodation.getTypeofaccommodation().equalsIgnoreCase("apartment")) {
											%>
											<td><%=accommodation.getAccommodationname()%> Apartment</td>
											<%
												} else if (accommodation.getTypeofaccommodation().equalsIgnoreCase("house")) {
											%>
											<td><%=accommodation.getAccommodationname()%> House</td>
											<%
												}
											%>
											<%
												if (accommodation.getTypeofaccommodation().equalsIgnoreCase("apartment")) {
											%>
											<%
												if (accommodation.getTypeofapartment().equalsIgnoreCase("maleapartment")) {
											%>
											<td>Male apartment</td>
											<%
												} else if (accommodation.getTypeofapartment().equalsIgnoreCase("femaleapartment")) {
											%>
											<td>Female apartment</td>
											<%
												} else if ((accommodation.getTypeofapartment().equalsIgnoreCase("bothapartment"))) {
											%>
											<td>Both apartment</td>
											<%
												}
											%>
											<%
												} else if (accommodation.getTypeofaccommodation().equalsIgnoreCase("house")) {
											%>
											<td>-</td>
											<%
												}
											%>

											<!-- How to calculate % -->
											<!-- 100% of 20,000 = 20,000 -->
											<!-- 20,000 * 100 / 100 = 20,000 -->

											<td><%=room.getDeposit()%> Baht</td>
											<td><form method="post"
													action="set-service-fees.jsp?administratorID=<%=administratorentity.getKeyStringAdministratorEntity()%>&accommodationID=<%=accommodation.getKeyStringAccommodationEntity()%>">
													<div class="flexContainer">
														<input type="number" class="inputField" id="servicefees"
															name="servicefees" pattern="[0-9]" min="0" max="100"
															step="0.5" value="<%=accommodation.getServicefees()%>"
															placeholder="<%=accommodation.getServicefees()%>"><button type="submit" class="btn btn-success">Set</button></input>

													</div>
												</form></td>

											<%
												double deposit = room.getDeposit();
											%>

											<td><%=total = (deposit * accommodation.getServicefees()) / 100%>
												Baht</td>
											<%
												totalamount += total;
											%>
										</tr>
										<%
											}
														}
													}
												}
											}
										%>
										<tr class="active">
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td>Total Amount</td>
											<td><%=totalamount%> Baht</td>
										</tr>
										<!-- /#Row -->
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

</body>

</html>