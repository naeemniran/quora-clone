enable :sessions

get '/' do
  erb :"static/index"
end



post '/login' do
  user = User.find_by(email: params[:user][:email])
  if user && user.try(:authenticate, params[:user][:password])
  	# loginn this fella
  	session[:user_id] = user.id
  	redirect '/'
  else
  	@login_error = "Invalid credentials"
  	erb :"static/index"
  	# show invalid credentials
  end
  # apply a authentication method to check if a user has entered a valid email and password
  # if a user has successfully been authenticated, you can assign the current user id to a session
end

post '/logout' do
	session[:user_id] = nil

	@logout = "Thank you for using me ;)"

	redirect '/'
  # kill a session when a user chooses to logout, for example, assign nil to a session
  # redirect to the appropriate page
end