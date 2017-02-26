get '/users' do
  @user = User.new
  erb :'/users/home.html'
end

post '/users' do
  @user = User.create(params[:user])
  if @user.valid?
    login
    # session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/home.html'
  end
end

get '/users/:id'  do
  @user = User.find(params[:id])
  if session[:user_id] != @user.id
    redirect '/sessions/login.html'
  end
  # login
  erb :'/users/show.html'
end
