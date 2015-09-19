//Applied on Table with ID = "employee-grid"

$(document).ready(function(e)
{
	var dataTable =  $('#employee-grid').DataTable(
	{
		"scrollX": true,
		processing: true,
		serverSide: true,			//For Enabling AJAX
		"deferRender": true,		//For Speed up procesing time
		"ajax":
		{
			"url": "datatable_post",
			"type": 'POST',
			"data": function ( d )				//Sending Custom Data for manupulating with elements out of the table
					{
						d.StartDate	=	$('#start_date_of_page').val();
						d.EndDate	=	$('#end_date_of_page').val();
						d.CountryID	=	$('#country_id_of_page').val();
						d.StateID	=	$('#state_id_of_page').val();
						d.CompanyID	=	$('#company_id_of_page').val();
					},
			"error": function()									//Custom Error Function
					{									// error handling
						$(".employee-grid-error").html("");
						$("#employee-grid").append('<tbody class="employee-grid-error"><tr><th colspan="3">No data found in the server</th></tr></tbody>');
						$("#employee-grid_processing").css("display","none");
						
					}
		},
		"columns":	[				//Name should be same as PHP file JSON NAmes and ordering should be as in the HTML file
						{	"data": "completion_date"	},
						{	"data": "site_id"			},
						{	"data": "country"		},
						{	"data": "state"		},
						{	"data": "city"			},
						{	"data": "active_ipp"	},
						{	"data": "project_description"},

						{	"data": "total_excess_furniture_tons"},
						{	"data": "disposed_in_landfill_tons"},
						{	"data": "disposed_in_landfill_per_cent"},
						{	"data": "sold_tons"},
						{	"data": "sold_per_cent"},
						{	"data": "sold_net_cash"},
						{	"data": "recycled_tons"},
						{	"data": "recycled_per_cent"},
						{	"data": "recycled_net_cash"},
						{	"data": "reused_tons"},
						{	"data": "reused_per_cent"},
						{	"data": "saved_vs_buying_new"},
						{	"data": "donated_tons"},
						{	"data": "donated_per_cent"},
						{	"data": "donation_value"},
						{	"data": "total_diverted_from_landfall_tons"},
						{	"data": "total_diverted_from_landfall_per_cent"},
						{	"data": "estimated_cost_to_dispose"},
						{	"data": "actual_total_cost_to_dispose"},
						{	"data": "disposal_savings"},
						{	"data": "cars_not_driven"},
						{	"data": "gasoline_not_used"},
						{	"data": "household_avoided"},
						{	"data": "co2_tons"},

						{	"data": null},		//If it is not null then buttons would not be shown
					],
		//"pagingType": "full_numbers",	//Adding Last and First in Pagination
		stateSave: true,

		"language":{					//Custom Message Setting
						"lengthMenu": "Display _MENU_ records per page",	//Customizing menu Text
						"zeroRecords": "Nothing found - sorry",				//Customizing zero record text - filtered
						"info": "Showing page _PAGE_ of _PAGES_",			//Customizing showing record no
						"infoEmpty": "No records available",				//Customizing zero record message - base
						"infoFiltered": "(filtered from _MAX_ total records)"	//Customizing filtered message
					},

		"lengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],		//For customizing number of data sets per page

		dom: 'l<"toolbar">Bfrtip',	//"Bfrtip" is for column visiblity - B F and R become visible
		initComplete:	function()	//Adding Custom button in Tools
						{
							$("div.toolbar").html('<div class="btn-group" style="float:right;"><button onclick="resetAllFilters()" type="button" class="btn btn-info btn-lg">Reset All Filters</button><button onclick="addNewEntry()" class="btn btn-success btn-lg">Add a New Record</button></div>');
						},
		orderCellsTop: true,			//Collumn Visiblity Buttons - Visual Reorganising - Bug Fixing
		buttons:	[					//Collumn Visiblity Buttons
						{
							extend: 'colvis',
							collectionLayout: 'fixed four-column',			//Number of Columns in Column Viiblity POP Up
							postfixButtons: [ 'colvisRestore' ]
						}
					],
		"columnDefs":	[								//For Action Buttons (Edit and Delete button) adding in the Action Column
							{
								"orderable": false,		//Turn off ordering
								"searchable": false,	//Turn off searching
								"targets": [31],			//Going to last column - 0 is the last column index because o is starting index
								"data": null,			//Not receiving any data
								"defaultContent": '<div style="min-width:70px" class="btn-group" role="group"><button type="button" class="edit btn btn-warning btn-sm"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button><button type="button" class="delete btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button></div>'
							}
						],

	});

	///Calender Showing- Strat
	var	datePicker = new dhtmlXCalendarObject(["start_date_of_page","end_date_of_page"]);
	datePicker.attachEvent("onClick",function(date)
	{
		dataTable.ajax.reload( null, false );
	});
	///Calender Showing- END

	$('#employee-grid tbody').on( 'click', 'button.edit', function ()	//Handeling Edit Button Click
	{
		var data = dataTable.row( $(this).parents('tr') ).data();
		itemEdit(data['id']);	//id = index of ID sent from server
		dataTable.ajax.reload( null, false );
	} );

	$('#employee-grid tbody').on( 'click', 'button.delete', function ()	//Handeling Delete Button Click
	{
		var data = dataTable.row( $(this).parents('tr') ).data();
		itemDelete(data['id']);	//id = index of ID sent from server
		dataTable.ajax.reload( null, false );
	} );

	$("#employee-grid_filter").css("display","none");  // hiding global search box

	//Custom Search Boxes-Start////////////////////////////////////////////////////
	$('.employee-search-input').on( 'keyup change', function ()
	{   
		var i =$(this).attr('id');	// getting column index
		var v =$(this).val();		// getting search input value
		dataTable.columns(i).search(v).draw();
	} );
	//Custom Search Boxes-End//////////////////////////////////////////////////////

	//Export to EXCEL Data
	$( "#export_to_excel" ).click(function()
	{
		$.post( "http://hpipppm.com/project/export/excel" );
	});

	//Data Bos Outside Table AJAX applying/////////////////////////////////////////
	$(document).on("keyup change", "#start_date_of_page,#end_date_of_page,#country_id_of_page,#state_id_of_page,#company_id_of_page", function()
	{
		dataTable.ajax.reload( null, false );
	});

	//Date Picker Adding and Options-Start///////////////////////////////////////////////
	$( ".datepicker" ).datepicker(
	{
		dateFormat: "yy-mm-dd",
		showOn: "button",
		showAnim: 'slideDown',
		showButtonPanel: true ,
		autoSize: true,
		buttonImage: "//jqueryui.com/resources/demos/datepicker/images/calendar.gif",
		buttonImageOnly: true,
		buttonText: "Select date",
		closeText: "Clear"
	});

	$(document).on("click", ".ui-datepicker-close", function()
	{
		$('.datepicker').val("");
		dataTable.columns(0).search("").draw();
	});
	//Date Picker Adding and Options-End///////////////////////////////////////////////
});

