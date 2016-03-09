get '/posts/:id/comments/new' do
  @post = Post.find(params[:id])
  erb :'/comments/new'
end

post '/posts/:id/comments' do 
  user = User.find_by(id: session[:user_id])
  post = user.posts.find(params[:id])
  comment = post.comments.new(user_id: user.id, content: params[:comment][:content])
  if comment.save
    flash[:message] = "Comment added."
    redirect "/posts/#{post.id}/comments"
  else
    flash[:message] = "Failed to create comment."
    redirect "/posts/#{post.id}/comments"
  end
end

post '/posts/:post_id/comments/:id/upvote' do
  user = User.find(session[:user_id])
  post = user.posts.find(params[:post_id])
  comment = post.comments.find(params[:id])
  comment_votes = comment.comment_votes.build(vote_count: 1)
  if comment_votes.save
    if request.xhr?
      erb :'/comments/_vote_count', layout: false, locals: { comment: comment }
    else
      redirect "/posts/#{post.id}/comments"
    end
  end
end
