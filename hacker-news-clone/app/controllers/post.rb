get '/posts' do
  @posts = Post.all
  erb :index
end

get '/posts/new' do
  @post = Post.new
  erb :'/posts/new'
end

post '/posts' do
  user = User.find(session[:user_id])
  post = user.posts.create(params[:post])
  redirect '/'
end

get '/posts/:id/comments' do
  @post = Post.find(params[:id])
  @comments = @post.comments.all
  erb :'/posts/show'
end

post '/posts/:id/upvote' do
  user = User.find(session[:user_id])
  post = user.posts.find(params[:id])
  post_vote = post.post_votes.build(vote_count:1)
  if post_vote.save
    if request.xhr?
      erb :'/posts/_vote_count', layout: false, locals: { post: post }
    else
      redirect '/'
    end
  end
end
