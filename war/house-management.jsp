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
							Management <small>House Information</small>
						</h1>
						<ol class="breadcrumb">
							<li class="active"><i class="glyphicon glyphicon-tent"></i>
								Manage House</li>
						</ol>
						<!-- /#Page Header -->
						<!-- Description Box -->
						<div class="box">
							<div class="box-body table-responsive">
								<div class="row">
									<!-- Add House -->
									<div class="col-md-2 pull-right">
										<button type="button" class="btn btn-block btn-primary"
											data-toggle="modal" data-target="#Addhouse">
											<i class="glyphicon glyphicon-plus"></i> Add House
										</button>
										<br>
									</div>
									<!-- /.Add House -->
								</div>
								<!-- table -->
								<table class="table table-striped">
									<tbody>
										<!-- Column -->
										<tr>
											<th>No.</th>
											<th>House Number</th>
											<th>Number of Bedroom</th>
											<th>Number of Bathroom</th>
											<th>Living Room</th>
											<th>Kitchen Room</th>
											<th>House Size (sq. m.)</th>
											<th>Type of Bed</th>
											<th>Type of Bathroom</th>
											<th>Max Capacity (Person/Room)</th>
											<th>Rent</th>
											<th>Deposit</th>
											<th>Rental Agreement</th>
											<th>Action</th>
										</tr>
										<!-- /#Column -->
										<!-- Row -->
										<%
											int no = 0;
											RoomDao roomdao = new RoomDao();
											List<RoomEntity> roomentity = roomdao.getAllRoomEntitys();
											for (RoomEntity re : roomentity) {
												if (accommodationID.equalsIgnoreCase(re.getAccommodationID())) {
													no++;
										%>
										<tr>
											<td><%=no%></td>
											<td><%=re.getHousenumber()%></td>
											<td><%=re.getNumberofbedroom()%></td>
											<td><%=re.getNumberofbathroom()%></td>
											<td><%=re.getLivingroom()%></td>
											<td><%=re.getKitchenroom()%></td>
											<td><%=re.getAccommodationsize()%></td>
											<td><%=re.getTypeofbed()%></td>
											<td><%=re.getTypeofbathroom()%></td>
											<td><%=re.getMaxcapacity()%></td>
											<td><%=re.getRent()%></td>
											<td><%=re.getDeposit()%></td>
											<td><%=re.getRentalagreement()%> <%=re.getTypeofrentalagreement()%></td>
											<td>
												<!-- Botton Edit House -->
												<div class="btn-group">
													<a
														href="edit-house-house.jsp?roomID=<%=re.getKeyStringRoomEntity()%>&lessorID=<%=lessorentity.getKeyStringLessorEntity()%>
														&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>"><button
															type="button" class="btn btn-primary">
															<i class="glyphicon glyphicon-edit"></i> Edit House
														</button></a>
												</div> <!-- /#Botton Edit House -->
											</td>
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
		<!-- Button trigger modal -->
		<!-- Modal Add House -->
		<form method="post"
			action="save-house-house.jsp?lessorID=<%=lessorentity.getKeyStringLessorEntity()%>&accommodationID=<%=accommodationentity.getKeyStringAccommodationEntity()%>">
			<div class="modal fade" id="Addhouse" tabindex="-1" role="dialog"
				aria-labelledby="AddHouse">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="AddHouse">Add House</h4>
						</div>
						<div class="modal-body">
							<div class="form-horizontal">
								<div class="form-group">
									<label class="control-label col-sm-4" for="housenumber">House
										number:</label>
									<div class="col-sm-8">
										<input type="text" class="form-control" id="housenumber"
											maxlength="10" name="housenumber"
											placeholder="Enter house number" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="numberofbedroom"
										style="margin: 0.2cm 0cm 0cm 0cm;">Number of bedroom:</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="3" pattern="[0-9]"
											class="form-control" id="numberofbedroom"
											name="numberofbedroom" placeholder="Enter number of bedroom"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="typeofbed">Type
										of bed:</label>
									<div class="col-sm-8">
										<select class="form-control" id="typeofbed" name="typeofbed"
											style="width: 100%;" required>
											<option value="singlebed">Single bed</option>
											<option value="doublebed">Double bed</option>
											<option value="singlebedanddoublebed">Single bed,
												Double bed</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="numberofbathroom"
										style="margin: 0.2cm 0cm 0cm 0cm;">Number of bathroom:</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="3" pattern="[0-9]"
											class="form-control" id="numberofbathroom"
											name="numberofbathroom"
											placeholder="Enter number of bathroom" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="typeofbathroom">Bathroom:</label>
									<div class="col-sm-8">
										<select class="form-control" id="typeofbathroom"
											name="typeofbathroom" style="width: 100%;" required>
											<option value="sharedbathroom">Shared Bathroom</option>
											<option value="separatebathroom">Separate Bathroom</option>
											<option value="sharedbathroomandseparatebathroom">Separate
												Bathroom, Shared Bathroom</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="livingroom">Living
										Room:</label>
									<div class="col-sm-8">
										<select class="form-control" id="livingroom" name="livingroom"
											style="width: 100%;" required>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="kitchenroom">Kitchen
										Room:</label>
									<div class="col-sm-8">
										<select class="form-control" id="kitchenroom"
											name="kitchenroom" style="width: 100%;" required>
											<option value="Yes">Yes</option>
											<option value="No">No</option>
										</select>
									</div>
								</div>

								<div class="form-group">
									<label class="control-label col-sm-4" for=accommodationsize
										style="margin: 0.2cm 0cm 0cm 0cm;">House Size (sq.
										m.):</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="99.99" pattern="[0-9]"
											step="0.01" class="form-control" id="accommodationsize"
											name="accommodationsize" placeholder="Enter sethousesize"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="maxcapacity"
										style="margin: 0.2cm 0cm 0cm 0cm;">Max Capacity
										(Person/Room):</label>
									<div class="col-sm-8" style="margin: 0.2cm 0cm 0cm 0cm;">
										<input type="number" min="0" max="3" pattern="[0-9]"
											class="form-control" id="maxcapacity" name="maxcapacity"
											placeholder="Enter maxcapacity" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="rent">Rent:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="20000" pattern="[0-9]"
											class="form-control" id="rent" name="rent"
											placeholder="Enter rent" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="deposit">Deposit:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="20000" pattern="[0-9]"
											class="form-control" id="deposit" name="deposit"
											maxlength="5" placeholder="Enter deposit" required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4" for="rentalagreement">Rental
										agreement:</label>
									<div class="col-sm-8">
										<input type="number" min="0" max="12" pattern="[0-9]"
											class="form-control" id="rentalagreement"
											name="rentalagreement" placeholder="Enter rental agreement"
											required>
									</div>
								</div>
								<div class="form-group">
									<label class="control-label col-sm-4"
										for="typeofrentalagreement">Type of rental agreement:</label>
									<div class="col-sm-8">
										<label class="radio-inline"><input type="radio"
											id="typeofrentalagreement" name="typeofrentalagreement"
											value="Month">Month</label> <label class="radio-inline"><input
											type="radio" id="typeofrentalagreement"
											name="typeofrentalagreement" value="Year">Year</label>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-success">Save</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- /#Modal Add House -->
	</div>
	<!-- wrapper -->

	<!-- jQuery -->
	<script src="js/jquery-3.1.1.min.js"></script>

	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>

</body>

</html>