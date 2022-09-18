class ContentVideoCommentsController < ApplicationController
  before_action :set_content_video_comment, only: %i[ show edit update destroy ]

  # GET /content_video_comments or /content_video_comments.json
  def index
    @content_video_comments = ContentVideoComment.all
  end

  # GET /content_video_comments/1 or /content_video_comments/1.json
  def show
  end

  # GET /content_video_comments/new
  def new
    @content_video_comment = ContentVideoComment.new
  end

  # GET /content_video_comments/1/edit
  def edit
  end

  # POST /content_video_comments or /content_video_comments.json
  def create
    @content_video_comment = ContentVideoComment.new(content_video_comment_params)

    respond_to do |format|
      if @content_video_comment.save
        format.html { redirect_to content_video_comment_url(@content_video_comment), notice: "Content video comment was successfully created." }
        format.json { render :show, status: :created, location: @content_video_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_video_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_video_comments/1 or /content_video_comments/1.json
  def update
    respond_to do |format|
      if @content_video_comment.update(content_video_comment_params)
        format.html { redirect_to content_video_comment_url(@content_video_comment), notice: "Content video comment was successfully updated." }
        format.json { render :show, status: :ok, location: @content_video_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content_video_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_video_comments/1 or /content_video_comments/1.json
  def destroy
    @content_video_comment.destroy

    respond_to do |format|
      format.html { redirect_to content_video_comments_url, notice: "Content video comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_video_comment
      @content_video_comment = ContentVideoComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_video_comment_params
      params.require(:comment).permit(:body).merge(content_video_id: params[:content_video_id])
    end
end
