<!DOCTYPE html>
<html lang="en">
<head>
  <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</head>
<body>

<!-- Error Showing - Comes from form Validation -->
  @if($errors->any())
    <div class="alert alert-danger">
      
      {{ implode('', $errors->all('<li class="error">:message</li>'))}}
    </div>
    
  @endif

  <div class="container">
    {{ Form::open(array('url' => 'register', 'method' => 'POST', 'role' => 'form')) }}
      <div class="form-group">
        <label for="usr">First Name:</label>
        {{ Form:: text('first_name', '', array('placeholder' => 'First Name', 'class' => 'form-control')) }}
      </div>

      <div class="form-group">
        <label for="usr">Last Name:</label>
        {{ Form:: text('last_name', '', array('placeholder' => 'Last Name', 'class' => 'form-control')) }}
      </div>

      <div class="form-group">
        <label for="usr">Other Name:</label>
        {{ Form:: text('username', '', array('placeholder' => 'Short Name', 'class' => 'form-control')) }}
      </div>

      <div class="form-group">
        <label for="usr">Login Name:</label>
        {{ Form:: text('login_name', '', array('placeholder' => 'Login Name', 'class' => 'form-control')) }}
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
        {{ Form:: email('email', '', array('placeholder' => 'Email', 'class' => 'form-control')) }}
      </div>

      <div class="form-group">
        <label for="pwd">Password:</label>
        {{ Form::password('password', array('placeholder' => 'Password', 'class' => 'form-control'))}}
      </div>

      <div class="form-group">
        <label for="pwd">Company:</label>
        <select name="companyID" class="form-control">
          @foreach ($company as $s)
            <option value={{ $s->id }}>{{ $s->name }}</option>
          @endforeach
        </select>
      </div>

      <div class="form-group">
        <label for="pwd">User Type:</label>
        <select name="permission" class="form-control">
          <option value="-1">Normal User</option>
          <option value="1">Admin</option>
        </select>
      </div>

      <input type="hidden" name="status" value="1">

      <button type="button" class="btn btn-info"> <a href="login1">Login Company 1</a> </button>
      <button type="button" class="btn btn-info"> <a href="login2">Login Company 2</a> </button>
      <button type="submit" class="btn btn-default">Register</button>
    {{ Form::close() }}

</body>
</html>
