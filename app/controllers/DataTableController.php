<?php

class DataTableController extends BaseController
{
	public function getDataTable()
	{
		//return DB::table('employee')->get();
		return View::make('dataTable');
	}

	public function postAjaxData()
	{
		$requestData=Input::all();								//		get('column_name');-> for getting a specific value   //get('has');-> for checking specific value
		$searchParameter = $requestData['search']['value'];		//	if there is a search parameter, $requestData['search']['value'] contains search parameter
		$orderingColumnIndex=$requestData['order'][0]['column'];//	$requestData['order'][0]['column'] contains colmun index
		$orderingDirection=$requestData['order'][0]['dir'];		//	$requestData['order'][0]['dir'] contains order such as asc/desc
		$drawValue=$requestData['draw'];
		$dataSeekStart=$requestData['start'];
		$dataSeekPerRequestLength=$requestData['length'];

		$columns = array(	//As organised in the html table columns
							// datatable column index  => database column name
							0	=>	'employee_name', 
							1	=>	'employee_salary',
							2	=>	'employee_age'
						);
/////////////////////////////////////////////////////////////////////////////////////Main Query Start
		//Basic Query
		$main_query		= DB::table('employee')
						->select('employee_name', 'employee_salary', 'employee_age');
		////Search Filtering
		if( !empty($searchParameter) )
		{
			$main_query	=	$main_query
							->where('employee_name', 'like', '%'.$searchParameter.'%')
							->orWhere('employee_salary', 'like', $searchParameter.'%')
							->orWhere('employee_age', 'like', $searchParameter.'%');
		}

		$totalFiltered	=$main_query->count();

		//Ordering
		$main_query	=	$main_query->orderBy($columns[$orderingColumnIndex], $orderingDirection);
		//Limiting for Pagination
		$main_query	=	$main_query->skip($dataSeekStart)->take($dataSeekPerRequestLength);

		$all_data		=$main_query->get();
		$totalData		= DB::table('employee')->count();
////////////////////////////////////////////////////////////////////////////////////Main Query End
		foreach ($all_data as $data_single)
		{
			//var_dump($data_single->name);
			$nestedData=array(); 

			$nestedData[] = $data_single->employee_name;
			$nestedData[] = $data_single->employee_salary;
			$nestedData[] = $data_single->employee_age;

			$data[] = $nestedData;
		}

		$json_data = array(
					"draw"            => intval( $requestData['draw'] ),	// for every request/draw by clientside , they send a number as a parameter, when they recieve a response/data they first check the draw number, so we are sending same number in draw. 
					"recordsTotal"    => intval( $totalData ),				// total number of records
					"recordsFiltered" => intval( $totalFiltered ),			// total number of records after searching, if there is no searching then totalFiltered = totalData
					"data"            => $data								// total data array
					);

		return $json_data;
	}
}