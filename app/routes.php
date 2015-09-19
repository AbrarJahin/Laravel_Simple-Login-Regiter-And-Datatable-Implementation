<?php
	Route::get('/','HomeController@showWelcome');

	Route::get('new','HomeController@getNew');

	Route::get('data','DataTableController@getDataTable');
	Route::post('postAjaxData','DataTableController@postAjaxData');

/////////////////////////////////////////////////////////////////
	Route::get('datatable','DataController@getDataTable');			//For finding data table
	Route::post('datatable_post','DataController@postDataTable');		//For AJAX get data
	Route::post('add_new_entry_post','DataController@add_new_entry');	//For Adding
	Route::post('edit_entry_before_post','DataController@edit_a_entry_before');		//For Editing Data finding
	Route::post('edit_entry_post','DataController@edit_a_entry');		//For Editing
	Route::post('delete_entry_post','DataController@delete_a_entry');		//For Deleting
/////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////Login and Registration
	Route::get('login1', 'LoginController@showLogin1');
	Route::get('login2', 'LoginController@showLogin2');
	Route::post('login', 'LoginController@showLogin_requst');

	Route::get('register', 'LoginController@register');
	Route::post('register', 'LoginController@register_requst');

	Route::get('logout', 'LoginController@logout');
/////////////////////////////////////////////////////////////////