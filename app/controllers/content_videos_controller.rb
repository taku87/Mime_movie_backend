class ContentVideosController < ApplicationController
  before_action :set_content_video, only: %i[ show edit update destroy ]

  # GET /content_videos or /content_videos.json
  def index
    @content_videos = ContentVideo.all
  end

  # GET /content_videos/1 or /content_videos/1.json
  def show
  end

  # GET /content_videos/new
  def new
    @content_video = ContentVideo.new
  end

  # GET /content_videos/1/edit
  def edit
  end

  # POST /content_videos or /content_videos.json
  def create
    @content_video = ContentVideo.new(content_video_params)

    respond_to do |format|
      if @content_video.save
        format.html { redirect_to content_video_url(@content_video), notice: "Content video was successfully created." }
        format.json { render :show, status: :created, location: @content_video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /content_videos/1 or /content_videos/1.json
  def update
    respond_to do |format|
      if @content_video.update(content_video_params)
        format.html { redirect_to content_video_url(@content_video), notice: "Content video was successfully updated." }
        format.json { render :show, status: :ok, location: @content_video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /content_videos/1 or /content_videos/1.json
  def destroy
    @content_video.destroy

    respond_to do |format|
      format.html { redirect_to content_videos_url, notice: "Content video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_video
      @content_video = ContentVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_video_params
      params.fetch(:content_video, {})
    end
end
