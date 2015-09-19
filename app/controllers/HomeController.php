<?php

class HomeController extends BaseController
{
	public function showWelcome()
	{
		return View::make('hello');
	}

	public function getNew()
	{
		$cars = array(12, "BMW", "Toyota",array("Volvo", 123, "Toyota",array("Volvo", "BMW", "Toyota")));
		return $cars;
	}
}
