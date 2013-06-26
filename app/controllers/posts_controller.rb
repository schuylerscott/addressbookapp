class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to action: :show, id: @post.id
    else
      render 'new'
    end    
  end

  def show
    @post = Post.find_by_id(params[:id].to_i)
  end  

  def index
    @posts = Post.all
  end    

  def edit
    @post = Post.find(params[:id])
  end
  
  #<td><%= link_to 'Edit', edit_post_path(post) %></td>
  #Invalid path option in index.html.erb
  
  def update
    @post = Post.find(params[:id])
 
    if @post.update(params[:post].permit(:title, :text))
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
 
    redirect_to posts_path
  end
  
  private
    def post_params
      params.require(:post).permit(:title, :text)
    end
end