module Authors
  class PostsController < AuthorsController
    before_action :set_post, only: %i[ edit update destroy ]
  
    # GET /posts
    # def index
    #   @posts = current_author.posts
    # end
    def index
      para = params[:key]
  
      if para != nil
        @posts = current_author.posts.where("title LIKE ?","%"+(para.capitalize)+"%").order(created_at: :desc)
      else
        @posts = current_author.posts.order(created_at: :desc)
      end
    end  
  
    # GET /posts/new
    def new
      @post = current_author.posts.build
    end
  
    # GET /posts/1/edit
    def edit
      @element = @post.elements.build
    end
  
    # POST /posts
    def create
      @post = current_author.posts.build(post_params)
  
      if @post.save
        redirect_to edit_post_path(@post)
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /posts/1
    def update
      if @post.update(post_params)
        redirect_to edit_post_path(@post)
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    # DELETE /posts/1
    def destroy
      @post.destroy
      redirect_to post_url
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = current_author.posts.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :description, :header_image)
      end
  end  
end