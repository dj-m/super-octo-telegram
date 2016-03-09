get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    flash[:error] = "Failed to register"
    redirect '/'
  end
end

get '/users/:id/entries' do
  @user = User.find_by(id: params[:id])
  erb :'/users/show'
end

get '/login' do
  erb :'/users/login'
end

post '/login' do
  user_params = params[:user]
  user = User.find_by(username: user_params[:username])
  if user && user.password == user_params[:password]
    session[:user_id] = user.id
    flash[:error] = "Successfully logged in!"
    redirect '/'
  else
    flash[:error] = "Mismatched username/password."
    redirect '/login'
  end
end

get '/users/logout' do
  session.clear
  flash[:error] = "Logged out."
  redirect '/entries'
end
