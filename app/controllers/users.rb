get '/users/new' do
	erb :"static/user_new"
end

post '/signup' do
  user = User.new(params[:user])
  if user.save
  	@success = "Successfully signed up!"
  	erb :"static/index"  
  else
  	@signup_error = "Failed to sign up"
  	erb :"static/user_new"  
  end
end  