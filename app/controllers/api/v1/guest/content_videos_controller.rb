class Api::V1::Guest::ContentVideosController < SecuredController
  before_action :set_content_video, only: %i[ show edit update destroy ]
  skip_before_action :authorize_request

  # GET /content_videos or /content_videos.json
  def index
    content_videos = ContentVideo.all
    render_json = ContentVideoGuestSerializer.new(content_videos).serializable_hash.to_json
    render json: render_json, status: :ok
    #status: :okを深掘り
  end

  # GET /content_videos/1 or /content_videos/1.json
  def show
    content_video = @content_video
    render_json = ContentVideoGuestSerializer.new(content_video).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  private

    def set_content_video
      @content_video = ContentVideo.find(params[:id])
    end

end
