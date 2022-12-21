class Api::V1::User::ContentVideosController < SecuredController
  before_action :set_content_video, only: %i[ show update destroy ]
  before_action :authorize_request, except: [:show]

  # GET /content_videos or /content_videos.json
  def index
    content_videos = ContentVideo.all
    render_json = ContentVideoSerializer.new(content_videos, current_user: current_user).serializable_hash.to_json
    render json: render_json, status: :ok
    #status: :okを深掘り
  end

  # GET /content_videos/1 or /content_videos/1.json
  def show
    content_video = @content_video
    render_json = ContentVideoSerializer.new(content_video).serializable_hash.to_json
    render json: render_json, status: :ok
  end

  private

    def set_content_video
      @content_video = ContentVideo.find(params[:id])
    end

    def content_video_params
      params.require(:content_video).permit(:number, :title, :description)
    end
end
