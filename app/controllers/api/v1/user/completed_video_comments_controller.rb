#今後開発予定の機能

class Api::V1::User::CompletedVideoCommentsController < SecuredController
  before_action :set_completed_video_comment, only: %i[ show edit update destroy ]
  # GET /comments or /comments.json
  def index
    comments = Comment.all
    render json: comments, status: :ok
  end

  # GET /comments/1 or /comments/1.json
  def show
    comment = @comment
    render json: comment, status: :ok
  end

  # POST /comments or /comments.json
  def create
    completed_video = CompletedVideo.find(params[:completed_video_id])
    comment = current_user.comments.build(completed_video_comment_params.merge(completed_id: completed_video.id))
    ActiveRecord::Base.transaction do
      comment.save!
    end
    head :ok
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment.update!(completed_video_comment_params)
    head :ok
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!
    head :ok
  end

  private

    def set_completed_video_comment
      @comment = Comment.find(params[:id])
    end

    def completed_video_comment_params
      params.require(:comment).permit(:body)
    end
end