function resetAllFilters()
{
	$('#employee-grid').DataTable().state.clear();		//Clear all state
	$(':input').val('');								//Clear all input
	//$('#employee-grid').DataTable().ajax.reload( null, false );		//Reload Table
	location.reload();
}

function addNewEntry()
{
	$("#addNewData").modal({}).draggable();
	$('#addNewData').modal('show');
}

function itemEdit(item_ID)
{
	$.ajax({
				type:	'POST',
				url:	'edit_entry_before_post',
				data:	{ 
							'id'		: item_ID
						},
				success: function(data)
				{
					//alert(data);
					$.each(data, function(index, element)
					{
					    $.each(element,function(key,value)
					    {
							//console.log(key+" : "+ value);
							if(key.localeCompare('id')==0)
								$('#content_id_edit').val(value);
							else if(key.localeCompare('state_id')==0)
								$("#state_edit").val(value);
							else if(key.localeCompare('country_id')==0)
								$('#country_edit').val(value);
							else if(key.localeCompare('city')==0)
								$('#city_edit').val(value);
							else if(key.localeCompare('site_id')==0)
								$('#site_id_edit').val(value);
							else if(key.localeCompare('companyID')==0)
								$('#company_edit').val(value);
							else if(key.localeCompare('completion_date')==0)
								$('#completion_date_edit').val(value);
							else if(key.localeCompare('active_ipp')==0)
								$('#active_ipp_edit').val(value);
							else if(key.localeCompare('description')==0)
								$('#description_edit').val(value);
							else if(key.localeCompare('total_excess_furniture')==0)
								$('#total_excess_ferniture_edit').val(value);
							else if(key.localeCompare('disposed_in_landfill_tons')==0)
								$('#display_in_lanfall_edit').val(value);
							else if(key.localeCompare('sold_tons')==0)
								$('#sold_tons_edit').val(value);
							else if(key.localeCompare('sold_net_cash')==0)
								$('#sold_cash_edit').val(value);
							else if(key.localeCompare('recycled_tons')==0)
								$('#recycled_tons_edit').val(value);
							else if(key.localeCompare('recycled_net_cash')==0)
								$('#recycled_cash_edit').val(value);
							else if(key.localeCompare('reuse_tons')==0)
								$('#reused_tons_edit').val(value);
							else if(key.localeCompare('reuse_saved')==0)
								$('#reuse_saved_edit').val(value);
							else if(key.localeCompare('donation_tons')==0)
								$('#donation_tons_edit').val(value);
							else if(key.localeCompare('donation_value')==0)
								$('#donation_value_edit').val(value);
							else if(key.localeCompare('total_cost_to_dispose')==0)
								$('#total_cost_to_dispose_edit').val(value);
							else if(key.localeCompare('actual_cost_dispose')==0)
								$('#actual_cost_edit').val(value);
							else if(key.localeCompare('disposal_avoidance_saving')==0)
								$('#disposal_avoidance_savings_edit').val(value);
					    });
					});
				}
			});
	$("#editData").modal({}).draggable();
	$('#editData').modal('show');
	dataTable.fnDraw();					//To refresh the table after Editing - Not working
}

function itemDelete(item_ID)
{
	if (confirm("Are you sure to delete?") == true)
	{	//Do something AJAX for deletation
		//alert("Deleted Item with Site ID = "+item_ID);
		$.ajax({
				type:	'POST',
				url:	'delete_entry_post',
				data:	{ 
							'id'		: item_ID
						},
				success: function(data)
				{
					alert(data);
				}
			});
	}
	/*else
	{
		alert("Data is not deleted!!");
	}*/
	dataTable.fnDraw();					////To refresh the table after Deleting - Not Working
}