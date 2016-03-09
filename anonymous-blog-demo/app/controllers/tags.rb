get '/tags/:id' do
  @tags = Tag.all
  erb :'/tags/show'
end
