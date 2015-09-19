<?php

class LoginController extends BaseController
{
	public function showLogin1()
	{
		return View::make('login1');
	}

	public function showLogin2()
	{
		return View::make('login2');
	}

	public function showLogin_requst()
	{
		$input = Input::all();
		$rules = array(
							'login_name'	=>	'required',
							'password'		=>	'required'
						);
		$v = Validator::make($input,$rules);
		if($v->fails())		//Validation failed
		{
			return Redirect::to('login'.$input['company_id'])->withInput()->withErrors($v);
		}
		else
		{									//Loggin in a user
			$credentials = array(						//Names hould be as in DB columns
									'login_name'	=> $input['login_name'] ,
									'companyID'		=> $input['company_id'] ,
									'password'		=> $input['password']
								);
			//return $credentials;
			if (Auth::attempt($credentials))		//Authintication OK
			{
				return "Successfully Logged In !!!!! <br/> Company ID = ".Auth::user()->companyID;
				return Redirect::to('/');
			}
			else
			{
				return Redirect::to('login'.$input['company_id'])->withErrors(array('Wrong LoginName, Password or Company'));
			}
		}
	}

	public function register()
	{
		$company = DB::table('company')->select('id', 'name')->get();
		return View::make('register')->with('company', $company);
	}

	public function register_requst()
	{
		$input = Input::all();;
		$rules = array(
							'first_name'	=>	'required',
							'last_name'		=>	'required',
							'username'		=>	'required',
							'login_name'	=>	'required|unique:users',
							'email'			=>	'required|email',
							'password'		=>	'required'
						);
		$v = Validator::make($input,$rules);
		if($v->passes())
		{
			$user = new User();										//Registering a user

			$user->first_name	= $input['first_name'];
			$user->last_name	= $input['last_name'];
			$user->username		= $input['username'];
			$user->login_name	= $input['login_name'];
			$user->email		= $input['email'];
			$user->password		= Hash::make($input['password']);
			$user->companyID	= $input['companyID'];
			$user->permission	= $input['permission'];
			$user->status		= $input['status'];

			$user->save();

			if($input['companyID']!=0)
				return Redirect::to('login'.$input['companyID']);
			else
				return Redirect::to('login1');
		}
		else
		{
			return Redirect::to('register')->withInput()->withErrors($v);
		}
	}

	public function logout()
	{
		Auth::logout();
		return Redirect::to('login1');
	}
}