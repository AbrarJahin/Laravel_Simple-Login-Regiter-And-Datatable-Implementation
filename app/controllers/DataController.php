<?php

class DataController extends BaseController
{
	public function getDataTable()			//Creating data Table
	{
		$state		=	DB::table('state')		->select('name', 'id')->orderBy('name', 'asc')	->get();
		$country	=	DB::table('country')	->select('Name', 'ID')->orderBy('Name', 'asc')	->get();
		$company	=	DB::table('company')	->select('name', 'id')->orderBy('name', 'asc')	->get();
		return View::make('data')->with('state', $state)->with('country', $country)->with('company', $company);
	}

	public function add_new_entry()			//Adding a data
	{
		DB::table('project')->insert(
    									array(
    											'state_id'					=> Input::get('state_id'),
												'country_id'				=> Input::get('country_id'),
												'city'						=> Input::get('city'),
												'site_id'					=> Input::get('site_id'),
												'companyID'					=> Input::get('company_id'),
												'completion_date'			=> Input::get('completation_date'),
												'active_ipp'				=> Input::get('active_ipp'),
												'description'				=> Input::get('description'),
												'total_excess_furniture'	=> Input::get('total_excess_ferniture'),
												'disposed_in_landfill_tons'	=> Input::get('disposed_in_landfill_tons'),
												'sold_tons'					=> Input::get('sold_tons'),
												'sold_net_cash'				=> Input::get('sold_net_cash'),
												'recycled_tons'				=> Input::get('recycled_tons'),
												'recycled_net_cash'			=> Input::get('recycled_net_cash'),
												'reuse_tons'				=> Input::get('reused_tons'),
												'reuse_saved'				=> Input::get('reuse_saved'),
												'donation_tons'				=> Input::get('donation_tons'),
												'donation_value'			=> Input::get('donation_value'),
												'total_cost_to_dispose'		=> Input::get('total_cost_to_dipose'),
												'actual_cost_dispose'		=> Input::get('actual_cost'),
												'disposal_avoidance_saving'	=> Input::get('disposal_avoidance_savings'),
												'created_date'				=> Carbon\Carbon::now()->toDateTimeString(),
												'is_archived'				=> 0,
												'account_id'				=> 1	//this should come from aythintication info
    										)
									);

		return Redirect::to('datatable');
	}

	public function edit_a_entry()			//Editing a data
	{
		DB::table('project')
			->where('id', '=', Input::get('id'))
			->update(
						array(
								'state_id'					=> Input::get('state_id'),
								'country_id'				=> Input::get('country_id'),
								'city'						=> Input::get('city'),
								'site_id'					=> Input::get('site_id'),
								'companyID'					=> Input::get('company_id'),
								'completion_date'			=> Input::get('completation_date'),
								'active_ipp'				=> Input::get('active_ipp'),
								'description'				=> Input::get('description'),
								'total_excess_furniture'	=> Input::get('total_excess_ferniture'),
								'disposed_in_landfill_tons'	=> Input::get('disposed_in_landfill_tons'),
								'sold_tons'					=> Input::get('sold_tons'),
								'sold_net_cash'				=> Input::get('sold_net_cash'),
								'recycled_tons'				=> Input::get('recycled_tons'),
								'recycled_net_cash'			=> Input::get('recycled_net_cash'),
								'reuse_tons'				=> Input::get('reused_tons'),
								'reuse_saved'				=> Input::get('reuse_saved'),
								'donation_tons'				=> Input::get('donation_tons'),
								'donation_value'			=> Input::get('donation_value'),
								'total_cost_to_dispose'		=> Input::get('total_cost_to_dipose'),
								'actual_cost_dispose'		=> Input::get('actual_cost'),
								'disposal_avoidance_saving'	=> Input::get('disposal_avoidance_savings'),
								'created_date'				=> Carbon\Carbon::now()->toDateTimeString(),
								'is_archived'				=> 0,
								'account_id'				=> 1	//this should come from aythintication info
							)
					);
		return Redirect::to('datatable');
	}

	public function edit_a_entry_before()			//Getting Data Before Editing
	{
		return DB::table('project')->where('project.id', '=', Input::get('id'))->get();
	}

	public function delete_a_entry()		//Deleting a data
	{
		if(DB::table('project')->where('project.id', '=', Input::get('id'))->delete())
		{
			return "Deleted Successfully";
		}
		else
		{
			return "Deletion Failed !!!!";
		}
	}

