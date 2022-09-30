class Api::V1::User::ContentVideoCommentsController < SecuredController
  before_action :set_content_video_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    #authorize([:user, Comment])
    comments = Comment.all
    render json: comments, status: :ok
    #status: :okを深掘り
  end

  # GET /comments/1 or /comments/1.json
  def show
    #authorize([:user, Comment])
    comment = @comment
    render json: comment, status: :ok
  end

  #おそらくnewという概念がいらない！
  # GET /comments/new
  #def new
    #authorize([:user, Comment])
  #  @comment = Comment.new
  #end

  # GET /comments/1/edit
  def edit
    #authorize([:user, Comment])
    comment = @comment
    render json: comment, status: :ok
  end

  # POST /comments or /comments.json
  def create
    #authorize([:user, Comment])
    content_video = ContentVideo.find(params[:content_video_id])
    comment = current_user.comments.build(content_video_comment_params.merge(content_id: content_video.id))
    ActiveRecord::Base.transaction do
      comment.save!
    end
    head :ok
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    #authorize([:user, Comment])
    @comment.update!(content_video_comment_params)
    head :ok
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    #authorize([:user, Comment])
    @comment.destroy!
    head :ok
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_content_video_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_video_comment_params
      params.require(:comment).permit(:body)
    end
end
