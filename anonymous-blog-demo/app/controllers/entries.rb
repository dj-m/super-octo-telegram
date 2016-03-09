get '/entries' do
  @tag = Tag.find_by(params[:id])
  @entries = Entry.all
  erb :'index'
end

get '/entries/new' do
  @entry = Entry.new
  @tag = Tag.new
  erb :'/entries/new'
end

post '/entries' do
  user = User.find_by(id: session[:user_id])
  entry = user.entries.new(params[:entry])
  tag = entry.tags.new(params[:tag])
  if entry.save && tag.save
    redirect '/entries'
  else
    flash[:error] = 'Failed to create post'
    redirect '/entries'
  end
end

get '/entries/:id' do
  @entry = Entry.find_by(id: params[:id])
  erb :'/entries/show'
end

get '/entries/:id/edit' do
  @entry = Entry.find_by(id: params[:id])
  erb :'/entries/edit'
end

put '/entries/:id' do
  entry = Entry.find_by(id: params[:id])
  tag = entry.tags.find_by(id: params[:id])
  entry.update(params[:entry])
  redirect '/entries'
end

delete '/entries/:id' do
  entry = Entry.find_by(id: params[:id])
  entry.destroy
  flash[:error] = "entry deleted"
  redirect '/entries'
end
