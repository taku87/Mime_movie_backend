class Api::V1::User::ContentVideosController < SecuredController
  before_action :set_content_video, only: %i[ show edit update destroy ]
  skip_before_action :authorize_request, only: [:index,:show]


  # GET /content_videos or /content_videos.json
  def index
    #authorize([:user, ContentVideo])
    content_videos = ContentVideo.all
    render json: content_videos, status: :ok
    #status: :okを深掘り
  end

  # GET /content_videos/1 or /content_videos/1.json
  def show
    #authorize([:user, ContentVideo])
    content_video = @content_video
    render json: content_video, status: :ok
  end

  #おそらくnewという概念がいらない！
  # GET /content_videos/new
  #def new
    #authorize([:user, ContentVideo])
  #  @content_video = ContentVideo.new
  #end

  # GET /content_videos/1/edit
  def edit
    #authorize([:user, ContentVideo])
    content_video = @content_video
    render json: content_video, status: :ok
  end

  # POST /content_videos or /content_videos.json
  def create
    #authorize([:user, ContentVideo])
    content_video = ContentVideo.new(content_video_params)
    ActiveRecord::Base.transaction do
      content_video.save!
    end
    head :ok
  end

  # PATCH/PUT /content_videos/1 or /content_videos/1.json
  def update
    #authorize([:user, ContentVideo])
    @content_video.update!(content_video_params)
    head :ok
  end

  # DELETE /content_videos/1 or /content_videos/1.json
  def destroy
    #authorize([:user, ContentVideo])
    @content_video.destroy!
    head :ok
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_content_video
      @content_video = ContentVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_video_params
      params.require(:content_video).permit(:number, :title, :description)
    end
end
