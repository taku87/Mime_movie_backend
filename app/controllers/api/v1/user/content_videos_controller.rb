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

  #管理画面開発時用のメソッド
  # POST /content_videos or /content_videos.json
  def create
    @content_video = ContentVideo.new(content_video_params)
    authorize @content_video
    ActiveRecord::Base.transaction do
      content_video.save!
    end
    head :ok
  end

  #管理画面開発時用のメソッド
  # PATCH/PUT /content_videos/1 or /content_videos/1.json
  def update
    set_content_video
    authorize @content_video
    @content_video.update!(content_video_params)
    head :ok
  end

  #管理画面開発時用のメソッド
  # DELETE /content_videos/1 or /content_videos/1.json
  def destroy
    set_content_video
    authorize @content_video
    @content_video.destroy!
    head :ok
  end

  private

    def set_content_video
      @content_video = ContentVideo.find(params[:id])
    end

    def content_video_params
      params.require(:content_video).permit(:number, :title, :description)
    end
end
