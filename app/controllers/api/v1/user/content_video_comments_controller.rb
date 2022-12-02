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
    render json: comment, status: :ok
  end

  # POST /comments or /comments.json
  def create
    #authorize([:user, Comment])
    set_content_video
    comment = current_user.content_video_comments.build(content_video_comment_params)
    ActiveRecord::Base.transaction do
      comment.save!
    end
    head :ok
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    #authorize([:user, Comment])
    comment.update!(content_video_comment_params)
    head :ok
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    #authorize([:user, Comment])
    comment.destroy!
    head :ok
  end

  private

    def set_content_video
      content_video = ContentVideo.find(params[:content_video_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_content_video_comment
      comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_video_comment_params
      params.permit(:body, :content_video_id)
    end
end

#require(:content_video_comment)