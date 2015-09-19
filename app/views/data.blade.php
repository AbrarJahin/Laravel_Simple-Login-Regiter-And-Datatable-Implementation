<!DOCTYPE html>
<html>
	<head>
		<title>Datatable</title>
		<meta charset="utf-8">
		<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

		<!-- This 2 is for jQuery UI -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/jquery.dataTables.min.css">
		<link rel="stylesheet" type="text/css" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

		<!--  This is for Bootstrap UI
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.9/css/dataTables.bootstrap.min.css">
		-->

		<!-- Plugin for Column Visiblity - CSS - 1 file -->
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/1.0.3/css/buttons.dataTables.min.css">

		<link rel="stylesheet" type="text/css" href="datepicker/dhtmlxcalendar.css"/>

		<link rel="stylesheet" type="text/css" href="css/datable_custom.css">
	</head>
	<body>
		<!-- Navigation Menu - Start -->
		<nav class="navbar navbar-custom navbar-static-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="/" id="brand">
						<span class="glyphicon glyphicon-book" aria-hidden="true"></span> Welcome Administrator
					</a>
				</div>

				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li class="active"><a href="manage-project">MY PROJECTS</a></li>
						<li><a href="manage-account">SETTINGS</a></li>
						<li><a href="home">VISIT HOME PAGE</a></li>
					</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
							<span><img src="http://hpipppm.com/images/default-user-icon.jpg"></span> Administrator <span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="logout">Sign Out</a></li>
						</ul>
					</li>
				</ul>
				</div><!--/.nav-collapse -->
			</div>
		</nav>
		<!-- Navigation Menu - END -->

		<!-- Warning showing for add, edit and delete -->
		<div class="alert" style="background-color:#9FF781;display:none;">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong>Done - </strong> Deleted Successfully.
		</div>
		<!-- Warning showing for add, edit and delete - END -->

		<div class="container">

			<div class="row">
				<div class="col-sm-2">
					<div class="form-group">
						<div class="input-group">
							<span style="min-width:50px;" class="input-group-addon">Start Date</span>
							<input class="form-control" type="text" id="start_date_of_page" value="" placeholder="yyyy-mm-dd">
						</div>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<div class="input-group">
							<span style="min-width:50px;" class="input-group-addon">End Date</span>
							<input class="form-control" type="text" id="end_date_of_page" value="" placeholder="yyyy-mm-dd">
						</div>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<div class="input-group">
							<span style="min-width:50px;" class="input-group-addon">Country</span>
							<select required id="country_id_of_page" class="form-control">
								<option value="">All<!--  Countries --></option>
								@foreach ($country as $s)
									<option value={{ $s->ID }}>{{ $s->Name }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<div class="input-group">
							<span style="min-width:50px;" class="input-group-addon">State</span>
							<select required id="state_id_of_page" name="state_id" class="form-control">
								<option value="">All<!--  State --></option>
								@foreach ($state as $s)
									<option value={{ $s->id }}>{{ $s->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group">
						<div class="input-group">
							<span style="min-width:50px;" class="input-group-addon">Company</span>
							<select required id="company_id_of_page" name="company_id" class="form-control">
								<option value="">All<!--  Company --></option>
								@foreach ($company as $s)
									<option value={{ $s->id }}>{{ $s->name }}</option>
								@endforeach
							</select>
						</div>
					</div>
				</div>

				<div class="col-sm-2 btn-group">
					<button id="export_to_excel" type="button" class="btn btn-primary">
						<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span> Excel
					</button>
					<button id="export_to_pdf" type="button" class="btn btn-warning">
						<span class="glyphicon glyphicon-hdd" aria-hidden="true"></span> PDF
					</button>
				</div>
			</div>

			<table id="employee-grid"  class="display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th style="min-width: 110px;">Completion Date</th>
						<th>Site ID</th>
						<th>Country</th>
						<th>State</th>
						<th>City</th>
						<th>Active / IPP</th>
						<th style="min-width: 250px;">DESCRIPTION OF PROJECT / WORK</th>
						<th>TOTAL EXCESS FURNITURE, TONS</th>
						<th>DISPOSED IN LANDFILL - TONS</th>
						<th>DISPOSED IN LANDFILL - %</th>
						<th>SOLD - TONS</th>
						<th>SOLD - %</th>
						<th>SOLD - Net Cash to HP</th>
						<th>RECYCLED - TONS</th>
						<th>RECYCLED - %</th>
						<th>RECYCLED - Net Cash to HP</th>
						<th>RE-USED - TONS</th>
						<th>RE-USED - %</th>
						<th>RE-USED - Saved vs. Buying New</th>
						<th>DONATED - TONS</th>
						<th>DONATED - %</th>
						<th>DONATED - Donation Value</th>
						<th>TOTAL DIVERTED FROM LANDFILL - TONS</th>
						<th>TOTAL DIVERTED FROM LANDFILL - %</th>
						<th>EST. TOTAL COST TO DISPOSE</th>
						<th>ACTUAL HP COST TO DISPOSE</th>
						<th>DISPOSAL SAVINGS</th>
						<th>CO2 EMISSIONS REDUCED - Number of Passenger Cars not driven for one year</th>
						<th>CO2 EMISSIONS REDUCED - GASOLINE NOT USED, GALLONS</th>
						<th>CO2 EMISSIONS REDUCED - Household worth of electricity use avoided for one year</th>
						<th>CO2 EMISSIONS REDUCED - CO2 TONS</th>
						<th>Action</th>
					</tr>
					<tr>
						<td valign="middle"><input type="text" id="0" placeholder="Select Date" class="employee-search-input datepicker" readonly="readonly"></td>
						<td><input type="text" id="1" placeholder="Search" class="employee-search-input"></td>
						<td><input type="text" id="2" placeholder="Search" class="employee-search-input"></td>
						<td><input type="text" id="3" placeholder="Search" class="employee-search-input" ></td>
						<td><input type="text" id="4" placeholder="Search" class="employee-search-input" ></td>
						<td><input type="text" id="5" placeholder="Search" class="employee-search-input" ></td>
						<td><input type="text" id="6" placeholder="Search" class="employee-search-input" ></td>
						<th><input type="text" id="7" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="8" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="9" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="10" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="11" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="12" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="13" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="14" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="15" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="16" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="17" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="18" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="19" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="20" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="21" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="22" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="23" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="24" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="25" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="26" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="27" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="28" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="29" placeholder="Search" class="employee-search-input" ></th>
						<th><input type="text" id="30" placeholder="Search" class="employee-search-input" ></th>
						<th></th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th></th>
						<th>TOTAL EXCESS FURNITURE, TONS</th>
						<th>DISPOSED IN LANDFILL - TONS</th>
						<th></th>
						<th>SOLD - TONS</th>
						<th></th>
						<th>SOLD - Net Cash to HP</th>
						<th>RECYCLED - TONS</th>
						<th></th>
						<th>RECYCLED - Net Cash to HP</th>
						<th>RE-USED - TONS</th>
						<th></th>
						<th>RE-USED - Saved vs. Buying New</th>
						<th>DONATED - TONS</th>
						<th></th>
						<th>DONATED - Donation Value</th>
						<th>TOTAL DIVERTED FROM LANDFILL - TONS</th>
						<th>TOTAL DIVERTED FROM LANDFILL - %</th>
						<th>EST. TOTAL COST TO DISPOSE</th>
						<th>ACTUAL HP COST TO DISPOSE</th>
						<th>DISPOSAL SAVINGS</th>
						<th>Passenger Cars not driven</th>
						<th>GASOLINE NOT USED</th>
						<th>Household worth of electricity</th>
						<th>CO2 EMISSIONS REDUCED</th>
						<th></th>
					</tr>
				</tfoot>
			</table>
		</div>

		<!-- Modal Add - Start -->
		<div data-backdrop="static" data-keyboard="false" class="modal fade" id="addNewData" role="dialog">
			<div class="modal-dialog">

			<!-- Modal content for Pop Up -->
			<div class="modal-content">
				<div class="modal-header panel-primary">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="popup_header">Add a New Record</h4>
				</div>
				<form role="form" action="add_new_entry_post" method="post">
					<div class="modal-body">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">State</span>
									<select required name="state_id" class="form-control">
										<option value="">Please Select State</option>
										@foreach ($state as $s)
											<option value={{ $s->id }}>{{ $s->name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Country</span>
									<select required name="country_id" class="form-control">
										<option value="">Please Select Country</option>
										@foreach ($country as $s)
											<option value={{ $s->ID }}>{{ $s->Name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">City</span>
									<input required type="text" name="city" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Site ID</span>
									<input required type="text" name="site_id" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Company</span>
									<select required name="company_id" class="form-control">
										<option value="">Please Select a Company</option>
										@foreach ($company as $s)
											<option value={{ $s->id }}>{{ $s->name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Completion Date</span>
									<input required type="date" name="completation_date" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Active / IPP</span>
									<select required name="active_ipp" class="form-control">
										<option value="">Please Select Status</option>
										<option value=1>Active</option>
										<option value=0>IPP</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<textarea required name="description" placeholder="Description.." class="form-control" rows="7"></textarea>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Total Excess Ferniture (Tons)</span>
									<input required type="text" name="total_excess_ferniture" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Disposed In Landfill (Tons)</span>
									<input required type="text" name="disposed_in_landfill_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Sold (Tons)</span>
									<input required type="text" name="sold_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Sold - Net Cash ($)</span>
									<input required type="text" name="sold_net_cash" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Recycled (Tons)</span>
									<input required type="text" name="recycled_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Recycled - Net Cash ($)</span>
									<input required type="text" name="recycled_net_cash" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Reused (Tons)</span>
									<input required type="text" name="reused_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Reuse - Saved ($)</span>
									<input required type="text" name="reuse_saved" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Donation - (Tons)</span>
									<input required type="text" name="donation_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Donation - Value ($)</span>
									<input required type="text" name="donation_value" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Total Cost to Dispose ($)</span>
									<input required type="text" name="total_cost_to_dipose" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Actual Cost Dispose ($)</span>
									<input required type="text" name="actual_cost" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Disposal Avoidance Saving ($)</span>
									<input required type="text" name="disposal_avoidance_savings" class="form-control">
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" id="popup_button">Add Data</button>
						<!-- <input class="btn btn-danger" type="reset" value="Reset"> -->
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
			</div>
		</div>
		<!-- Modal Add - End -->

		<!-- Modal Edit - Start -->
		<div data-backdrop="static" data-keyboard="false" class="modal fade" id="editData" role="dialog">
			<div class="modal-dialog">

			<!-- Modal content for Pop Up -->
			<div class="modal-content">
				<div class="modal-header panel-primary">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Record</h4>
				</div>
				<form role="form" id="popup_form_edit" action="edit_entry_post" method="post">
					<div class="modal-body">
							<input type="hidden" id="content_id_edit" name="id">
							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">State</span>
									<select required id="state_edit" name="state_id" class="form-control">
										<option value="">Please Select State</option>
										@foreach ($state as $s)
											<option value={{ $s->id }}>{{ $s->name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Country</span>
									<select required id="country_edit" name="country_id" class="form-control">
										<option value="">Please Select Country</option>
										@foreach ($country as $s)
											<option value={{ $s->ID }}>{{ $s->Name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">City</span>
									<input required id="city_edit" type="text" name="city" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Site ID</span>
									<input required type="text" id="site_id_edit" name="site_id" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Company</span>
									<select required id="company_edit" name="company_id" class="form-control">
										<option value="">Please Select a Company</option>
										@foreach ($company as $s)
											<option value={{ $s->id }}>{{ $s->name }}</option>
										@endforeach
									</select>
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Completion Date</span>
									<input required id="completion_date_edit" type="date" name="completation_date" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Active / IPP</span>
									<select required id="active_ipp_edit" name="active_ipp" class="form-control">
										<option value="">Please Select Status</option>
										<option value=1>Active</option>
										<option value=0>IPP</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<textarea required id="description_edit" name="description" placeholder="Description.." class="form-control" rows="7"></textarea>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Total Excess Ferniture (Tons)</span>
									<input id="total_excess_ferniture_edit" required type="text" name="total_excess_ferniture" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Disposed In Landfill (Tons)</span>
									<input required id="display_in_lanfall_edit" type="text" name="disposed_in_landfill_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Sold (Tons)</span>
									<input required id="sold_tons_edit" type="text" name="sold_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Sold - Net Cash ($)</span>
									<input required type="text" id="sold_cash_edit" name="sold_net_cash" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Recycled (Tons)</span>
									<input required type="text" id="recycled_tons_edit" name="recycled_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Recycled - Net Cash ($)</span>
									<input required type="text" id="recycled_cash_edit" name="recycled_net_cash" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Reused (Tons)</span>
									<input required type="text" id="reused_tons_edit" name="reused_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Reuse - Saved ($)</span>
									<input required type="text" id="reuse_saved_edit" name="reuse_saved" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Donation - (Tons)</span>
									<input required type="text" id="donation_tons_edit" name="donation_tons" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Donation - Value ($)</span>
									<input required type="text" id="donation_value_edit" name="donation_value" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Total Cost to Dispose ($)</span>
									<input required type="text" id="total_cost_to_dispose_edit" name="total_cost_to_dipose" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Actual Cost Dispose ($)</span>
									<input required type="text" id="actual_cost_edit" name="actual_cost" class="form-control">
								</div>
							</div>

							<div class="form-group">
								<div class="input-group">
									<span class="input-group-addon">Disposal Avoidance Saving ($)</span>
									<input required type="text" id="disposal_avoidance_savings_edit" name="disposal_avoidance_savings" class="form-control">
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Edit Existing Data</button>
						<!-- <input class="btn btn-danger" type="reset" value="Reset"> -->
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
			</div>
		</div>
		<!-- Modal Edit - End -->

		
	</body>

		<!-- External Javascript Sources - Start -->
		<script type="text/javascript" language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script type="text/javascript" language="javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

		<!-- This 2 for jQuery UI -->
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- 	This 2 for Bootstrap UI
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.9/js/dataTables.bootstrap.min.js"></script>
 -->

		<!-- Plugin for Column Visiblity - JS - 2 files -->
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/dataTables.buttons.min.js"></script>
		<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/buttons/1.0.3/js/buttons.colVis.min.js"></script>

		<script src="datepicker/dhtmlxcalendar.js"></script>

		<script type="text/javascript" language="javascript" src="js/datatable_custom.js"></script>
		<!-- External Javascript Sources - End -->
</html>