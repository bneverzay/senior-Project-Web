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
	String memberID = request.getParameter("memberID");
	MemberDao memberdao = new MemberDao();
	MemberEntity memberentity = memberdao.findMemberEntityByKey(memberID);
	memberdao.closeEntityManager();
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
							Management <small>House Rental Invoice</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-eye-open"></i>
								View Payment</li>
						</ol>
						<!-- /#Page Header -->

						<h4>Outstanding Debt Report</h4>
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<!-- table -->
								<table class="table table-bordered">
									<tbody>
										<!-- Column -->
										<tr class="danger">
											<th>NO</th>
											<th>Unit of water used</th>
											<th>Unit of electricity used</th>
											<th>Internet fee</th>
											<th>Fitness fee</th>
											<th>Swimming fee</th>
											<th>Fine</th>
											<th>Other fee</th>
											<th>Total Rent</th>
											<th>Bill Date</th>
										</tr>
										<!-- /#Column -->
										<!-- Row -->
										<%
											int no = 0;
											RentalInvoiceDao rentalinvoicedao = new RentalInvoiceDao();
											List<RentalInvoiceEntity> rentalinvoiceentity = rentalinvoicedao.getAllRentalInvoiceEntitys();
											for (RentalInvoiceEntity rentalinvoice : rentalinvoiceentity) {
												if (memberentity.getKeyStringMemberEntity().equalsIgnoreCase(rentalinvoice.getMemberID())
														&& rentalinvoice.getStatuspayment().equalsIgnoreCase("unpayment")) {
													no++;
										%>
										<tr>
											<td><%=no%></td>
											<td><%=rentalinvoice.getUnitofwaterused()%></td>
											<td><%=rentalinvoice.getUnitofelectricityused()%></td>
											<td><%=rentalinvoice.getInternetfee()%></td>
											<td><%=rentalinvoice.getFitnessfee()%></td>
											<td><%=rentalinvoice.getSwimmingfee()%></td>
											<td><%=rentalinvoice.getFine()%></td>
											<td><%=rentalinvoice.getOtherfee()%></td>
											<td><%=rentalinvoice.getTotalrent()%></td>
											<td><%=rentalinvoice.getDate()%></td>
										</tr>
										<%
											}
											}
										%>
										<!-- /#Row -->
									</tbody>
								</table>
								<!-- /#table -->
							</div>
						</div>
						<!-- /#box-body -->
						<!-- /#Description Box -->

						<h4>Paymented</h4>
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<!-- table -->
								<table class="table table-bordered">
									<tbody>
										<!-- Column -->
										<tr class="danger">
											<th>NO</th>
											<th>Name</th>
											<th>Amount Money</th>
											<th>Payment Date</th>
											<th>Rent</th>
											<th>Bill Date</th>
										</tr>
										<!-- /#Column -->
										<!-- Row -->
										<%
											int number = 0;
											for (RentalInvoiceEntity rentalinvoice : rentalinvoiceentity) {
												if (memberentity.getKeyStringMemberEntity().equalsIgnoreCase(rentalinvoice.getMemberID())
														&& rentalinvoice.getStatuspayment().equalsIgnoreCase("paymented")) {
													number++;
										%>
										<tr>
											<td><%=number%></td>
											<td><%=rentalinvoice.getName()%></td>
											<td><%=rentalinvoice.getAmountmoney()%></td>
											<td><%=rentalinvoice.getDatepaymentrent()%> <%=rentalinvoice.getTimepaymentrent()%></td>
											<td><%=rentalinvoice.getTotalrent()%></td>
											<td><%=rentalinvoice.getDate()%></td>
										</tr>
										<%
											}
											}
										%>
										<!-- /#Row -->
									</tbody>
								</table>
								<!-- /#table -->
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