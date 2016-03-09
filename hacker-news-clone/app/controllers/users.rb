get '/register' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    flash[:message] = "Account created!"
    redirect '/'
  else
    flash[:message] = "Failed to make account."
    redirect '/register'
  end
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user_params = params[:user]
  user = User.find_by(username: user_params[:username])
  if user && user.password == user_params[:password]
    session[:user_id] = user.id
    flash[:message] = "Successfully logged in!"
    redirect '/'
  else
    flash[:message] = 'Could not log in.'
    redirect '/login'
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  @posts = @user.posts.all
  @comments = @user.comments.all
  erb :'/users/show'
end

get '/logout' do
  session.clear
  flash[:message] = "Successfully logged out."
  redirect '/'
end