	public function postDataTable()
	{
		$requestData=Input::all();

		$columns = array(
						// datatable column index  => database column name	->	Should be same as the main HTML table -> Used for Finding Sorting Index Correctly
							0	=> 'project.completion_date',
							1	=> 'project.site_id',
							2	=> 'country.name',
							3	=> 'state.code',
							4	=> 'project.city',
							5	=> 'project.active_ipp',	//Should be changed at the time of searching - Because value= Active or IPP
							6	=> 'project.description',
							7	=> 'project.total_excess_furniture',
							8	=> 'project.disposed_in_landfill_tons',			//Can run filtering upto this data
							9	=> '(project.disposed_in_landfill_tons*100/project.total_excess_furniture)',
							10	=> 'project.sold_tons',
							11	=> '(project.sold_tons*100/project.total_excess_furniture)',
							12	=> 'project.sold_net_cash',
							13	=> 'project.recycled_tons',
							14	=> '(project.recycled_tons*100/project.total_excess_furniture)',
							15	=> 'project.recycled_net_cash',
							16	=> 'project.reuse_tons',
							17	=> '(project.reuse_tons*100/project.total_excess_furniture)',
							18	=> 'project.reuse_saved',
							19	=> 'project.donation_tons',
							20	=> '(project.donation_tons*100/project.total_excess_furniture)',
							21	=> 'project.donation_value',
							22	=> '(project.sold_tons + project.recycled_tons + project.recycled_tons + project.donation_tons)',
							23	=> '(project.sold_tons + project.recycled_tons + project.recycled_tons + project.donation_tons)*100/project.total_excess_furniture)',
							24	=> 'project.total_cost_to_dispose',
							25	=> 'project.actual_cost_dispose',
							26	=> '(project.total_cost_to_dispose - project.actual_cost_dispose)',
							27	=> '(project.total_excess_furniture / 4.74)',
							28	=> '(project.total_excess_furniture / 0.008876404)',
							29	=> '(project.total_excess_furniture / 7.25)',
							30	=> '(project.total_excess_furniture / 0.008876404*0.009801)'
						);

		$draw_request_code=$requestData['draw'];


		//Search Variables
		$completion_date		=	$requestData['columns'][0]['search']['value'];
		$site_id				=	$requestData['columns'][1]['search']['value'];
		$country				=	$requestData['columns'][2]['search']['value'];
		$state					=	$requestData['columns'][3]['search']['value'];
		$city					=	$requestData['columns'][4]['search']['value'];
		$active_ipp				=	$requestData['columns'][5]['search']['value'];
		$project_description	=	$requestData['columns'][6]['search']['value'];
		$total_excess_furniture_tons	=	$requestData['columns'][7]['search']['value'];
		$disposed_in_landfill_tons		=	$requestData['columns'][8]['search']['value'];

		//Ordering
		$column_index_for_ordering	=	$requestData['order'][0]['column'];		//$requestData['order'][0]['column'] contains column index
		$column_ordering_direction	=	$requestData['order'][0]['dir'];		//$requestData['order'][0]['dir'] contains order such as asc/desc

		//Limiting Data for Pagination
		$start_data_index			=	$requestData['start'];
		$per_page_content_number	=	$requestData['length'];

		//Custom Data - From other Fields
		$startDate	=	$requestData['StartDate'];
		$endData	=	$requestData['EndDate'];
		$CountryID	=	$requestData['CountryID'];
		$StateID	=	$requestData['StateID'];
		$CompanyID	=	$requestData['CompanyID'];

//Query goes from here///////////////////////////////////////////////////////////
		$baseQuery	=	DB::table(	'project')
							->join(	'country',	'project.country_id',	'=',	'country.ID')
							->join(	'state',	'project.state_id',		'=',	'state.id')
							->select(	'project.completion_date as completion_date',
										'project.site_id as site_id',
										'country.name as country',
										'state.code as state',
										'project.city as city',
										DB::raw('IF(project.active_ipp = 0, "IPP" , "Active") as active_ipp'),
										'project.description as project_description',
										'project.total_excess_furniture as total_excess_furniture_tons',
										'project.disposed_in_landfill_tons as disposed_in_landfill_tons',
										DB::raw('FORMAT(project.disposed_in_landfill_tons*100/project.total_excess_furniture, 2) as disposed_in_landfill_per_cent'),
										'project.sold_tons as sold_tons',
										DB::raw('FORMAT(project.sold_tons*100/project.total_excess_furniture, 2) as sold_per_cent'),
										'project.sold_net_cash as sold_net_cash',
										'project.recycled_tons as recycled_tons',
										DB::raw('FORMAT(project.recycled_tons*100/project.total_excess_furniture, 2) as recycled_per_cent'),
										'project.recycled_net_cash as recycled_net_cash',
										'project.reuse_tons as reused_tons',
										DB::raw('FORMAT(project.reuse_tons*100/project.total_excess_furniture, 2) as reused_per_cent'),
										'project.reuse_saved as saved_vs_buying_new',
										'project.donation_tons as donated_tons',
										DB::raw('FORMAT(project.donation_tons*100/project.total_excess_furniture, 2) as donated_per_cent'),
										'project.donation_value as donation_value',
										DB::raw('FORMAT(project.sold_tons + project.recycled_tons + project.recycled_tons + project.donation_tons, 2) as total_diverted_from_landfall_tons'),
										DB::raw('FORMAT((project.sold_tons + project.recycled_tons + project.recycled_tons + project.donation_tons)*100/project.total_excess_furniture, 2) as total_diverted_from_landfall_per_cent'),
										'project.total_cost_to_dispose as estimated_cost_to_dispose',
										'project.actual_cost_dispose as actual_total_cost_to_dispose',
										DB::raw('FORMAT(project.total_cost_to_dispose - project.actual_cost_dispose, 2) as disposal_savings'),
										DB::raw('FORMAT(project.total_excess_furniture / 4.74,					2) as cars_not_driven'),
										DB::raw('FORMAT(project.total_excess_furniture / 0.008876404,			2) as gasoline_not_used'),
										DB::raw('FORMAT(project.total_excess_furniture / 7.25,					2) as household_avoided'),
										DB::raw('FORMAT(project.total_excess_furniture / 0.008876404*0.009801,	2) as co2_tons'),
										'project.id as id'
									)
							->where('project.is_archived', '=', 0);

		//Filtering for Custom Page Data
		if(!empty($startDate))
			$baseQuery	=	$baseQuery->where('project.completion_date', '>', $startDate);
		if(!empty($endData))
			$baseQuery	=	$baseQuery->where('project.completion_date', '<', $endData);
		if(!empty($CountryID))
			$baseQuery	=	$baseQuery->where('project.country_id', '=', $CountryID);
		if(!empty($StateID))
			$baseQuery	=	$baseQuery->where('project.state_id', '=', $StateID);
		if(!empty($CompanyID))
			$baseQuery	=	$baseQuery->whereIn('project.companyID', [0, $CompanyID]);


		$totalData	=	$baseQuery->count();

		//Applying Filters - Start
		$query		=	$baseQuery;
		if(!empty($completion_date))
			$query	=	$query->where('project.completion_date', 'LIKE', '%'.$completion_date.'%');
		if(!empty($site_id))
			$query	=	$query->where('project.site_id', 'LIKE', '%'.$site_id.'%');
		if(!empty($country))
			$query	=	$query->where('country.name', 'LIKE', '%'.$country.'%');
		if(!empty($state))
			$query	=	$query->where('state.code', 'LIKE', '%'.$state.'%');
		if(!empty($city))
			$query	=	$query->where('project.city', 'LIKE', '%'.$city.'%');
		if(!empty($active_ipp))
		{
			if($active_ipp=="I" || $active_ipp=="i" || $active_ipp=="IP" || $active_ipp=="ip" || $active_ipp=="IPP" || $active_ipp=="ipp")
				$active_ipp=0;
			else
				$active_ipp=1;
			$query	=	$query->where('project.active_ipp', 'LIKE', '%'.$active_ipp.'%');
		}
		if(!empty($project_description))
			$query	=	$query->where('project.description', 'LIKE', '%'.$project_description.'%');
		if(!empty($total_excess_furniture_tons))
			$query	=	$query->where('project.total_excess_furniture', 'LIKE', '%'.$total_excess_furniture_tons.'%');
		if(!empty($disposed_in_landfill_tons))
			$query	=	$query->where('project.disposed_in_landfill_tons', 'LIKE', '%'.$disposed_in_landfill_tons.'%');
		//Applying Filters - End

		$totalFiltered	=	$query->count();
		//Ordering and Limiting Current data
		if ($column_index_for_ordering<31)		//Complex columns are not handled now
		{
			$query	=	$query->orderBy($columns[$column_index_for_ordering], $column_ordering_direction);
		}
		if($per_page_content_number>0)		//For showing All Data
			$query	=	$query->skip($start_data_index)->take($per_page_content_number);
		$data	=	$query->get();
//Query ends here////////////////////////////////////////////////////////////////


//Formetting data for sending
		$json_data	=	array(
						"draw"            => intval( $draw_request_code ),   // for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
						"recordsTotal"    => intval( $totalData ),  // total number of records
						"recordsFiltered" => intval( $totalFiltered ), // total number of records after searching, if there is no searching then totalFiltered = totalData
						"data"            => $data   // total data array
					);

		return $json_data;
	}
}